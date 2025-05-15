library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity oe is 
port(
  i : in std_logic_vector(15 downto 0);
  acc_oe : in std_logic;
  result : out std_logic_vector(15 downto 0));
end oe;

architecture oe_ld_behave of oe is
begin
  result <= i when acc_oe ='1';

end oe_ld_behave;