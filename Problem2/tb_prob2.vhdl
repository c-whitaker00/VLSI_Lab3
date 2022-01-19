library ieee; 
use ieee.std_logic_1164.all;

entity tb_prob2 is
end tb_prob2;

architecture behavior of tb_prob2 is

component prob2
port(A, B: in std_logic_vector(8 downto 0);
        clk : std_logic;
        load_in : std_logic;
        result: out std_logic);
end component;

signal A : std_logic_vector(8 downto 0) := "000000000";
signal B : std_logic_vector (8 downto 0) := "000000000";
signal clk : std_logic := '0';
signal load_in : std_logic := '0';
signal result : std_logic;

begin

clk <= not clk after 5 ns;

uut: prob2 port map(
A => A,
B => B,
clk => clk,
load_in => load_in,
result => result
);

stim_proc: process
begin
wait for 12 ns;
A <= "000000110";
B <= "000000100";
load_in <= '1';
wait for 12 ns;
load_in <= '0';
wait;
end process;
end;
