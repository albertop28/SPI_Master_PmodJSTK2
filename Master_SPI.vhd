LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity Master_SPI is port(
	mosi, cs1, sclk, psh1, psh2 : out std_logic; --señales de salida mosi, ChipSelect y señal de reloj
	miso, clk, reset_n : in std_logic; --señales de entrada miso, reloj de fpga y reset
	LED_Data_1, LED_Data_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end Master_SPI;

architecture Behavioral of Master_SPI is
	signal clk_signal, reloj: std_logic := '0';
	signal cont : integer := 1;
	signal byte_received : std_logic_vector(39 downto 0):= "0000000000000000000000000000000000000001";
	signal cont_byte : integer range 0 to 40 := 0;
	constant command_pos : std_logic_vector(7 downto 0):= "10000001";
	constant command_led_green : std_logic_vector(7 downto 0):= "00000011";
begin

clk_signal <= clk;

----------------Divisor de frecuencia maquina de estados----------------
process(clk_signal) begin									--se crea un proceso que ocupa la variable clk (cristal oscilador)
	if clk_signal'event and clk_signal = '1' then	--cada que la variable clk cambie (de o a 1 o veceversa)
		if cont = 10000 then			 						--50MHz (de la Amiba2)/ 2 * frecuencia deseada (2500 Hz) = 10000
			reloj <= not reloj;								--la señal reloj se niega (como se inicializo en 0 ahora cambia a 1)
			cont <= 1;											--contador lo igualamos otra vez a 1 
		else									
			cont <= cont + 1;
		end if;
	end if;
end process;

process(reloj, reset_n) begin
	if reset_n = '1' then
		cs1 <= '1';
		sclk <= '0';
		mosi <= '0';
	else --reset_n = '0' then
		sclk <= reloj;
		if reloj'event and reloj = '1' then
		case cont_byte is
			when 40 =>
				cs1 <= '1';
				mosi <= '0';
				LED_Data_1 <= byte_received(9 downto 8) & byte_received(23 downto 18);
            LED_Data_2 <= byte_received(25 downto 24) & byte_received(39 downto 34);
            psh1 <= byte_received(0);
            psh2 <= byte_received(1);
            cont_byte <= 0;
            --pos_x <= byte_received(35 downto 28);
            --pos_y <= byte_received(23 downto 16);
			when 0 to 7 =>
				cs1 <= '0';
				mosi <= command_pos(cont_byte);
            -- Shift bits
            byte_received <= byte_received(38 downto 0) & miso;
				cont_byte <= cont_byte + 1;
			when others =>
            cs1 <= '0';
            mosi <= '0';
            -- Shift bits
            byte_received <= byte_received(38 downto 0) & miso;
            cont_byte <= cont_byte + 1;
			end case;
		end if;
	end if;
end process;

end Behavioral;