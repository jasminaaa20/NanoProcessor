----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 09:34:17 AM
-- Design Name: 
-- Module Name: TB_Nano_Processor - Behavioral
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

entity TB_Nano_Processor is
--  Port ( );
end TB_Nano_Processor;

architecture Behavioral of TB_Nano_Processor is

    component Nano_Processor
        Port ( Clk : in STD_LOGIC;
               Reset : in STD_LOGIC;
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC;
               Answer: out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    signal Answer : STD_LOGIC_VECTOR(3 downto 0);
    signal Overflow, Zero : std_logic;
    signal Clk, Reset : std_logic := '0';

begin

UUT : Nano_Processor
    port map(
        Clk => Clk,
        Reset => Reset,
        Overflow => Overflow,
        Zero => Zero,
        Answer => Answer
    );

process begin 
    Clk <= NOT(Clk);
    wait for 20ns;
end process;

--process begin
--    wait for 700ns;
--    Reset<='1';
--    wait;
--end process;

end Behavioral;
