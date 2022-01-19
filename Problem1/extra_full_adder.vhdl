library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity extra_full_adder is
    Port (A : in STD_LOGIC; 
    B : in STD_LOGIC;
    Sin : in STD_LOGIC;
    Cin : in STD_LOGIC;
    S : out STD_LOGIC;
    Cout : out STD_LOGIC);
end extra_full_adder;

architecture gate_level of extra_full_adder is
begin
    S <= (A AND B) XOR Sin XOR Cin;
    Cout <= ((A AND B) AND Sin) OR (Cin AND ((A AND B) XOR Sin));
end gate_level;
