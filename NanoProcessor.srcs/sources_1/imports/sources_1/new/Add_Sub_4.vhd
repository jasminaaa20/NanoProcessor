----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.07.2022 10:03:24
-- Design Name: 
-- Module Name: Add_Sub_4 - Behavioral
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

entity Add_Sub_4 is
    Port ( Control : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub_4;

architecture Behavioral of Add_Sub_4 is

Component RCA_4
    Port ( 
        A, B : in STD_LOGIC_VECTOR (3 downto 0); 
        C_in : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (3 downto 0); 
        C_out : out STD_LOGIC;
        Overflow : out STD_LOGIC
    );
End Component;

    signal B_new, S_out : STD_LOGIC_VECTOR (3 downto 0);
    signal C_out : STD_LOGIC;

begin
    
    B_new(0) <= Control XOR B(0);
    B_new(1) <= Control XOR B(1);
    B_new(2) <= Control XOR B(2);
    B_new(3) <= Control XOR B(3);
    
    RCA : RCA_4
        Port Map(
            A => A,
            B => B_new,
            C_in => Control,
            S => S_out,
            C_out => C_out,
            Overflow => Overflow
        );
    
    Zero <= NOT((C_out) OR S_out(0) OR S_out(1) OR S_out(2) OR S_out(3));
    S <= S_out;

end Behavioral;
