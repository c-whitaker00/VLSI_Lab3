library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
port (input : in std_logic_vector(1 downto 0);
      count : out std_logic_vector(2 downto 0));
end counter;

architecture archi of counter is

signal temp: std_logic_vector(2 downto 0);
begin
process(input)
variable t : std_logic_vector(2 downto 0) := "001";
begin

if (input = "00") then 
temp <= "100";
elsif (input = "01") then 
temp <= temp;
elsif (input = "10") then
temp <= std_logic_vector(unsigned(temp(2 downto 0)) - unsigned(t(2 downto 0)));
end if;
end process;

count <= temp;

end archi;
