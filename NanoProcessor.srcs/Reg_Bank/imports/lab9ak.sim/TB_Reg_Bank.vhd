----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.07.2022 14:38:38
-- Design Name: 
-- Module Name: TB_Reg_Bank - Behavioral
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

entity TB_Reg_Bank is
--  Port ( );
end TB_Reg_Bank;

architecture Behavioral of TB_Reg_Bank is

    Component Reg_Bank
        Port ( En : in STD_LOGIC_VECTOR (2 downto 0);
               Clk : in STD_LOGIC;
               Res : in STD_LOGIC;
               D : in STD_LOGIC_VECTOR (3 downto 0);
               Q0 : out STD_LOGIC_VECTOR (3 downto 0) := "0000";
               Q1 : out STD_LOGIC_VECTOR (3 downto 0) := "0000";
               Q2 : out STD_LOGIC_VECTOR (3 downto 0) := "0000";
               Q3 : out STD_LOGIC_VECTOR (3 downto 0) := "0000";
               Q4 : out STD_LOGIC_VECTOR (3 downto 0) := "0000";
               Q5 : out STD_LOGIC_VECTOR (3 downto 0) := "0000";
               Q6 : out STD_LOGIC_VECTOR (3 downto 0) := "0000";
               Q7 : out STD_LOGIC_VECTOR (3 downto 0) := "0000");
    End Component;

signal En : STD_LOGIC_VECTOR (2 downto 0);
signal Clk, Res : STD_LOGIC := '0'; 
signal D : STD_LOGIC_VECTOR (3 downto 0);
signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
    UUT: Reg_Bank
        Port Map(
            En => En,
            Clk => Clk,
            Res => Res,
            D => D,
            Q0 => Q0,
            Q1 => Q1,
            Q2 => Q2,
            Q3 => Q3,
            Q4 => Q4,
            Q5 => Q5,
            Q6 => Q6,
            Q7 => Q7
        );
        
    Process Begin
        En <= "001";
        D <= "1010";
        wait for 100ns;
        
        En <= "010";
        wait for 90ns;
        
        En <= "011";
        wait for 90ns;
        
        En <= "100";
        wait for 90ns;
        
        En <= "101";
        wait for 80ns;
        
        En<= "110";
        wait for 70ns;
        
        En <= "111";
        wait for 90ns;
        
        En <= "000";
        wait;
        
    end process;

    process begin
        wait for 35ns;
        Clk <= NOT(Clk);
    end process;

end Behavioral;
