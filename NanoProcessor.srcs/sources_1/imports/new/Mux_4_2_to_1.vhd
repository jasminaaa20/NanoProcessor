----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.07.2022 19:04:03
-- Design Name: 
-- Module Name: Mux_4_2_to_1 - Behavioral
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

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.07.2022 18:02:17
-- Design Name: 
-- Module Name: Mux_3_2_to_1 - Behavioral
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

entity Mux_4_2_to_1 is
    Port ( I0 : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           I1 : in STD_LOGIC_VECTOR  (3 DOWNTO 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 DOWNTO 0));
end Mux_4_2_to_1;

architecture Behavioral of Mux_4_2_to_1 is

Component Mux_2_to_1
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : out STD_LOGIC);
End Component;

begin

Mux_2_to_1_0: Mux_2_to_1
    Port Map(
        I0 => I0(0),
        I1 => I1(0),
        S => S,
        Y => Y(0)
    );

Mux_2_to_1_1: Mux_2_to_1
    Port Map(
        I0 => I0(1),
        I1 => I1(1),
        S => S,
        Y => Y(1)
    );

Mux_2_to_1_2: Mux_2_to_1
    Port Map(
        I0 => I0(2),
        I1 => I1(2),
        S => S,
        Y => Y(2)
    );


Mux_2_to_1_3: Mux_2_to_1
    Port Map(
        I0 => I0(3),
        I1 => I1(3),
        S => S,
        Y => Y(3)
    );
end Behavioral;
