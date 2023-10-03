----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.07.2022 12:15:19
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
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
end Reg_Bank;

architecture Behavioral of Reg_Bank is

    Component Reg_4
        Port ( En : in STD_LOGIC;
               Clk : in STD_LOGIC;
               D : in STD_LOGIC_VECTOR (3 downto 0);
               Res : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0):= "0000");
    End Component;

    Component Decoder_3_to_8
        Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
               Y0 : out STD_LOGIC;
               Y1 : out STD_LOGIC;
               Y2 : out STD_LOGIC;
               Y3 : out STD_LOGIC;
               Y4 : out STD_LOGIC;
               Y5 : out STD_LOGIC;
               Y6 : out STD_LOGIC;
               Y7 : out STD_LOGIC);
    End Component;

    Signal EN0, EN1, EN2, EN3, EN4, EN5, EN6, EN7 : STD_LOGIC;

begin

    Decoder : Decoder_3_to_8
        Port Map(
            I => En,
            Y0 => EN0,
            Y1 => EN1,
            Y2 => EN2,
            Y3 => EN3,
            Y4 => EN4,
            Y5 => EN5,
            Y6 => EN6,
            Y7 => EN7);

    Reg_4_0 : Reg_4
        Port Map(
            En => EN0,
            Clk => Clk,
            D => "0000",
            Res => Res,
            Q => Q0);

    Reg_4_1 : Reg_4
        Port Map(
            En => EN1,
            Clk => Clk,
            D => D,
            Res => Res,
            Q => Q1);

    Reg_4_2 : Reg_4
        Port Map(
            En => EN2,
            Clk => Clk,
            D => D,
            Res => Res,
            Q => Q2);

    Reg_4_3 : Reg_4
        Port Map(
            En => EN3,
            Clk => Clk,
            D => D,
            Res => Res,
            Q => Q3);

    Reg_4_4 : Reg_4
        Port Map(
            En => EN4,
            Clk => Clk,
            D => D,
            Res => Res,
            Q => Q4);

    Reg_4_5 : Reg_4
        Port Map(
            En => EN5,
            Clk => Clk,
            D => D,
            Res => Res,
            Q => Q5);

    Reg_4_6 : Reg_4
        Port Map(
            En => EN6,
            Clk => Clk,
            D => D,
            Res => Res,
            Q => Q6);

    Reg_4_7 : Reg_4
        Port Map(
            En => EN7,
            Clk => Clk,
            D => D,
            Res => Res,
            Q => Q7);

end Behavioral;
