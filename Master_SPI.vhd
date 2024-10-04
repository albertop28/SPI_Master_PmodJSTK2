LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity Master_SPI is port(
	mosi, cs1, sclk, psh1, psh2 : out std_logic; --señales de salida mosi, ChipSelect y señal de reloj
	miso, clk, reset_n : in std_logic; --señales de entrada miso, reloj de fpga y reset
	LED_Data_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	LED_Data_2 : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end Master_SPI;

architecture Behavioral of Master_SPI is
	signal clk_signal, reloj: std_logic := '0';
	signal cont : integer := 1;
	signal byte_received : std_logic_vector(39 downto 0):= "0000000000000000000000000000000000000000";
	signal cont_byte : integer := 0;
	--signal pos_x, pos_y: std_logic_vector(7 downto 0):= "00000000";
	constant command_pos : std_logic_vector(7 downto 0):= "00000000";
	constant command_led_green : std_logic_vector(7 downto 0):= "10000001";
	--signal address : integer := 0;
begin

clk_signal <= clk;

----------------Divisor de frecuencia maquina de estados----------------
process(clk_signal) begin									--se crea un proceso que ocupa la variable clk (cristal oscilador)
	if clk_signal'event and clk_signal = '1' then	--cada que la variable clk cambie (de o a 1 o veceversa)
		if cont = 10000 then		 							--50MHz (de la Amiba2)/ 2 * frecuencia deseada (2500 Hz) 10000
			reloj <= not reloj;								--la señal reloj se niega (como se inicializo en 0 ahora cambia a 1)
			cont <= 1;											--contador lo igualamos otra vez a 1 
		else									
			cont <= cont + 1;	--en otro caso solo el contador se le suma un termino
		end if;
	end if;
end process;

--X: byte_received(17 downto 8)
--Y: byte_received(9 downto 0)

process(reloj, reset_n) begin
	if reset_n = '1' then
		cs1 <= '1';
		sclk <= '0';
		mosi <= '0';
	else --reset_n = '0' then
		sclk <= reloj;
		if reloj'event and reloj = '1' then
			if cont_byte = 48 then
				cont_byte <= 0;
				cs1 <= '1';
				mosi <= '0';
				byte_received <= byte_received;
				LED_Data_2(9 downto 8) <= byte_received(25 downto 24);
				LED_Data_2(7 downto 0) <= byte_received(39 downto 32);
				LED_Data_1(7 downto 6) <= byte_received(9 downto 8);
				LED_Data_1(5 downto 0) <= byte_received(23 downto 18);
				psh1 <= byte_received(0);
				psh2 <= byte_received(1);
				--pos_x <= byte_received(35 downto 28);
				--pos_y <= byte_received(23 downto 16);
			elsif cont_byte < 8 then
				cs1 <= '0';
				mosi <= command_pos(cont_byte);
				byte_received <= "0000000000000000000000000000000010101110";
				cont_byte <= cont_byte + 1;
			else
				cs1 <= '0';
				mosi <= '0';
				byte_received(0) <= miso;
				byte_received(1) <= byte_received(0);
				byte_received(2) <= byte_received(1);
				byte_received(3) <= byte_received(2);
				byte_received(4) <= byte_received(3);
				byte_received(5) <= byte_received(4);
				byte_received(6) <= byte_received(5);
				byte_received(7) <= byte_received(6);
				byte_received(8) <= byte_received(7);
				byte_received(9) <= byte_received(8);
				byte_received(10) <= byte_received(9);
				byte_received(11) <= byte_received(10);
				byte_received(12) <= byte_received(11);
				byte_received(13) <= byte_received(12);
				byte_received(14) <= byte_received(13);
				byte_received(15) <= byte_received(14);
				byte_received(16) <= byte_received(15);
				byte_received(17) <= byte_received(16);
				byte_received(18) <= byte_received(17);
				byte_received(19) <= byte_received(18);
				byte_received(20) <= byte_received(19);
				byte_received(21) <= byte_received(20);
				byte_received(22) <= byte_received(21);
				byte_received(23) <= byte_received(22);
				byte_received(24) <= byte_received(23);
				byte_received(25) <= byte_received(24);
				byte_received(26) <= byte_received(25);
				byte_received(27) <= byte_received(26);
				byte_received(28) <= byte_received(27);
				byte_received(29) <= byte_received(28);
				byte_received(30) <= byte_received(29);
				byte_received(31) <= byte_received(30);
				byte_received(32) <= byte_received(31);
				byte_received(33) <= byte_received(32);
				byte_received(34) <= byte_received(33);
				byte_received(35) <= byte_received(34);
				byte_received(36) <= byte_received(35);
				byte_received(37) <= byte_received(36);
				byte_received(38) <= byte_received(37);
				byte_received(39) <= byte_received(38);
				cont_byte <= cont_byte + 1;
			end if;
		end if;
	end if;
end process;

end Behavioral;

