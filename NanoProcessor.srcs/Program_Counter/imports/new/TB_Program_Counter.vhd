----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.06.2022 11:29:28
-- Design Name: 
-- Module Name: D_FF_Sim - Behavioral
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

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is

    component Program_Counter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    signal Clk : STD_LOGIC := '0';
    signal Res : STD_LOGIC;
    signal D, Q : STD_LOGIC_VECTOR (2 downto 0);

begin
    
    UUT: Program_Counter
        Port map(
            D => D,
            Clk => Clk,
            Res => Res,
            Q => Q
        );
    
    process begin
    
        Res <= '0';
        D <= "000";
        wait for 30ns;
        
        Res <= '1';
        wait for 20ns;
        
        Res <= '0';
        wait for 25ns;
        
        D <= "001";
        wait for 35ns;
        
        Res <= '1';
        D <= "010";
        wait for 30ns;
        
        Res <= '0';
        wait for 35ns;
        
        D <= "011";
        wait for 40ns;
        
        D <= "100";
        wait for 35ns;
        
        Res <= '1';
        D <= "101";
        wait for 20ns;
        
        D <= "101";
        Res <= '0';
        wait for 42ns;
        
        Res <= '1';
        wait for 33ns;
        
        Res <= '0';
        wait for 10ns;
        
        Res <= '1';
        D <="110";
        wait for 45ns;
        
        Res <= '0';
        D <= "111";
        wait for 25ns;
        
        D <= "100";
        wait for 35ns;
        
        Res <= '1';
        Wait for 30ns;
        
        Res <= '0';
        D <= "110";
        wait for 70ns;
        
        D <= "001";
        wait for 55ns;
        
        D <= "010";
        wait for 45ns;
        
        D <= "111";
        wait for 50ns;
        
        D <= "011";
        wait for 60ns;
        
        D <= "010";
        wait for 80ns;
        
        Res <= '1';
        wait;
        
    end process;
    
    process begin
    
        wait for 40ns;
        Clk <= not(Clk);
        
    end process;
        
end Behavioral;
