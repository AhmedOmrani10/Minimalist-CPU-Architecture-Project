library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memory is
    Port (
        
        addr_in_muxa    : in  STD_LOGIC_VECTOR(11 downto 0); -- Address input
        rnw             : in  STD_LOGIC;                     -- '1' = read, '0' = write
        data_out_memory : inout STD_LOGIC_VECTOR(15 downto 0)  -- Data output
    );
end memory;

architecture Behavioral of memory is
    type ram_array is array (0 to 65535) of STD_LOGIC_VECTOR(15 downto 0);
    signal RAM : ram_array := (
        0 => x"0008",
        1 => x"2009",
        8 => x"0007",
        9 => x"0005",
        2 => x"1000",
        3 => x"0000",
        
        others => (others => '0')
    );

    signal temp_data : STD_LOGIC_VECTOR(15 downto 0);
begin

    process(addr_in_muxa)
    begin
        
            if rnw = '0' then
                
                RAM(to_integer(unsigned(addr_in_muxa))) <= data_out_memory;
            end if;
            
            temp_data <= RAM(to_integer(unsigned(addr_in_muxa)));
       
    end process;

    data_out_memory <= temp_data when rnw = '1' else (others => 'Z');

end Behavioral;
