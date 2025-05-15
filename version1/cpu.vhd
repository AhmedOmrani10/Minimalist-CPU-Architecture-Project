library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity cpu is 
port(
    opcode : in std_logic_vector(3 downto 0);
  accz,acc15: in std_logic;
  o : out std_logic_vector(15 downto 0));
end cpu;

architecture behave_cpu of cpu is



component muxa is 
port(
  adress_in_pc : in std_logic_vector(11 downto 0);
  adress_in_ir : in std_logic_vector(11 downto 0);
  selA : in std_logic;
  adress_out_a :out std_logic_vector(11 downto 0));
end component;
component muxb is 
port(
  adress_in_muxa : in std_logic_vector(11 downto 0);
  adress_in_memory : in std_logic_vector(15 downto 0);
  selB : in std_logic;
  adress_out_b :out std_logic_vector(15 downto 0));
end component;



component accumulator is 
port(
  operand_in_alu : in std_logic_vector(15 downto 0);
  acc_ld : in std_logic;
  acc_z : out std_logic;
  acc_15 : out std_logic;

  result_out_acc :out  std_logic_vector(15 downto 0));
  
end component;

component program_counter is
  port(
    adress_in_alu : in std_logic_vector(15 downto 0);
    pc_ld : in std_logic;
    adress_out_pc : out std_logic_vector(11 downto 0)
    );
  
end component;

component alu is 
port(
  alufs : in std_logic_vector(3 downto 0);
  adress_in_muxb : in std_logic_vector(15 downto 0);
  adress_in_acc : in std_logic_vector(15 downto 0);
  adress_out_alu : out std_logic_vector(15 downto 0)
  
  
  );
  
end component;

component yy is
    Port (
       opcode : in std_logic_vector(3 downto 0);
  accz,acc15: in std_logic;
  rnw,sela,selb,pc_ld,ir_ld,acc_ld,acc_oe:out std_logic;
  alufs :out std_logic_vector(3 downto 0));
  
end component;

component oe is 
port(
  i : in std_logic_vector(15 downto 0);
  acc_oe : in std_logic;
  result : out std_logic_vector(15 downto 0));
  
end component;

component instruction_register is
  port(
    adress_in_memory : in std_logic_vector(15 downto 0);
    ir_ld : in std_logic;
    adress_out_ir : out std_logic_vector(11 downto 0);
    opcode : out std_logic_vector(3 downto 0)
    );
    
  end component;
  component memory is
    Port (
        addr_in_muxa : in  STD_LOGIC_VECTOR(11 downto 0);         
        rnw  : in  STD_LOGIC;                             
        data_out_memory : out STD_LOGIC_VECTOR(15 downto 0)          
    );
    
  end component;
signal rnw_s,sela_s,selb_s,pc_ld_s,ir_ld_s,acc_ld_s,acc_oe_s,acc_z_s,acc_15_s :std_logic;
signal alufs_s : std_logic_vector(3 downto 0);
signal muxa_s,ir_s,pc_s :std_logic_vector(11 downto 0);
signal m_s,acc_s,alu_s ,muxb_s:std_logic_vector(15 downto 0);
signal opcode_s :std_logic_vector(3 downto 0);
begin
  
  stat_machine : yy port map(opcode,accz,acc15,rnw_s,sela_s,selb_s,pc_ld_s,ir_ld_s,acc_ld_s,acc_oe_s,alufs_s );
   muxAa : muxa port map(pc_s,ir_s,sela_s,muxa_s);
   muxBb : muxb port map(muxa_s,m_s,selb_s,muxb_s);
   al : alu port map(alufs_s,muxb_s,alu_s,acc_s);
   pccc : program_counter port map(alu_s,pc_ld_s,pc_s);
   irr : instruction_register port map (m_s,ir_ld_s,ir_s,opcode_s);
   accc : accumulator port map(alu_s,acc_ld_s,acc_z_s,acc_15_s,acc_s);
   mem : memory port map(muxa_s,rnw_s,m_s);
   enableeeeee : oe port map(acc_s,acc_oe_s,m_s);
   


end behave_cpu;  
