library ieee; 
use ieee.std_logic_1164.all;

entity tb_prob3 is
end tb_prob3;

architecture behavior of tb_prob3 is

component top_level
port(clk: in std_logic;
        m_val, q_val : in std_logic_vector(3 downto 0);
        a_out, q_out : out std_logic_vector(3 downto 0));
end component;

signal m_val : std_logic_vector(3 downto 0) := "0011";
signal q_val : std_logic_vector (3 downto 0) := "0111";
signal clk : std_logic := '0';
signal a_out, q_out : std_logic_vector(3 downto 0);

begin

clk <= not clk after 5 ns;

uut: top_level port map(
m_val => m_val ,
q_val => q_val,
clk => clk,
a_out => a_out,
q_out => q_out
);

stim_proc: process
begin
wait for 400 ns;
end process;
end;
