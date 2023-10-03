----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.06.2022 17:57:52
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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
-- A.A.A. Jasmin
-- 200238N
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

entity Adder_3 is
    Port ( 
        A : in STD_LOGIC_VECTOR (2 downto 0);
        S : out STD_LOGIC_VECTOR (2 downto 0)
    );
end Adder_3;

architecture Behavioral of Adder_3 is

Component FA
    Port (
        A, B, C_in : in std_logic;
        S, C_out : out std_logic
    );
End Component;
    
Signal FA0_C, FA1_C, FA2_C : std_logic;
        
begin
    
    FA_0 : FA
        Port Map(
            A => A(0),
            B => '0',
            C_in => '1',
            S => S(0),
            C_out => FA0_C
        );
    
    FA_1 : FA
        Port Map(
            A => A(1),
            B => '0',
            C_in => FA0_C,
            S => S(1),
            C_out => FA1_C
        );
    
    FA_2 : FA
        Port Map(
            A => A(2),
            B => '0',
            C_in => FA1_C,
            S => S(2),
            C_out => FA2_C
        );

end Behavioral;
