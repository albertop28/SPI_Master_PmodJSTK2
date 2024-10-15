library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comm is port(
	clk : in std_logic;
	out_data : out std_logic;
	result : out std_logic_vector(19 downto 0);
	right_jstk : in std_logic_vector(9 downto 0);
	left_jstk : in std_logic_vector(9 downto 0));
end comm;

architecture Behavioral of comm is
	signal sclk_pwm : std_logic := '0';
	signal clock_commFpga : std_logic := '0';
	signal cont_commFpga : integer := 1;
	signal bit_index : integer range 0 to 19 := 0;
	signal serial_data : std_logic;
	signal byte_received : std_logic_vector(19 downto 0) := "00000000000000000000";
begin

sclk_pwm <= clk;
out_data <= serial_data;

process (sclk_pwm) begin
	if sclk_pwm'event and sclk_pwm = '1' then
		if cont_commFpga = 100 then
			clock_commFpga <= not clock_commFpga;
			cont_commFpga <= 1;
		else									
			cont_commFpga <= cont_commFpga + 1;
		end if;
	end if;
end process;

--------------------------------Comm FPGA--------------------------------
process(clock_commFpga)
begin
	if rising_edge(clock_commFpga) then
		if bit_index < 10 then                          		-- Enviar los datos del joystick derecho (right_jstk)
			serial_data <= right_jstk(bit_index);
			byte_received(bit_index) <= right_jstk(bit_index);
			result <= "00000000000000000000";
		elsif bit_index >=  10 and bit_index <= 19 then  	-- Enviar los datos del joystick izquierdo (left_jstk)
			serial_data <= left_jstk(bit_index - 10);
			byte_received(bit_index) <= left_jstk(bit_index - 10);
			result <= "00000000000000000000";
		else
			result <= byte_received;
		end if;
----------------------------------------------------------------
		if bit_index = 20 then
			bit_index <= 0;
		else
			bit_index <= bit_index + 1;
		end if;
	end if;
end process;


end Behavioral;

