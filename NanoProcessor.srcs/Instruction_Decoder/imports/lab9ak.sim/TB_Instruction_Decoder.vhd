----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.07.2022 03:36:20
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

    Component Instruction_Decoder
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
    End Component;
    
    signal Ins : STD_LOGIC_VECTOR (11 downto 0);
    signal RegJmp, ImVal : STD_LOGIC_VECTOR (3 downto 0);
    signal RegEn, RegSel1, RegSel2, AddressJmp : STD_LOGIC_VECTOR (2 downto 0);
    signal LoadSel, AddSubSel, Jmp : STD_LOGIC;
    
begin
    UUT: Instruction_Decoder
        Port Map(
            Ins => Ins,
            RegJmp => RegJmp,
            RegEn => RegEn,
            LoadSel => LoadSel,
            ImVal => ImVal,
            RegSel1 => RegSel1,
            RegSel2 => RegSel2,
            AddSubSel => AddSubSel,
            Jmp => Jmp,
            AddressJmp => AddressJmp
        );

    Process begin
        Ins <= "100010000001";
        RegJmp <= "0000";
        wait for 140ns;
        
        Ins <= "100100000010";
        wait for 140ns;
        
        Ins <= "101110000011";
        wait for 140ns;
        
        Ins <= "001110100000";
        wait for 140ns;
                
        Ins <= "001110010000";
        wait for 140ns;
        
        Ins <= "110000000111";
        wait for 140ns;
        
        Ins <= "110000000101";
        wait;
        
    End process;

end Behavioral;
