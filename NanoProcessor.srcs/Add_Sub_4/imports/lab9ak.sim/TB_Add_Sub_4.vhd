----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.07.2022 11:05:03
-- Design Name: 
-- Module Name: TB_Add_Sub_4 - Behavioral
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

entity TB_Add_Sub_4 is
--  Port ( );
end TB_Add_Sub_4;

architecture Behavioral of TB_Add_Sub_4 is

    Component Add_Sub_4
        Port ( 
            Control : in STD_LOGIC;
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            S : out STD_LOGIC_VECTOR (3 downto 0);
            Overflow : out STD_LOGIC;
            Zero : out STD_LOGIC
        );
    End Component;

    signal Control, Overflow, Zero : STD_LOGIC;
    signal A, B, S : STD_LOGIC_VECTOR (3 downto 0);
    
begin
    
    UUT: Add_Sub_4 Port Map(
        Control => Control,
        A => A,
        B => B,
        S => S,
        Overflow => Overflow,
        Zero => Zero
    );
    
    process begin
        
        A <= "0001";
        B <= "0010";
        Control <= '0';
        wait for 80ns;
        
        Control <= '1';
        wait for 80ns;
        
        A <= "0011";
        B <= "0011";
        Control <= '0';
        wait for 80ns;
        
        Control <= '1';
        wait for 80ns;
        
        A <= "1001";
        B <= "1100";
        Control <= '0';
        wait for 80ns;
        
        Control <= '1';
        wait for 80ns;
        
        A <= "0001";
        B <= "0101";
        Control <= '0';
        wait for 80ns;
        
        Control <= '1';
        wait for 80ns;

        A <= "0010";
        B <= "1010";
        Control <= '0';
        wait for 80ns;
        
        Control <= '1';
        wait for 80ns;
        
        A <= "0000";
        B <= "0000";
        Control <= '0';
        wait for 80ns;
        
        Control <= '1';
        wait;
    
    end process;

end Behavioral;
