library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comm is port(
    clk : in std_logic;
    out_data : out std_logic;
    result : out std_logic_vector(15 downto 0);
    right_jstk : in std_logic_vector(9 downto 0);
    left_jstk : in std_logic_vector(9 downto 0)
	 );
end comm;

architecture Behavioral of comm is
    --constant start_code : std_logic_vector(9 downto 0) := "1001110101";  -- Código de inicio
    --constant end_code : std_logic_vector(9 downto 0) := "1001010111";    -- Código de fin
	 signal sclk_pwm : std_logic := '0';
    signal clock_commFpga : std_logic := '0';
    signal cont_commFpga : integer := 1;
    signal bit_index : integer range 0 to 33 := 0;  -- Incrementamos el rango para incluir inicio, datos y fin
    signal serial_data : std_logic := '1';
    signal byte_received : std_logic_vector(15 downto 0) := "0000000000000000";
    signal byte_sent : std_logic_vector(15 downto 0) := "0000000000000000";
	 constant div_freq : integer := 10000;
begin

sclk_pwm <= clk;
out_data <= serial_data;

--           right
--           Yaxis Xaxis
-- byte_sent "0000-0000"
--
-- Right Joystick array "0000"
-- Y axis:
-- bit7, bit6, bit5, bit4
-- psh1  '0'   '1'    '0'   -> centro
--       '1'   '1'    '0'   -> 50% arriba
--       '0'   '1'    '1'   -> 50% abajo
--       '1'   '0'    '0'   -> 100% arriba
--       '0'   '0'    '1'   -> 100% abajo
-- X axis:
-- bit3, bit2, bit1, bit0
-- psh2  '0'   '1'    '0'   -> centro
--       '1'   '1'    '0'   -> 50% arriba
--       '0'   '1'    '1'   -> 50% abajo
--       '1'   '0'    '0'   -> 100% arriba
--       '0'   '0'    '1'   -> 100% abajo

----------- Sent data asignation for right joystick -----------
process(right_jstk, left_jstk) begin
	------------------ Push bttns
	if right_jstk(9) = '1' then
		 byte_sent(7) <= '1';
	else
		 byte_sent(7) <= '0';
	end if;
	if right_jstk(8) = '1' then
		 byte_sent(3) <= '1';
	else
		 byte_sent(3) <= '0';
	end if;
	------------------ Y axis
	if right_jstk(7 downto 4) = "1000" or right_jstk(7 downto 4) = "0111" then
		 -- Centro
		 byte_sent(6 downto 4) <= "010";
	elsif right_jstk(7 downto 4) = "1110" or right_jstk(7 downto 4) = "1101" then
		 -- 100% arriba
		 byte_sent(6 downto 4) <= "100";
	elsif right_jstk(7 downto 4) = "0010" or right_jstk(7 downto 4) = "0011" then
		 -- 100% abajo
		 byte_sent(6 downto 4) <= "001";
	elsif right_jstk(7 downto 4) > "1000" and right_jstk(7 downto 4) < "1101" then
		 -- 50% arriba
		 byte_sent(6 downto 4) <= "110";
	elsif right_jstk(7 downto 4) > "0011" and right_jstk(7 downto 4) < "1000" then
		 -- 50% abajo
		 byte_sent(6 downto 4) <= "011";  
	else
		 byte_sent(6 downto 4) <= "111";
	end if;
	------------------ X axis
	if right_jstk(3 downto 0) = "1000" or right_jstk(3 downto 0) = "0111" then
		 -- Centro
		 byte_sent(2 downto 0) <= "010";
	elsif right_jstk(3 downto 0) = "1110" or right_jstk(3 downto 0) = "1101" then
		 -- 100% arriba
		 byte_sent(2 downto 0) <= "100";
	elsif right_jstk(3 downto 0) = "0010" or right_jstk(3 downto 0) = "0011" then
		 -- 100% abajo
		 byte_sent(2 downto 0) <= "001";
	elsif right_jstk(3 downto 0) > "1000" and right_jstk(3 downto 0) < "1101" then
		 -- 50% arriba
		 byte_sent(2 downto 0) <= "110";
	elsif right_jstk(3 downto 0) > "0011" and right_jstk(3 downto 0) < "1000" then
		 -- 50% abajo
		 byte_sent(2 downto 0) <= "011";
	else
	 	 byte_sent(2 downto 0) <= "111";
	end if;

	----------- Sent data asignation for left joystick -----------
	------------------ Push bttns
	if left_jstk(9) = '1' then
		 byte_sent(15) <= '1';
	else
		 byte_sent(15) <= '0';
	end if;
	if left_jstk(8) = '1' then
		 byte_sent(11) <= '1';
	else
		 byte_sent(11) <= '0';
	end if;
	------------------ Y axis
	if left_jstk(7 downto 4) = "1000" or left_jstk(7 downto 4) = "0111" then
		 -- Centro
		 byte_sent(14 downto 12) <= "010";
	elsif left_jstk(7 downto 4) = "1110" or left_jstk(7 downto 4) = "1101" then
		 -- 100% arriba
		 byte_sent(14 downto 12) <= "100";
	elsif left_jstk(7 downto 4) = "0010" or left_jstk(7 downto 4) = "0011" then
		 -- 100% abajo
		 byte_sent(14 downto 12) <= "001";
	elsif left_jstk(7 downto 4) > "1000" and left_jstk(7 downto 4) < "1101" then
		 -- 50% arriba
		 byte_sent(14 downto 12) <= "110";
	elsif left_jstk(7 downto 4) > "0011" and left_jstk(7 downto 4) < "1000" then
		 -- 50% abajo
		 byte_sent(14 downto 12) <= "011";
	else
		byte_sent(14 downto 12) <= "111";
	end if;
	------------------ X axis
	if left_jstk(3 downto 0) = "1000" or left_jstk(3 downto 0) = "0111" then
		 -- Centro
		 byte_sent(10 downto 8) <= "010";
	elsif left_jstk(3 downto 0) = "1110" or left_jstk(3 downto 0) = "1101" then
		 -- 100% arriba
		 byte_sent(10 downto 8) <= "100";
	elsif left_jstk(3 downto 0) = "0010" or left_jstk(3 downto 0) = "0011" then
		 -- 100% abajo
		 byte_sent(10 downto 8) <= "001";
	elsif left_jstk(3 downto 0) > "1000" and left_jstk(3 downto 0) < "1101" then
		 -- 50% arriba
		 byte_sent(10 downto 8) <= "110";
	elsif left_jstk(3 downto 0) > "0011" and left_jstk(3 downto 0) < "1000" then
		 -- 50% abajo
		 byte_sent(10 downto 8) <= "011";
	else
		 byte_sent(10 downto 8) <= "111";
	end if;
end process;


-- Generar la señal de reloj para la comunicación
process (sclk_pwm) begin
    if sclk_pwm'event and sclk_pwm = '1' then
        if cont_commFpga = div_freq then --1000
            clock_commFpga <= not clock_commFpga;
            cont_commFpga <= 1;
        else                                    
            cont_commFpga <= cont_commFpga + 1;
        end if;
    end if;
end process;

-- Comunicación del maestro
process(clock_commFpga)
begin
    if rising_edge(clock_commFpga) then
        if bit_index = 0 then
            -- Enviar el código de inicio
            serial_data <= '0';
            byte_received <= byte_received;
        elsif bit_index >= 1 and bit_index < 17 then
            serial_data <= byte_sent(bit_index - 1);
            byte_received(bit_index - 1) <= byte_sent(bit_index - 1);
            result <= "0000000000000000";
        elsif bit_index >= 17 then
            -- Enviar el código de fin
            serial_data <= '1';
			result <= byte_received;
        end if;

        -- Incrementar el índice del bit
        if bit_index >= 33 then
            bit_index <= 0;
        else
            bit_index <= bit_index + 1;
        end if;
    end if;
end process;

end Behavioral;
