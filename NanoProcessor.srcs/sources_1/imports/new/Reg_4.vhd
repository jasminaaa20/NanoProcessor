----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.07.2022 10:37:48
-- Design Name: 
-- Module Name: Reg_4 - Behavioral
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

entity Reg_4 is
    Port ( En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0):= "0000");
end Reg_4;

architecture Behavioral of Reg_4 is

Component Reg
    Port ( En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC := '0');
End Component;

begin

    Reg_0 : Reg
        Port Map(
            En => En,
            Clk => Clk,
            D => D(0),
            Res => Res,
            Q => Q(0)
        );
    
    Reg_1 : Reg
        Port Map(
            En => En,
            Clk => Clk,
            D => D(1),
            Res => Res,
            Q => Q(1)
        );
    
    Reg_2 : Reg
        Port Map(
            En => En,
            Clk => Clk,
            D => D(2),
            Res => Res,
            Q => Q(2)
        );
    
    Reg_3 : Reg
        Port Map(
            En => En,
            Clk => Clk,
            D => D(3),
            Res => Res,
            Q => Q(3)
        );

end Behavioral;
