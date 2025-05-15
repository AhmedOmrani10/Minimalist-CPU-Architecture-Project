library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity state_machine_2 is
    Port (
        i :in std_logic_vector(5 downto 0);
  clk:in std_logic;
  o : out std_logic_vector(8 downto 0));

    
end state_machine_2;

architecture Behavioral_state_machine_2 of state_machine_2 is 
type Etat is (Etat0, Etat1, Etat2,Etat3, Etat4 ,Etat5,Etat6, Etat7, Etat8,Etat9, Etat10, Etat11);
signal Etat_present, Etat_futur : Etat := Etat0;
begin
   Sequentiel_maj_etat : process (clk)
    begin
        if i = "0111XX" then
            Etat_present <= Etat0;
        elsif rising_edge(clk) then
            Etat_present <= Etat_futur;
        end if;
    end process Sequentiel_maj_etat;
    
     Combinatoire_etats : process (i, Etat_present)  
    begin  
        case Etat_present is  
            when Etat0 => 
                  
                    Etat_futur <= Etat1;  
               
              
            
            when Etat1 => 
               
                    Etat_futur <= Etat2;  
               
               
            
           when Etat2 =>
    if (i(5 downto 2) = "0100" or 
       (i(5 downto 2) = "0101" and i(0) = '0') or 
       (i(5 downto 2) = "0110" and i(1) = '0') or 
       (i(5 downto 2) = "0000")) then
        Etat_futur <= Etat3;
    elsif (i(5 downto 2) = "0011") then
        Etat_futur <= Etat6;
    elsif (i(5 downto 2) = "0010") then
        Etat_futur <= Etat7;
    elsif (i(5 downto 2) = "0001") then
        Etat_futur <= Etat8;
    end if;

when Etat3 =>
    if (i(5 downto 2) = "0100" or 
       (i(5 downto 2) = "0101" and i(0) = '0') or 
       (i(5 downto 2) = "0110" and i(1) = '0')) then
        Etat_futur <= Etat4;
    elsif (i(5 downto 2) = "0000") then
        Etat_futur <= Etat11;
    end if;

when Etat4 =>
    if (i(5 downto 2) = "0100" or 
       (i(5 downto 2) = "0101" and i(0) = '0') or 
       (i(5 downto 2) = "0110" and i(1) = '0')) then
        Etat_futur <= Etat5;
    end if;
            when Etat5=>
              Etat_futur <= Etat0 ;
            when Etat6=>
              Etat_futur <= Etat11 ;
            when Etat7=>
              Etat_futur <= Etat11 ;
            when Etat8=>
              Etat_futur <= Etat9 ;
            when Etat9=>
              Etat_futur <= Etat10 ;
            when Etat10=>
              Etat_futur <= Etat0 ;
            when Etat11=>
              Etat_futur <= Etat0 ;
            
                    
                  
                
              
               
        end case;  
    end process Combinatoire_etats;
    
    
    Combinatoire_sorties : process (Etat_present)
begin
    case Etat_present is
        when Etat0 => 
        o <= "100000000";--10X000XX0
        
    when Etat1 => 
        o <= "100010110";
        
    when Etat2 => 
        o <= "111100000";--111100XX0
        
    when Etat3 => 
        o <= "111100000";
        
    when Etat4 => 
        o <= "111000000";
        
    when Etat5 => 
        o <= "111100000";
        
    when Etat6 => 
        o <= "111100010";
        
    when Etat7 => 
        o <= "111100100";
        
    when Etat8 => 
        o <= "010000000";--01X000XX0
        
    when Etat9 => 
        o <= "010000001";--01X000XX1
        
    when Etat10 => 
        o <= "010000000";--01X000XX0
        
    when Etat11 => 
        o <= "111101000";--111101XX0
            
        
    end case;
end process Combinatoire_sorties;
end Behavioral_state_machine_2;

    