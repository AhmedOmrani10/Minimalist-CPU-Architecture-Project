library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
entity alu is 
port(
  alufs : in std_logic_vector(3 downto 0);
  adress_in_muxb : in std_logic_vector(15 downto 0);
  adress_in_acc : in std_logic_vector(15 downto 0);
  adress_out_alu : out std_logic_vector(15 downto 0)
  
  
  );
end alu;

architecture behave_alu of alu is 
--signal verifier : std_logic:='0';
begin
  p3:process(alufs,adress_in_acc,adress_in_muxb)
  begin
    --if(verifier ='0')then
      --adress_out_alu<="0000000000000000";
      --verifier<='1';
    --end --if;
    case alufs is 
  when "0000" => adress_out_alu<=adress_in_muxb;
  when "0001" => adress_out_alu <= std_logic_vector(signed(adress_in_acc)- signed(adress_in_muxb));
  when "0010" => adress_out_alu <= std_logic_vector(signed(adress_in_acc)+ signed(adress_in_muxb));
  when "0011" => adress_out_alu <= std_logic_vector(signed(adress_in_muxb)+1);
  when others => null;
    
    
    
    
  end case;
    
    
    
  end process p3;
  
  
  
end behave_alu;
