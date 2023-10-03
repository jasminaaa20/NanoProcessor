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

entity TB_Reg is
--  Port ( );
end TB_Reg;

architecture Behavioral of TB_Reg is

    component Reg
        Port ( D : in STD_LOGIC;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
	           En : in STD_LOGIC;
               Q : out STD_LOGIC := '0');
    end component;
    
    signal En : std_logic;
    signal Clk : std_logic := '0';
    signal Res, D, Q : std_logic;
    
begin
    
    UUT: Reg
        Port map(
            D => D,
            Res => Res,
            En => En,
            Clk => Clk,
            Q => Q
        );
    
    process begin
    
        En <= '1';
        Res <= '0';
        D <= '1';
        wait for 30ns;
        
--        Res <= '1';
        wait for 20ns;
        
--        Res <= '0';
        wait for 25ns;
        
        D <= '0';
        wait for 35ns;
        
--        Res <= '1';
        D <= '1';
        wait for 30ns;
        
--        Res <= '0';
--        wait for 35ns;
        
        D <= '0';
        wait for 10ns;
        
        D <= '1';
        wait for 35ns;
        
--        Res <= '1';
        En <= '0';
        D <= '0';
        wait for 20ns;
        
        D <= '1';
--        Res <= '0';
        wait for 35ns;
        
--        Res <= '1';
        En <= '1';
        wait for 40ns;
        
--        Res <= '0';
        wait for 10ns;
        
--        Res <= '1';
        D <= '0';
        wait for 45ns;
        
--        Res <= '0';
        D <= '1';
        wait for 25ns;
        
        D <= '0';
        wait for 35ns;
        
--        Res <= '1';
        Wait for 10ns;
        
--        Res <= '0';
        D <= '1';
        wait for 70ns;
        
        D <= '0';
        wait for 55ns;
        
        D <= '1';
--        wait;
        wait for 45ns;
        
    end process;
    
    process begin
    
        wait for 40ns;
        Clk <= not(Clk);
        
    end process;
        
end Behavioral;
