library ieee;
use ieee.std_logic_1164.all;
entity div_state_machine is
port(
c_out: in std_logic;
clk : in std_logic;
counter: in std_logic_vector(2 downto 0);
control_A : out std_logic_vector(1 downto 0);
control_M : out std_logic_vector(1 downto 0);
control_Q : out std_logic_vector(2 downto 0);
as_control : out std_logic;
control_count : out std_logic_vector(1 downto 0));
end div_state_machine;


architecture archi of div_state_machine is
    type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
    signal state : state_type;
begin
    process (clk)
    variable s: std_logic;
    begin
      if (clk'event and clk = '1') then 
        case state is
            when s0 =>
                state <= s1;
            when s1 => 
                state <= s2;
            when s2 => 
                state <= s3;
            when s3 =>
                state <= s4;
                s := c_out;
            when s4 => 
                if s = '0' then
                    state <= s6;
                else
                    state <= s5;
                end if;
            when s5 =>
                state <= s7;
            when s6 => 
                state <= s7;
            when s7 => 
                state <= s8;
            when s8 =>
                if counter > "000" then
                    state <= s2;
                else
                    state <= s9;
                end if;
            when s9 =>
                state <= s0;
        end case;
      end if;
    end process;

    process(state)
    begin
        case state is
            when s0 => -- hold
                control_A <= "10";
                control_Q <= "010";
                control_M <= "10";
                as_control <= '0';
                control_count <= "01"; 
            when s1 => -- load M and Q, reset counter
                control_A <= "00";
                control_Q <= "001";
                control_M <= "01";
                as_control <= '0';
                control_count <= "00";
            when s2 => -- shift
                control_A <= "11";
                control_Q <= "011";
                control_M <= "10";
                as_control <= '0';
                control_count <= "01";
            when s3 => -- subtract M from A
                control_A <= "01";
                control_Q <= "010";
                control_M <= "10";
                as_control <= '1';
                control_count <= "01";
            when s4 => -- compare A and 0
                control_A <= "10";
                control_Q <= "010";
                control_M <= "10";
                as_control <= '0';
                control_count <= "01";                
            when s5 => -- Q0 is 1
                control_A <= "10";
                control_Q <= "100";
                control_M <= "10";
                as_control <= '0';
                control_count <= "01";
            when s6 => -- Q0 is 0
                control_A <= "01";
                control_Q <= "101";
                control_M <= "10";
                as_control <= '0';
                control_count <= "01";
            when s7 => -- counter
                control_A <= "10";
                control_Q <= "010";
                control_M <= "10";
                as_control <= '0';
                control_count <= "10";
            when s8 => -- compare
                control_A <= "10";
                control_Q <= "010";
                control_M <= "10";
                as_control <= '0';
                control_count <= "01";
            when s9 => -- hold
                control_A <= "10";
                control_Q <= "010";
                control_M <= "10";
                as_control <= '0';
                control_count <= "01";
        end case;
    end process;
end archi;









