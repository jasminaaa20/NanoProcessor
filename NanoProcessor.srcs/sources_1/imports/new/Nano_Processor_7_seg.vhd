----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.07.2022 06:19:19
-- Design Name: 
-- Module Name: Nano_Processor_7_seg - Behavioral
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

entity Nano_Processor_7_seg is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Answer_LED : out STD_LOGIC_VECTOR (3 downto 0);
           Answer_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end Nano_Processor_7_seg;

architecture Behavioral of Nano_Processor_7_seg is

Component Nano_Processor
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
	       Zero : out STD_LOGIC;
           Answer : out STD_LOGIC_VECTOR (3 downto 0));
End Component;

Component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
End Component;

signal S : STD_LOGIC_VECTOR (3 downto 0);

begin
NanoProcessor : Nano_Processor
    port map ( 
       Clk => Clk,
       Reset => Reset,
       Overflow => Overflow,
       Zero => Zero,
       Answer => S);
       
LUT : LUT_16_7
   port map ( 
       address => S,
       data => Answer_7Seg);
       
Answer_LED <= S;
Anode <= "1110";

end Behavioral;