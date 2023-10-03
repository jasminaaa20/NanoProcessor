----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.07.2022 20:39:34
-- Design Name: 
-- Module Name: TB_Decoder_3_to_8 - Behavioral
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

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is

Component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           Y0 : out STD_LOGIC;
           Y1 : out STD_LOGIC;
           Y2 : out STD_LOGIC;
           Y3 : out STD_LOGIC;
           Y4 : out STD_LOGIC;
           Y5 : out STD_LOGIC;
           Y6 : out STD_LOGIC;
           Y7 : out STD_LOGIC);
End Component;

Signal I : STD_LOGIC_VECTOR (2 downto 0);
Signal Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7 : STD_LOGIC;

begin
    UUT: Decoder_3_to_8
        Port Map(
            I => I,
            Y0 => Y0,
            Y1 => Y1,
            Y2 => Y2,
            Y3 => Y3,
            Y4 => Y4,
            Y5 => Y5,
            Y6 => Y6,
            Y7 => Y7
        );

    Process Begin
        
        I <= "000";
        WAIT FOR 100NS;
        
        I <= "001";
        WAIT FOR 100NS;

        I <= "010";
        WAIT FOR 100NS;

        I <= "011";
        WAIT FOR 100NS;

        I <= "100";
        WAIT FOR 100NS;

        I <= "101";
        WAIT FOR 100NS;

        I <= "110";
        WAIT FOR 100NS;

        I <= "111";
        WAIT FOR 100NS;
        
    End Process;

end Behavioral;
