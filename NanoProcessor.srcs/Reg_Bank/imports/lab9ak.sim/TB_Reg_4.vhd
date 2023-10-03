----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.07.2022 10:55:36
-- Design Name: 
-- Module Name: TB_Reg_4 - Behavioral
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

entity TB_Reg_4 is
--  Port ( );
end TB_Reg_4;

architecture Behavioral of TB_Reg_4 is

    Component Reg_4
        Port ( En : in STD_LOGIC;
               Clk : in STD_LOGIC;
               D : in STD_LOGIC_VECTOR (3 downto 0);
               Res : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0):= "0000");
    End Component;
    
    Signal En, Res : STD_LOGIC;
    Signal Clk : STD_LOGIC := '0';
    Signal D, Q : STD_LOGIC_VECTOR (3 downto 0);

begin
    
    UUT: Reg_4
        Port Map(
            En => En,
            Clk => Clk,
            D => D,
            Res => Res,
            Q => Q
        );

    process begin
    
        En <= '1';
        Res <= '0';
        D <= "0000";
        wait for 30ns;
        
--        Res <= '1';
        wait for 20ns;
        
--        Res <= '0';
        wait for 25ns;
        
        D <= "0001";
        wait for 35ns;
        
--        Res <= '1';
        D <= "0010";
        wait for 30ns;
        
--        Res <= '0';
--        wait for 35ns;
        
        D <= "0011";
        wait for 10ns;
        
        D <= "0100";
        wait for 35ns;
        
--        Res <= '1';
        En <= '0';
        D <= "0011";
        wait for 20ns;
        
        D <= "0010";
--        Res <= '0';
        wait for 35ns;
        
--        Res <= '1';
        En <= '1';
        wait for 40ns;
        
--        Res <= '0';
        wait for 10ns;
        
--        Res <= '1';
        D <= "0101";
        wait for 45ns;
        
--        Res <= '0';
        D <= "0110";
        wait for 25ns;
        
        D <= "0111";
        wait for 35ns;
        
--        Res <= '1';
        Wait for 10ns;
        
--        Res <= '0';
        D <= "1000";
        wait for 70ns;
        
        D <= "1001";
        wait for 55ns;
        
        D <= "1010";
--        wait;
        wait for 45ns;
        
    end process;
    
    process begin
    
        wait for 40ns;
        Clk <= not(Clk);
        
    end process;
        
end Behavioral;
