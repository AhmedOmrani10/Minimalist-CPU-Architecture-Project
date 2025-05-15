library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity program_counter is
  port(
    adress_in_alu : in std_logic_vector(15 downto 0);
    pc_ld : in std_logic;
    adress_out_pc : out std_logic_vector(11 downto 0)
    );
  end program_counter;


architecture behave_program_counter of program_counter is

begin
  p1 :process(adress_in_alu,pc_ld)
  begin
  if pc_ld='1' then
    adress_out_pc <= adress_in_alu(11 downto 0);
end if;
end process p1;


  
  
end behave_program_counter;