----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.07.2022 03:15:32
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           RegJmp : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSel : out STD_LOGIC;
           ImVal : out STD_LOGIC_VECTOR (3 downto 0);
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubSel : out STD_LOGIC;
           Jmp : out STD_LOGIC;
           AddressJmp : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin

RegEn <= Ins(9 downto 7);
LoadSel <=Ins(11) AND NOT(Ins(10));
ImVal <= Ins(3 downto 0);
RegSel1 <= Ins(9 downto 7);
RegSel2 <= Ins(6 downto 4);
AddSubSel <= NOT(Ins(11)) AND Ins(10);
AddressJmp <= Ins(2 downto 0);
Jmp <= Ins(11) AND Ins(10) AND NOT (RegJmp(3) OR RegJmp(2) OR RegJmp(1) OR RegJmp(0)); 

end Behavioral;
