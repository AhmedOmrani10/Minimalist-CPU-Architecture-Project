library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memory is
    Port (
        addr_in_muxa : in  STD_LOGIC_VECTOR(11 downto 0);         
        rnw  : in  STD_LOGIC;                             
        data_out_memory : out STD_LOGIC_VECTOR(15 downto 0)          
    );
end memory;

architecture Behavioral of memory is
    type rom_array is array (0 to 65535) of STD_LOGIC_VECTOR(15 downto 0);
    signal ROM : rom_array := (
        0 => x"0002",  
        1 => x"2003",   
        2 => x"0001", 
        3=> x"0002",  
        others => (others => '0')
    );
    signal temp_data : STD_LOGIC_VECTOR(15 downto 0);        
begin
    process(addr_in_muxa)
    begin
        temp_data <= ROM(to_integer(unsigned(addr_in_muxa)));
    end process;

    
    data_out_memory <= temp_data when rnw = '1' else (others => 'Z');
end Behavioral;
    
  