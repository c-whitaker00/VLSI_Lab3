library ieee;
use ieee.std_logic_1164.all;

entity full_adder is 
    port (X : in STD_LOGIC;
    Y: in STD_LOGIC;
    Cin: in STD_LOGIC;
    S: out STD_LOGIC;
    Cout: out STD_LOGIC);
end full_adder;

architecture gate_level of full_adder is 
begin
    S <= X XOR Y XOR Cin;
    Cout <= (X AND Y) OR (Cin AND (X XOR Y));
end gate_level;
