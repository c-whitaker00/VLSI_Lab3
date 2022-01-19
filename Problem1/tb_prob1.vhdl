library ieee; 
use ieee.std_logic_1164.all;

entity tb_prob1 is
end tb_prob1;

architecture behavior of tb_prob1 is

component prob1
port(X, Y: in std_logic_vector(3 downto 0);
        P: out std_logic_vector(7 downto 0));
end component;

signal X : std_logic_vector(3 downto 0) := "0000";
signal Y : std_logic_vector(3 downto 0) := "0000";

signal P : std_logic_vector(7 downto 0);

begin
uut: prob1 port map(
X => X,
Y => Y,
P => P
);

stim_proc: process
begin
wait for 20 ns;
X <= "0010";
Y <= "0100";
wait for 20 ns;
X <= "1111";
Y <= "0011";
end process;
end;









