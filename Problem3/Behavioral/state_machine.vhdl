library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity state_machine is
    Port(
        clk : in std_logic;
        divisor : in std_logic_vector(3 downto 0);
        dividend : in std_logic_vector(7 downto 0);
        n : in std_logic_vector(2 downto 0);
        quotient : out std_logic_vector(7 downto 0);
        remainder : out std_logic_vector(3 downto 0));
end state_machine;

architecture archi of state_machine is
    type state_type is (start, s0, s1, s2, s3, s4, s5);
    signal A : std_logic_vector(3 downto 0);
    signal M : std_logic_vector(3 downto 0);
    signal Q : std_logic_vector(3 downto 0);
    signal state : state_type;
    signal count : std_logic_vector(2 downto 0);
begin
    process (clk)
    begin
        
            case state is
                when start =>
                    state <= s0;
                when s0 =>
                    state <= s1;
                when s1 =>
                    state <= s2;
                when s2 =>
                    if (A(3) = '1') then
                        state <= s4;
                    else 
                        state <= s3;
                    end if;
                when s3 =>
                    state <= s5;
                when s4 =>
                    state <= s5;
                when s5 =>
                    if (count < n) then
                        state <= s1;
                    elsif (count = "000") then
                        state <= start;
                    end if;
            end case;
        
    end process;

    process (state) 
         variable t : std_logic_vector(2 downto 0) := "001";
    begin
        case state is
            when start =>
                M <= "0000";
                A <= "0000";
                Q <= "0000";  
                count <= n;           
            when s0 =>
                M <= divisor;
                A <= dividend(7 downto 4);
                Q <= dividend(3 downto 0);
            when s1 =>
                A <= A(2 downto 0) & Q(3);
                Q <= Q(2 downto 0) & '0';                
            when s2 =>
                A <= std_logic_vector(unsigned(A(3 downto 0)) - unsigned(M(3 downto 0)));
            when s3 =>
                Q(0) <= '1';
            when s4 =>
                Q(0) <= '0';
                A <= std_logic_vector(unsigned(A(3 downto 0)) + unsigned(M(3 downto 0)));
            when s5 =>
                count <= std_logic_vector(unsigned(count(2 downto 0)) - unsigned(t(2 downto 0)));
           
                    quotient <= "0000" & Q;
                    remainder <= A;                  
        end case;
     end process;
end archi;
