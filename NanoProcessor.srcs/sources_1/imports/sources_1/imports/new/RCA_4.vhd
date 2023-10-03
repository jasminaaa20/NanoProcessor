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

entity RCA_4 is
    Port ( 
        A, B : in STD_LOGIC_VECTOR (3 downto 0); 
        C_in : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (3 downto 0);
        C_out : out STD_LOGIC;
        Overflow : out STD_LOGIC
    );
end RCA_4;

architecture Behavioral of RCA_4 is

Component FA
    Port (
        A, B, C_in : in std_logic;
        S, C_out : out std_logic
    );
End Component;
    
Signal FA0_C, FA1_C, FA2_C, FA3_C : std_logic;
        

begin
    FA_0 : FA
        Port Map(
            A => A(0),
            B => B(0),
            C_in => C_in,
            S => S(0),
            C_out => FA0_C
        );
    
    FA_1 : FA
        Port Map(
            A => A(1),
            B => B(1),
            C_in => FA0_C,
            S => S(1),
            C_out => FA1_C
        );
    
    FA_2 : FA
        Port Map(
            A => A(2),
            B => B(2),
            C_in => FA1_C,
            S => S(2),
            C_out => FA2_C
        );
    FA_3 : FA
        Port Map(
            A => A(3),
            B => B(3),
            C_in => FA2_C,
            S => S(3),
            C_out => FA3_C
        );

    Overflow <= FA2_C XOR FA3_C;
--    Overflow <= FA3_C;
    C_out <= FA3_C;

end Behavioral;
