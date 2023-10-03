----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.07.2022 18:43:03
-- Design Name: 
-- Module Name: TB_Adder_3 - Behavioral
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

entity TB_Adder_3 is
--  Port ( );
end TB_Adder_3;

architecture Behavioral of TB_Adder_3 is

Component Adder_3
    Port ( 
        A : in STD_LOGIC_VECTOR (2 downto 0);
        S : out STD_LOGIC_VECTOR (2 downto 0)
);
End Component;

Signal A, S : STD_LOGIC_VECTOR (2 downto 0);

begin
    
    UUT: Adder_3 Port Map(
        A => A,
        S => S
    );

Process Begin
    
    A <= "000";
    wait for 80ns;
    
    A <= "001";
    wait for 80ns;
    
    A <= "010";
    wait for 80ns;
    
    A <= "011";
    wait for 80ns;
    
    A <= "100";
    wait for 80ns;
    
    A <= "101";
    wait for 80ns;
    
    A <= "110";
    wait for 80ns;
    
    A <= "111";
    wait;
    
End Process;

end Behavioral;
