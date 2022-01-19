library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mini_block is
Port (A : in STD_LOGIC;
B : in STD_LOGIC;
Cin : in STD_LOGIC; 
S : out STD_LOGIC;
P : out STD_LOGIC;
G : out STD_LOGIC);
end mini_block;

architecture gate_level of mini_block is

begin

S <= A XOR B XOR Cin after 2 ns;
P <= A XOR B after 2 ns;
G <= A AND B after 2 ns;

end gate_level;
