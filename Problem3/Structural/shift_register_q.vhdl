library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity shift_register_q is
port( clk: in std_logic;
      control: in std_logic_vector(2 downto 0);
      d3, d2, d1, d0, shiftin: in std_logic;
      q3, q2, q1, q0: out std_logic);

end shift_register_q;

architecture archi of shift_register_q is
signal in_reg : std_logic_vector (3 downto 0);
signal out_reg: std_logic_vector (3 downto 0);

begin 
    in_reg <= d3 & d2 & d1 & d0;
    proc: process(clk, control)
        begin
        
        if (control = "000") then 
            out_reg <= "0000";
        elsif (clk'event and clk = '1') then
            if (control = "001") then 
                out_reg <= in_reg;
            elsif (control = "010") then
                out_reg <= out_reg;
            elsif (control = "011") then
                out_reg <= out_reg(2) & out_reg(1) & out_reg(0) & shiftin;
            elsif (control = "100") then
                out_reg <= out_reg(3) & out_reg(2) & out_reg(1) & '1';
            elsif (control = "101") then
                out_reg <= out_reg(3) & out_reg(2) & out_reg(1) & '0';
            end if;
        end if;
    end process;
    q3 <= out_reg(3);
    q2 <= out_reg(2);
    q1 <= out_reg(1);
    q0 <= out_reg(0);
end archi;

