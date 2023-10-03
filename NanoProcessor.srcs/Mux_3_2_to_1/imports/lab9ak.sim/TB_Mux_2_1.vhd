----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.07.2022 17:23:56
-- Design Name: 
-- Module Name: TB_Mux_2_1 - Behavioral
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

entity TB_Mux_2_1 is
--  Port ( );
end TB_Mux_2_1;

architecture Behavioral of TB_Mux_2_1 is

Component Mux_3_2_to_1
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
End Component;

    Signal S : STD_LOGIC;
    Signal I0, I1, Y : STD_LOGIC_VECTOR (2 downto 0);


begin

    UUT: Mux_3_2_to_1
        Port Map(
            I0 => I0,
            I1 => I1,
            S => S,
            Y => Y
        );

    Process Begin
        I0 <= "000";
        I1 <= "100";
        S <= '0';
        wait for 120ns;
        
        S <= '1';
        wait for 120ns;
        
        I0 <= "001";
        I1 <= "101";
        S <= '0';
        wait for 120ns;
        
        S <= '1';
        wait for 120ns;

        I0 <= "010";
        I1 <= "110";
        S <= '0';
        wait for 120ns;
        
        S <= '1';
        wait for 120ns;

        I0 <= "011";
        I1 <= "111";
        S <= '0';
        wait for 120ns;
        
        S <= '1';
        wait for 120ns;
        
        I0 <= "000";
        I1 <= "000";
        S <= '0';
        wait;

    End Process;

end Behavioral;
