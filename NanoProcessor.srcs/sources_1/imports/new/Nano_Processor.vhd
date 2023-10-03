----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 09:04:19 AM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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

entity Nano_Processor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Answer: out STD_LOGIC_VECTOR(3 downto 0));
end Nano_Processor;

architecture Behavioral of Nano_Processor is

component Instruction_Decoder
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           RegJmp : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSel : out STD_LOGIC;
           ImVal : out STD_LOGIC_VECTOR (3 downto 0);
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubSel : out STD_LOGIC;
           Jmp : out STD_LOGIC;
           AddressJmp : out STD_LOGIC_VECTOR (2 downto 0));
end component;
 
component Reg_Bank
    Port ( En : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;
 
component Mux_4_8_to_1
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
end component;
 
component Mux_3_2_to_1
    Port ( I0 : in STD_LOGIC_VECTOR (2 DOWNTO 0);
           I1 : in STD_LOGIC_VECTOR  (2 DOWNTO 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 DOWNTO 0));
end component;
 
component Mux_4_2_to_1
    Port ( I0 : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           I1 : in STD_LOGIC_VECTOR  (3 DOWNTO 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 DOWNTO 0));
end component;
 
component Program_Counter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;
 
component Add_Sub_4
    Port ( Control : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;
 
component Adder_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;
 
component Program_Rom
    Port ( memory_select : in STD_LOGIC_VECTOR (2 downto 0);
           instruction_bus : out STD_LOGIC_VECTOR (11 downto 0));
end component;
 
component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

signal I : STD_LOGIC_VECTOR (11 downto 0);
signal M, mux1_out, mux2_out, add_sub_out, immediate_value, D0,D1, D2,D3,D4,D5,D6,D7  : STD_LOGIC_VECTOR (3 downto 0);
signal register_enable, register_select_1, register_select_2, address_to_jump, adder_out : STD_LOGIC_VECTOR (2 downto 0);
signal clock_out, load_select, jump_flag, add_sub_select : std_logic;
signal memory_select, pc_in : STD_LOGIC_VECTOR (2 downto 0):= "000";


begin

--    pc_in <= "000";
--    memory_select <= "000";
--    adder_out <= "000";

    slow_clock_0 : Slow_Clk
        port map ( Clk_in => Clk,
                   Clk_out => clock_out);
    
    Instruction_Decoder_0 :Instruction_Decoder
        Port map ( Ins => I,
                   RegJmp => mux1_out,
                   RegEn => register_enable,
                   LoadSel => load_select,
                   ImVal => immediate_value,
                   RegSel1 => register_select_1,
                   RegSel2 => register_select_2,
                   Jmp => jump_flag,
                   AddSubSel => add_sub_select,
                   AddressJmp => address_to_jump);
           
    Reg_Bank_0 :Reg_Bank
        Port map ( En => register_enable,
                   Clk => clock_out,
                   Res => reset,
                   D => M,
                   Q0 => D0,
                   Q1 => D1,
                   Q2 => D2,
                   Q3 => D3,
                   Q4 => D4,
                   Q5 => D5,
                   Q6 => D6,
                   Q7 => D7);

    Mux_4_8_to_1_1 :Mux_4_8_to_1
        Port map ( I0 => D0, 
                   I1 => D1, 
                   I2 => D2, 
                   I3 => D3, 
                   I4 => D4, 
                   I5 => D5, 
                   I6 => D6, 
                   I7 => D7, 
                   S => register_select_1,
                   Y => mux1_out);

    Mux_4_8_to_1_2 :Mux_4_8_to_1
        Port map ( I0 => D0, 
                   I1 => D1, 
                   I2 => D2, 
                   I3 => D3, 
                   I4 => D4, 
                   I5 => D5, 
                   I6 => D6, 
                   I7 => D7, 
                   S => register_select_2,
                   Y => mux2_out);
          
    Mux_3_2_to_1_0 :Mux_3_2_to_1
        Port map ( I0 => adder_out,
                   I1 => address_to_jump,
                   S => jump_flag,
                   Y => pc_in);
         
    Mux_4_2_to_1_0 :Mux_4_2_to_1
        Port map ( I0 => add_sub_out,
                   I1 => immediate_value,
                   S => load_select,
                   Y => M);
        
    Program_Counter_0 :Program_Counter
        Port map ( D => pc_in,
                   Clk => clock_out,
                   Res => reset,
                   Q => memory_select);
           
    Add_Sub_4_0 :Add_Sub_4
        Port map ( Control => add_sub_select,
                   A => mux2_out,
                   B => mux1_out,
                   S => add_sub_out,
                   Overflow => Overflow,
                   Zero => Zero);

    Adder_3_0 :Adder_3
        Port map ( A => memory_select,
                   S => adder_out);
     
    ProgramROM_0 :Program_Rom
        Port map ( memory_select => memory_select,
                   instruction_bus => I);

    Answer <= D7;

end Behavioral;
