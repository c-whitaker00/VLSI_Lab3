library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cla is 
Port (A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
Cin : in STD_LOGIC_VECTOR;
S : out STD_LOGIC_VECTOR (3 downto 0);
Cout : out STD_LOGIC);
end cla;

architecture gate_level of cla is

component mini_block
Port (A : in STD_LOGIC;
B : in STD_LOGIC;
Cin : in STD_LOGIC;
S : out STD_LOGIC;
P : out STD_LOGIC;
G : out STD_LOGIC);
end component;

signal c_0, c_1, c_2: STD_LOGIC;
signal P, G: STD_LOGIC_VECTOR (3 downto 0);
begin

MB1: mini_block port map(A(0), B(0), Cin, S(0), P(0), G(0));
MB2: mini_block port map(A(1), B(1), c_0, S(1), P(1), G(1));
MB3: mini_block port map(A(2), B(2), c_1, S(2), P(2), G(2));
MB4: mini_block port map(A(3), B(3), c_2, S(3), P(3), G(3));


c_0 <= G(0) OR (P(0) AND Cin) after 2 ns;
c_1 <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin) after 2 ns;
c_2 <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin) after 2 ns;
Cout <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin) after 2 ns;                                               

end gate_level;





