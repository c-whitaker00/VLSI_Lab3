library ieee; 
use ieee.std_logic_1164.all;
entity add_sub is
port( control: in std_logic;
      A, B : in std_logic_vector(3 downto 0);
      r3, r2, r1, r0 : out std_logic;
      cout: out std_logic);
end add_sub;

architecture archi of add_sub is
component full_adder is
port (X: in STD_LOGIC;
    Y: in STD_LOGIC;
    Cin : in STD_LOGIC;
    S: out STD_LOGIC;
    Cout: out STD_LOGIC);
end component;

signal c1, c2, c3: std_logic;
signal t0, t1, t2, t3: std_logic;

begin t0 <= B(0) xor control;
  t1 <= B(1) xor control;
  t2 <= B(2) xor control;
  t3 <= B(3) xor control;
FA0: full_adder port map (A(0), t0, control, r0, c1);
FA1: full_adder port map (A(1), t1, c1, r1, c2);
FA2: full_adder port map (A(2), t2, c2, r2, c3);
FA3: full_adder port map (A(3), t3, c3, r3, cout);
end archi;
