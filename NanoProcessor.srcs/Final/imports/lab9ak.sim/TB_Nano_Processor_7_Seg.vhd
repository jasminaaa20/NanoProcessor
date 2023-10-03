----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.07.2022 07:04:38
-- Design Name: 
-- Module Name: TB_Nano_Processor_7_Seg - Behavioral
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

entity TB_Nano_Processor_7_Seg is
--  Port ( );
end TB_Nano_Processor_7_Seg;

architecture Behavioral of TB_Nano_Processor_7_Seg is

Component Nano_Processor_7_seg
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Answer_LED : out STD_LOGIC_VECTOR (3 downto 0);
           Answer_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
End Component;

signal Overflow, Zero : std_logic;
signal Answer_LED : STD_LOGIC_VECTOR (3 downto 0);
signal Answer_7Seg : STD_LOGIC_VECTOR (6 downto 0);
signal Clk, Reset : STD_LOGIC := '0';

begin
    UUT: Nano_Processor_7_seg
        Port Map(
            Clk => Clk,
            Reset => Reset,
            Answer_LED => Answer_LED,
            Answer_7Seg => Answer_7Seg,
            Overflow => Overflow,
            Zero => Zero);
        
    Process Begin
        Clk <= NOT(Clk);
        wait for 10ns;
    End Process;

end Behavioral;
