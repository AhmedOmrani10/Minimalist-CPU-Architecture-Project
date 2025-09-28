library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity instruction_register is
  port(
    adress_in_memory : in std_logic_vector(15 downto 0);
    ir_ld : in std_logic;
    adress_out_ir : out std_logic_vector(11 downto 0);
    opcode : out std_logic_vector(3 downto 0)
    );
  end instruction_register;


architecture behave_instruction_register of instruction_register is

begin
  p2 :process(ir_ld)
  begin
  if ir_ld='1' then
    adress_out_ir <=  adress_in_memory(11 downto 0);
    opcode<=adress_in_memory(15 downto 12);
end if;
end process p2;


  
  
end behave_instruction_register;
