----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.07.2022 20:21:37
-- Design Name: 
-- Module Name: Decoder_3_to_8 - Behavioral
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

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           Y0 : out STD_LOGIC;
           Y1 : out STD_LOGIC;
           Y2 : out STD_LOGIC;
           Y3 : out STD_LOGIC;
           Y4 : out STD_LOGIC;
           Y5 : out STD_LOGIC;
           Y6 : out STD_LOGIC;
           Y7 : out STD_LOGIC);
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is

Signal I0P, I1P, I2P : STD_LOGIC;
Signal A0, A1, A2, A3 : STD_LOGIC;

begin

I0P <= NOT(I(0));
I1P <= NOT(I(1));
I2P <= NOT(I(2));

A0 <= I1P AND I2P;
A1 <= I(1) AND I2P;
A2 <= I1P AND I(2);
A3 <= I(1) AND I(2);

Y0 <= A0 AND I0P;
Y1 <= A0 AND I(0);
Y2 <= A1 AND I0P;
Y3 <= A1 AND I(0);
Y4 <= A2 AND I0P;
Y5 <= A2 AND I(0);
Y6 <= A3 AND I0P;
Y7 <= A3 AND I(0);

end Behavioral;
