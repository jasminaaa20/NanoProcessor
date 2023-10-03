----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.07.2022 17:42:39
-- Design Name: 
-- Module Name: TB_Mux_8_to_1 - Behavioral
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

entity TB_Mux_8_to_1 is
--  Port ( );
end TB_Mux_8_to_1;

architecture Behavioral of TB_Mux_8_to_1 is

Component Mux_4_8_to_1
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
End Component;

Signal S : STD_LOGIC_VECTOR (2 downto 0);
Signal I0, I1, I2, I3, I4, I5, I6, I7, Y : STD_LOGIC_VECTOR (3 downto 0);

begin

    UUT : Mux_4_8_to_1
        Port Map(
            I0 => I0,
            I1 => I1,
            I2 => I2,
            I3 => I3,
            I4 => I4,
            I5 => I5,
            I6 => I6,
            I7 => I7,
            S => S,
            Y => Y);

    Process Begin
        S <= "000";
        I0 <= "1010";
        I1 <= "0000";
        I2 <= "0001";
        I3 <= "0010";
        I4 <= "0011";
        I5 <= "0100";
        I6 <= "0101";
        I7 <= "0110";
        Wait for 100ns;
        
        S <= "001";
        Wait for 100ns;

        S <= "010";
        Wait for 100ns;

        S <= "011";
        Wait for 100ns;

        S <= "100";
        Wait for 100ns;

        S <= "101";
        Wait for 100ns;

        S <= "110";
        Wait for 100ns;

        S <= "111";
        Wait;

    
    End Process;


end Behavioral;
