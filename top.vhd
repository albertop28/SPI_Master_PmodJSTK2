library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Top_SPI is port(
	clk : in std_logic;
	miso_1 : in std_logic;
	miso_2 : in std_logic;
	cs_1, mosi_1, sclk_1 : out std_logic;
	cs_2, mosi_2, sclk_2 : out std_logic;
   serial_data_comm : out std_logic;
	result_comm : out std_logic_vector(19 downto 0)
	);
end Top_SPI;

architecture Behavioral of Top_SPI is
    -- Señales para interconectar las instancias del Master_SPI
	 signal joystick_der, joystick_izq : std_logic_vector(9 downto 0);
    signal LED_Data_1_1, LED_Data_2_1 : std_logic_vector(3 downto 0) := "0000";
    signal LED_Data_1_2, LED_Data_2_2 : std_logic_vector(3 downto 0) := "0000";
	 signal push_der, push_izq : std_logic_vector(1 downto 0) := "00";
	 signal clk_s1, clk_s2: std_logic := '0';
begin

clk_s1 <= clk;
clk_s2 <= clk;

-- Instancia joystick_1 de Master_SPI
SPI_1: entity work.Master_SPI port map(
	-- inputs:
	clk => clk_s1,
	reset_n => '0',
	miso => miso_1,
	-- outputs:
	mosi => mosi_1,
	cs1 => cs_1,
	sclk => sclk_1,
	LED_Data_1 => LED_Data_1_1,
	LED_Data_2 => LED_Data_2_1,
	push_btns => push_der
);

-- Instancia joystick_2 de Master_SPI
SPI_2: entity work.Master_SPI port map(
	-- inputs:
	clk => clk_s2,
	reset_n => '0',
	miso => miso_2,
	-- outputs:
	mosi => mosi_2,
	cs1 => cs_2,
	sclk => sclk_2,
	LED_Data_1 => LED_Data_1_2,
	LED_Data_2 => LED_Data_2_2,
	push_btns => push_izq
);

-- Extracción de los 4 bits más importantes de LED_Data_1 y LED_Data_2 para cada joystick
joystick_der <= push_der & LED_Data_1_1 & LED_Data_2_1;
joystick_izq <= push_izq & LED_Data_1_2 & LED_Data_2_2;

-- Instancia envio de datos
FPGA_comm: entity work.comm port map(
	-- inputs:
	clk => clk_s1,
	right_jstk => joystick_der,
	left_jstk => joystick_izq,
	-- outputs:
	result => result_comm,
	out_data => serial_data_comm
);

end Behavioral;
