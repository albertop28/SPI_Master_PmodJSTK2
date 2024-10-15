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
    signal bit_index : integer range 0 to 39 := 0;  -- Incrementamos el rango para incluir inicio, datos y fin
    signal serial_data : std_logic;
    signal byte_received : std_logic_vector(19 downto 0) := "00000000000000000000";
    constant start_code : std_logic_vector(9 downto 0) := "1001110101";  -- Código de inicio
    constant end_code : std_logic_vector(9 downto 0) := "1001010111";    -- Código de fin
begin

sclk_pwm <= clk;
out_data <= serial_data;

-- Generar la señal de reloj para la comunicación
process (sclk_pwm) begin
    if sclk_pwm'event and sclk_pwm = '1' then
        if cont_commFpga = 1000 then --1000
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
        if bit_index < 10 then
            -- Enviar el código de inicio
            serial_data <= start_code(bit_index);
				byte_received <= byte_received;
        elsif bit_index >= 10 and bit_index < 30 then -- Enviar los datos del joystick (derecho primero, luego izquierdo)
            if bit_index < 20 then
                serial_data <= right_jstk(bit_index - 10);
                byte_received(bit_index - 10) <= right_jstk(bit_index - 10);
            elsif bit_index >= 20 and bit_index < 30 then
                serial_data <= left_jstk(bit_index - 20);
                byte_received(bit_index - 10) <= left_jstk(bit_index - 20);
            end if;
            result <= "00000000000000000000";
        elsif bit_index >= 30 and bit_index < 40 then
            -- Enviar el código de fin
            serial_data <= end_code(bit_index - 30);
				result <= byte_received;
        end if;

        -- Incrementar el índice del bit
        if bit_index = 39 then
            bit_index <= 0;
        else
            bit_index <= bit_index + 1;
        end if;
    end if;
end process;

end Behavioral;
