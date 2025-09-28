library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity yy is
    Port (
       opcode : in std_logic_vector(3 downto 0);
  accz,acc15: in std_logic;
  rnw,sela,selb,pc_ld,ir_ld,acc_ld,acc_oe:out std_logic;
  alufs :out std_logic_vector(3 downto 0));
    
end yy;

architecture Behavioral of yy is
 signal indeo_sig : std_logic := '0';
 signal rnw_sig, sela_sig, selb_sig : std_logic :='0';
 signal pc_ld_sig, ir_ld_sig, acc_ld_sig, acc_oe_sig : std_logic := '0';
 signal alufs_sig : std_logic_vector(3 downto 0);
begin

  
 rnw    <= rnw_sig;
sela   <= sela_sig;
selb   <= selb_sig;
pc_ld  <= pc_ld_sig;
ir_ld  <= ir_ld_sig;
acc_ld <= acc_ld_sig;
acc_oe <= acc_oe_sig;
alufs  <= alufs_sig;

    process
    begin
       wait for 50 ns;
      selb_sig<='0';
      pc_ld_sig<='0';
      sela_sig<='0';
      acc_ld_sig<='0';
      
      ir_ld_sig<='0';
      wait for 50 ns;
      rnw_sig<='1';
      pc_ld_sig<='1';
      ir_ld_sig<='0';
      wait for 50 ns;
      pc_ld_sig<='0';
      
      wait for 50 ns;
      alufs_sig<="0011";
      sela_sig<='1';
      wait for 50 ns;
      pc_ld_sig<='1';
      wait for 50 ns;
      ir_ld_sig<='1';
      pc_ld_sig<='0';
      wait for 50 ns;
      
      if(opcode="0000")then
        selb_sig<='1';
        wait for 50 ns;
        alufs_sig<="0000";
        wait for 50 ns;
        acc_ld_sig<='1';
        
      end if;
      if(opcode="0010")then
        selb_sig<='1';
        wait for 50 ns;
        alufs_sig<="0010";
        wait for 50 ns;
        acc_ld_sig<='1';
        
      end if;
      if(opcode="0011")then
        selb_sig<='1';
        wait for 50 ns;
        alufs_sig<="0001";
        wait for 50 ns;
        acc_ld_sig<='1';
        
      end if;
      if(opcode="0100")then
        selb_sig<='1';
        wait for 50 ns;
        alufs_sig<="0000";
        wait for 50 ns;
        pc_ld_sig<='1';
        
      end if;
      
      if(opcode="0101")then
        selb_sig<='1';
        if(acc15 ='0')then
        wait for 50 ns;
        alufs_sig<="0000";
        wait for 50 ns;
        pc_ld_sig<='1';
      end if;
      end if;
      if(opcode="0110")then
        selb_sig<='1';
        if(accz ='0')then
        wait for 50 ns;
        alufs_sig<="0000";
        wait for 50 ns;
        pc_ld_sig<='1';
      end if;
      end if;
      
      
        wait for 50 ns;
      
      
        
        
         
         
        
        
       
    end process;

end Behavioral;