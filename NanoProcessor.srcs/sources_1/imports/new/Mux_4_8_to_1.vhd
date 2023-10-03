----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.07.2022 17:30:35
-- Design Name: 
-- Module Name: Mux_4_8_to_1 - Behavioral
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

entity Mux_4_8_to_1 is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_4_8_to_1;

architecture Behavioral of Mux_4_8_to_1 is

Component Mux_4_2_to_1
    Port ( I0 : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           I1 : in STD_LOGIC_VECTOR  (3 DOWNTO 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 DOWNTO 0));
End Component;

Signal Y0, Y1, Y2, Y3, Y4, Y5 : STD_LOGIC_VECTOR  (3 DOWNTO 0);

begin

Mux_4_2_to_1_0 : Mux_4_2_to_1
    Port Map(
        I0 => I0,
        I1 => I1,
        S => S(0),
        Y => Y0
    );

Mux_4_2_to_1_1 : Mux_4_2_to_1
    Port Map(
        I0 => I2,
        I1 => I3,
        S => S(0),
        Y => Y1
    );

Mux_4_2_to_1_2 : Mux_4_2_to_1
    Port Map(
        I0 => I4,
        I1 => I5,
        S => S(0),
        Y => Y2
    );

Mux_4_2_to_1_3 : Mux_4_2_to_1
    Port Map(
        I0 => I6,
        I1 => I7,
        S => S(0),
        Y => Y3
    );

Mux_4_2_to_1_4 : Mux_4_2_to_1
    Port Map(
        I0 => Y0,
        I1 => Y1,
        S => S(1),
        Y => Y4
    );

Mux_4_2_to_1_5 : Mux_4_2_to_1
    Port Map(
        I0 => Y2,
        I1 => Y3,
        S => S(1),
        Y => Y5
    );

Mux_4_2_to_1_6 : Mux_4_2_to_1
    Port Map(
        I0 => Y4,
        I1 => Y5,
        S => S(2),
        Y => Y
    );

end Behavioral;
