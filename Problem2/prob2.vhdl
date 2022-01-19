library IEEE;
use IEEE.std_logic_1164.all;

entity prob2 is
port (
    A : in std_logic_vector (8 downto 0);
    B : in std logic_vector (8 downto 0);
    clk : in std_logic;
    load_in : in std_logic;
    result: out std_logic);

end prob2

architecture behavioral of prob2 is
signal co : std_logic := '0';
signal A_reg : std_logic_vector(8 downto 0) := (others => '0');
signal B_reg : std_logic_vector(8 downto 0) := (others => '0');
signal reg_out : std_logic_vector(7 downto 0) := (others => '0');

begin
process(clk)
variable Sum : std_logic;
begin
if (rising_edge(clk)) then
    if (load_in = '1') then
        A_reg <= A;
        B_reg <= B;
        co <= '0';
    else                
        B_reg <= ('0' & B_reg(8 downto 1));
        A_reg <= ('0' & A_reg(8 downto 1));
        Sum <= (A_reg(0) xor B_reg(0)) xor (co);
        co <= ((A_reg(0) xor B_Reg(0)) and co) or (A_reg(0) and B_Reg(0));        
        reg_out <= (Sum & reg_out(7 downto 1));
        result <= reg_out(0);
    end if;
end if;
end process;
end behavioral;
