----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 08:55:51 AM
-- Design Name: 
-- Module Name: TB_Program_Rom - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Program_Rom is
--  Port ( );
end TB_Program_Rom;

architecture Behavioral of TB_Program_Rom is

component Program_Rom
    Port ( memory_select : in STD_LOGIC_VECTOR (2 downto 0);
           instruction_bus : out STD_LOGIC_VECTOR (11 downto 0));   
end component;

signal memory_select : STD_LOGIC_VECTOR (2 downto 0);
signal instruction_bus : STD_LOGIC_VECTOR (11 downto 0);

begin
UUT: Program_Rom
    port map(
        memory_select => memory_select,
        instruction_bus => instruction_bus
    );

process

begin

memory_select <= "000";
wait for 100ns;
memory_select <= "001";
wait for 100ns;
memory_select <= "010";
wait for 100ns;
memory_select <= "011";
wait for 100ns;
memory_select <= "100";
wait for 100ns;
memory_select <= "101";
wait for 100ns;
memory_select <= "110";
wait for 100ns;
memory_select <= "111";
wait;

end process;



end Behavioral;
