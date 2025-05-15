library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity accumulator is 
port(
  operand_in_alu : in std_logic_vector(15 downto 0);
  acc_ld : in std_logic;
  acc_z : out std_logic;
  acc_15 : out std_logic;

  result_out_acc :out  std_logic_vector(15 downto 0));
end accumulator;

architecture behave_accumulator of accumulator is 


begin
  
  process(acc_ld, operand_in_alu)
    variable all_zero : boolean := true;
    begin
      if(acc_ld ='1') then 
        result_out_acc <=operand_in_alu;
        acc_15 <=operand_in_alu(15);
        for i in operand_in_alu'range loop
        if operand_in_alu(i) /= '0' then
            all_zero := false;  
        end if;
        end loop;
        
        if(all_zero=true)then
          acc_z<='1';
        else
          acc_z<='0';
        end if;
      end if;
        end process;

  
end behave_accumulator;
