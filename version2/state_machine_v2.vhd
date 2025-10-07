library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity yy is
    Port (
       opcode : in std_logic_vector(3 downto 0);
       accz, acc15 : in std_logic;
       rnw, sela, selb, pc_ld, ir_ld, acc_ld, acc_oe : out std_logic;
       alufs : out std_logic_vector(3 downto 0);
       clk    : in  std_logic;
       reset  : in  std_logic
    );
end yy;

architecture Behavioral of yy is

    type state_type is (
        S0, S1, S2, S3, S4, S5, S6,S77,
        OP0_A, OP0_B,OP0_C,
        OP2_A, OP2_B,OP2_C,
        OP3_A, OP3_B,OP3_C,
        OP4_A, OP4_B,OP4_C,
        OP5_A, OP5_B,OP5_C,
        OP6_A, OP6_B,OP6_C
    );
    signal state, next_state : state_type := S0;

   
    signal rnw_sig, sela_sig, selb_sig : std_logic := '0';
    signal pc_ld_sig, ir_ld_sig, acc_ld_sig, acc_oe_sig : std_logic := '0';
    signal alufs_sig : std_logic_vector(3 downto 0) := (others => '0');

begin
   
    rnw    <= rnw_sig;
    sela   <= sela_sig;
    selb   <= selb_sig;
    pc_ld  <= pc_ld_sig;
    ir_ld  <= ir_ld_sig;
    acc_ld <= acc_ld_sig;
    acc_oe <= acc_oe_sig;
    alufs  <= alufs_sig;

    
    process(clk)
    begin
        if reset = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    
    process(state, opcode, accz, acc15)
    begin
        
        --rnw_sig    <= '0';
        --sela_sig   <= '0';
        --selb_sig   <= '0';
        --pc_ld_sig  <= '0';
        --ir_ld_sig  <= '0';
        --acc_ld_sig <= '0';
        --acc_oe_sig <= '0';
        alufs_sig  <= (others => 'U');
        next_state <= state;

        case state is
            when S0 =>
                selb_sig <= '0'; pc_ld_sig <= '0'; sela_sig <= '0'; acc_ld_sig <= '0'; ir_ld_sig <= '0';
                next_state <= S2;rnw_sig <= '1';

            --when S1 =>
              --  rnw_sig <= '1'; pc_ld_sig <= '1'; ir_ld_sig <= '0';
                --next_state <= S2;

            when S2 =>
                rnw_sig <= '1';
                pc_ld_sig <= '0';ir_ld_sig <= '0';
                next_state <= S3;
            when S3 =>
                rnw_sig <= '1';
                ir_ld_sig <= '1'; 
                pc_ld_sig <= '0';
                sela_sig <= '1';
                next_state <= S1;
            when S1 =>
            sela_sig <= '0';
            next_state <= S4;
            when S4 =>
                ir_ld_sig <= '0';
                rnw_sig <= '1';
                sela_sig <= '0';
                alufs_sig <= "0011"; 
                report("cccc");
                next_state <= S5;

            when S5 =>
                rnw_sig <= '1';
                sela_sig <= '0';
                pc_ld_sig <= '1';
                next_state <= S77;
            when S77 =>
                pc_ld_sig <= '0';
                sela_sig <= '1';
                next_state <= S6;

           

            when S6 =>
              report("bbbbb");
              
                case opcode is
                    when "0000" => next_state <= OP0_A;
                    when "0010" => next_state <= OP2_A;
                    when "0011" => next_state <= OP3_A;
                    when "0100" => next_state <= OP4_A;
                    when "0101" => next_state <= OP5_A;
                    when "0110" => next_state <= OP6_A;
                    when others => next_state <= S0;
                end case;

            -- OPCODE = 0000
            when OP0_A =>
                report("aaaaa");
                selb_sig <= '1';
                next_state <= OP0_B;
            when OP0_B =>
              selb_sig <= '1';
                alufs_sig <= "0000"; 
                next_state <= OP0_C;
                
            when OP0_C =>  
            selb_sig <= '1'; 
                acc_ld_sig <= '1';
                next_state <= S0;

            -- OPCODE = 0010
            when OP2_A =>
                selb_sig <= '1';
                next_state <= OP2_B;
            when OP2_B =>
                alufs_sig <= "0010"; 
                next_state <= OP2_C;
            when OP2_C =>   
                acc_ld_sig <= '1';
                next_state <= S0;
            -- OPCODE = 0011
            when OP3_A =>
                selb_sig <= '1';
                next_state <= OP3_B;
            when OP3_B =>
                alufs_sig <= "0001"; 
                next_state <= OP3_C;
            when OP3_C =>   
                acc_ld_sig <= '1';
                next_state <= S0;
            -- OPCODE = 0100
            when OP4_A =>
                selb_sig <= '0';
                next_state <= OP4_B;
            when OP4_B =>
                alufs_sig <= "0000"; 
                next_state <= OP4_C;
            when OP4_C =>   
                pc_ld_sig <= '1';
                next_state <= S0;
            -- OPCODE = 0101
            when OP5_A =>
                selb_sig <= '0';
                if acc15 = '0' then
                    next_state <= OP5_B;
                else
                    next_state <= S0;
                end if;
            when OP5_B =>
                alufs_sig <= "0000";
                next_state <= OP5_C;
            when OP5_C =>   
                 pc_ld_sig <= '1';
                next_state <= S0;
            -- OPCODE = 0110
            when OP6_A =>
                selb_sig <= '0';
                if accz = '0' then
                    next_state <= OP6_B;
                else
                    next_state <= S0;
                end if;
            when OP6_B =>
                alufs_sig <= "0000"; 
                next_state <= OP6_C;
            when OP6_C =>   
                 pc_ld_sig <= '1';
                next_state <= S0;
            when others =>
                next_state <= S0;
        end case;
    end process;

end Behavioral;
