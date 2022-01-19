library ieee; 
use ieee.std_logic_1164.all; 
entity top_level is
port(clk: in std_logic;
     m_val: in std_logic_vector(3 downto 0);
     q_val: in std_logic_vector(3 downto 0);
     a_out: out std_logic_vector(3 downto 0);
     q_out: out std_logic_vector(3 downto 0));
end top_level;

architecture archi of top_level is 


signal a0, a1, a2, a3, cout, control_as: std_logic;
signal qm0, qm1, qm2, qm3, qa0, qa1, qa2, qa3, qq0, qq1, qq2, qq3: std_logic;
signal in_a, in_b: std_logic_vector(3 downto 0);
signal m_control, a_control, count_control: std_logic_vector(1 downto 0);
signal q_control, count_val: std_logic_vector(2 downto 0);

component shift_register is
port( clk: in std_logic;
      control: in std_logic_vector(1 downto 0);
      d3, d2, d1, d0, shiftin: in std_logic;
      q3, q2, q1, q0: out std_logic);
end component;

component shift_register_q is
port( clk: in std_logic;
      control: in std_logic_vector(2 downto 0);
      d3, d2, d1, d0, shiftin: in std_logic;
      q3, q2, q1, q0: out std_logic);
end component;

component add_sub is
port( control: in std_logic;
      A, B: in std_logic_vector(3 downto 0);
      r3, r2, r1, r0: out std_logic;
      cout: out std_logic);
end component;

component counter is
port (input : in std_logic_vector(1 downto 0);
      count : out std_logic_vector(2 downto 0));
end component;

component div_state_machine is
port(
c_out: in std_logic;
clk: in std_logic;
counter: in std_logic_vector(2 downto 0);
control_A: out std_logic_vector(1 downto 0);
control_M: out std_logic_vector(1 downto 0);
control_Q: out std_logic_vector(2 downto 0);
as_control: out std_logic;
control_count: out std_logic_vector(1 downto 0));
end component;

begin

in_a <= qa3 & qa2 & qa1 & qa0;
in_b <= qm3 & qm2 & qm1 & qm0;

M: shift_register port map (clk, m_control, m_val(3), m_val(2), m_val(1), m_val(0), '0', qm3, qm2, qm1, qm0);
A: shift_register port map (clk, a_control, a3, a2, a1, a0, qq3, qa3, qa2, qa1, qa0);
Q: shift_register_q port map(clk, q_control, q_val(3), q_val(2), q_val(1), q_val(0), '0', qq3, qq2, qq1, qq0);
as: add_sub port map(control_as, in_a, in_b, a3, a2, a1, a0, cout);
c: counter port map(count_control, count_val);
fsm: div_state_machine port map(cout, clk, count_val, a_control, m_control, q_control, control_as, count_control);

a_out <= qa3 & qa2 & qa1 & qa0;
q_out <= qq3 & qq2 & qq1 & qq0;

end archi;
