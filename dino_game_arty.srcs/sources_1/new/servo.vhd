library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity servo is port(
    i_clk  : in std_logic;
    i_data : in std_logic_vector(15 downto 0);
    i_val  : in std_logic;
    o_pwm  : out std_logic
);
end entity;


architecture rtl of servo is 

    constant upper_width    : integer := 21;
    constant max_count      : integer := 2_000_000; 

    
    signal s_counter        : unsigned(upper_width-1 downto 0):=(others=>'0');
    signal s_wave_pos       : unsigned(3 downto 0):=(others=>'0');
    signal s_op_cnt         : unsigned(upper_width-1 downto 0):=(others=>'0');
    signal s_delay_reg      : std_logic_vector(4 downto 0):=(others=>'0');
    
begin 

process(i_clk)
begin
    if rising_edge(i_clk) then 
        if s_counter = max_count - 1 then 
            s_counter <= (others=>'0');
            s_delay_reg <= s_delay_reg(s_delay_reg'high - 1 downto 0) & '0';
            if unsigned(i_data) < 30000 then
                s_delay_reg <= (others => '1');
                s_op_cnt <= to_unsigned(100_000,upper_width);
            elsif s_delay_reg = "00000" then
                s_op_cnt <= to_unsigned(150_000,upper_width);
            end if; 
        else
            s_counter <= s_counter + 1; 
        end if;
    end if;
end process;


o_pwm <= '1' when s_counter < s_op_cnt  else '0';


end architecture;