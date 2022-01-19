library ieee; 
use ieee.std_logic_1164.all;
entity prob1 is
    port(X, Y: in std_logic_vector(3 downto 0);
        P: out std_logic_vector(7 downto 0));
end prob1;

architecture archi of prob1 is
signal C0, C1, C2, C3, C4: std_logic_vector(3 downto 0);
signal S0, S1, S2, S3: std_logic_vector(2 downto 0);

component full_adder
    port(A, B, Cin: in std_logic;
         Cout, S: out std_logic);
end component;

component extra_full_adder
    port(A, B, Sin, Cin : in std_logic;
         Cout, Sum: out std_logic);
end component;

begin

    EFA1: extra_full_adder port map (Y(0), X(0), '0', '0', C0(0), P(0));
    EFA2: extra_full_adder port map (Y(1), X(0), '0', '0', C0(1), S0(0));
    EFA3: extra_full_adder port map (Y(2), X(0), '0', '0', C0(2), S0(1));
    EFA4: extra_full_adder port map (Y(3), X(0), '0', '0', C0(3), S0(2));

    EFA5: extra_full_adder port map (Y(0), X(1), S0(0), C0(0), C1(0), P(1));
    EFA6: extra_full_adder port map (Y(1), X(1), S0(1), C0(1), C1(1), S1(0));
    EFA7: extra_full_adder port map (Y(2), X(1), S0(2), C0(2), C1(2), S1(1));
    EFA8: extra_full_adder port map (Y(3), X(1), '0', C0(3), C1(3), S1(2));

    EFA9: extra_full_adder port map (Y(0), X(2), S1(0), C1(0), C2(0), P(2));
    EFA10: extra_full_adder port map (Y(1), X(2), S1(1), C1(1), C2(1), S2(0));
    EFA11: extra_full_adder port map (Y(2), X(2), S1(2), C1(2), C2(2), S2(1));
    EFA12: extra_full_adder port map (Y(3), X(2), '0', C1(3), C2(3), S2(2));

    EFA13: extra_full_adder port map (Y(0), X(3), S2(0), C2(0), C3(0), P(3));
    EFA14: extra_full_adder port map (Y(1), X(3), S2(1), C2(1), C3(1), S3(0));
    EFA15: extra_full_adder port map (Y(2), X(3), S2(2), C2(2), C3(2), S3(1));
    EFA16: extra_full_adder port map (Y(3), X(3), '0', C2(3), C3(3), S3(2));

    FA1: full_adder port map (S3(0), C3(0), '0', C4(0), P(4));
    FA2: full_adder port map (S3(1), C3(1), C4(0), C4(1), P(5));
    FA3: full_adder port map (S3(2), C3(2), C4(1), C4(2), P(6));
    FA4: full_adder port map ('0', C3(3), C4(2), C4(3), P(7));

end Behavioral;



