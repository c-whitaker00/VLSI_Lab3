library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity state_machine_tb is 
end entity;

architecture archi of state_machine_tb is

component state_machine
port(clk : in std_logic;
        divisor : in std_logic_vector(3 downto 0);
        dividend : in std_logic_vector(7 downto 0);
        n : in std_logic_vector(2 downto 0);
        quotient : out std_logic_vector(7 downto 0);
        remainder : out std_logic_vector(3 downto 0));
end component;

signal clk : std_logic := '0';
signal divisor : std_logic_vector(3 downto 0) := "0000";
signal dividend : std_logic_vector (7 downto 0) := "00000000";
signal n : std_logic_vector(2 downto 0) := "100";
signal quotient : std_logic_vector(7 downto 0);
signal remainder : std_logic_vector(3 downto 0);

begin

clk <= not clk after 5 ns;

uut: state_machine port map(
clk => clk,
divisor => divisor,
dividend => dividend,
n => n,
quotient => quotient,
remainder => remainder
);

stim_proc: process
begin 
divisor <= "0011";
dividend <= "00000111";
wait;
end process;
end archi; 











