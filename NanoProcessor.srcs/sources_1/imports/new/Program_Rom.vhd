----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 08:50:04 AM
-- Design Name: 
-- Module Name: Program_Rom - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Rom is
    Port ( memory_select : in STD_LOGIC_VECTOR (2 downto 0);
           instruction_bus : out STD_LOGIC_VECTOR (11 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
signal program_rom : rom_type := (

"100010000001",     --10 001 000 0001   MOVI R1,1
"100100000010",     --10 010 000 0010   MOVI R2,2
"101110000011",     --10 111 000 0011   MOVI R7,3
"001110100000",     --00 111 010 0000   ADD R7,R2
"001110010000",     --00 111 001 0000   ADD R7,R1
"110000000111",     --11 000 0000 111   JZR R0,7
"000000000000",     --00 000 000 0000   ADD R0,R0
"110000000101"      --11 000 0000 101   JZR R0,5

);
 
begin
 
instruction_bus <= program_rom(to_integer(unsigned(memory_select)));
end Behavioral;

