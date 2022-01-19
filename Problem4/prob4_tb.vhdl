library ieee; 
use ieee.std_logic_1164.all;

entity prob4_tb is
end prob4_tb;

architecture archi of prob4_tb is

component cla
port(A, B: in std_logic_vector(3 downto 0);
       Cin: in std_logic;
        S: out std_logic_vector(3 downto 0);
       Cout: out std_logic);
end component;

signal A : std_logic_vector (3 downto 0) := "0000";
signal B : std_logic_vector (3 downto 0) := "0000";
signal Cin : std_logic := '0';

signal S : std_logic_vector(3 downto 0);
signal Cout : std_logic;

begin
uut: prob1 port map(
A => A,
B => B,
Cin => Cin,
S => S,
Cout => Cout
);

stim_proc: process
begin
wait for 20 ns;
A <= "0001";
B <= "0010";
wait for 20 ns;
A <= "0011";
B <= "0100";
wait for 20 ns;
A <= "1111";
B <= "1111";
Cin <= '1';
end process;
end archi;


