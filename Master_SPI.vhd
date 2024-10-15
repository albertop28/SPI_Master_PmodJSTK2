library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Master_SPI is port(
	push_btns : out std_logic_vector(1 downto 0);
	mosi, cs1, sclk : out std_logic; 
	miso, clk, reset_n : in std_logic; 				--señales de entrada miso, reloj de fpga y reset
	LED_Data_1, LED_Data_2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end Master_SPI;

architecture Behavioral of Master_SPI is
	signal clk_signal, reloj: std_logic := '1';
	signal cont : integer := 1;
	signal cont_byte : integer := 0;
	signal byte_received : std_logic_vector(39 downto 0):= "0000000000000000000000000000000000000000";
	constant command_pos : std_logic_vector(7 downto 0):= "00000000";
	constant command_led_green : std_logic_vector(7 downto 0):= "10000001";
	constant div_freq_val : integer := 10000;
	begin

clk_signal <= clk;

---------------- Divisor de frecuencia maquina de estados ----------------
process(clk_signal) begin									--se crea un proceso que ocupa la variable clk (cristal oscilador)
	if clk_signal'event and clk_signal = '1' then	--cada que la variable clk cambie (de o a 1 o veceversa)
		if cont = div_freq_val then			 			--50MHz (de la Amiba2)/ 2 * frecuencia deseada (2500 Hz) = 10000
			reloj <= not reloj;								--la señal reloj se niega (como se inicializo en 0 ahora cambia a 1)
			cont <= 1;											--contador lo igualamos otra vez a 1 
		else									
			cont <= cont + 1;
		end if;
	end if;
end process;

--------------------------------Main process--------------------------------
process(reloj, reset_n) begin
	if reset_n = '1' then
		cs1 <= '1';
		sclk <= '0';
		mosi <= '0';
		--cont_byte <= 0;
		--byte_received <= "0000000000000000000000000000000000000000";
	else
		sclk <= reloj;
		if reloj'event and reloj = '0' then
			case cont_byte is
				when 0 | 10 =>
					cs1 <= '1';
					mosi <= '0';
					byte_received <= "0000000000000000000000000000000000000000";
					cont_byte <= cont_byte + 1;
				when 1 to 8 =>
					cs1 <= '0';
					mosi <= command_led_green(cont_byte-1);
					byte_received <= not "0000000000000000000000000000000000000000";
					cont_byte <= cont_byte + 1;
				when 9 =>
					cs1 <= '0';
					mosi <= '0';
					byte_received <= not "0000000000000000000000000000000000000000";
					cont_byte <= cont_byte + 1;
				when 11 to 18 =>
					cs1 <= '0';
					mosi <= command_pos(cont_byte-11);
					-- Shift bits
					byte_received <= byte_received(38 downto 0) & miso;
					cont_byte <= cont_byte + 1;
				when 51 =>
					cs1 <= '1';
					mosi <= '0';
					LED_Data_1 <= byte_received(9 downto 8) & byte_received(23 downto 22);
					LED_Data_2 <= byte_received(25 downto 24) & byte_received(39 downto 38);
					push_btns <= byte_received(1 downto 0);
					cont_byte <= 10;
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