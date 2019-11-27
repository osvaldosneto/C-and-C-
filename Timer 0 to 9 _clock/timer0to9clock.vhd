library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer0to9clock is
	generic( --freq_clock : natural := 50000000 para 1 segundo
				freq_clock : natural := 10);

	port(
		clk,rst : in std_logic;
		led : out std_logic_vector(3 downto 0);
		ssdout : out std_logic_vector(6 downto 0)	
	);
	
end entity;


architecture ifsc of timer0to9clock is

	signal q : integer range 0 to 9;
	signal q_clk : integer range 0 to freq_clock-1;
	signal clk_out : std_logic;

begin

	contagem_CLOCK: process (rst, clk) is
	variable count : integer range 0 to freq_clock-1;
	begin
	if(rst = '1') then
		count := 0;
	elsif (rising_edge(clk)) then
		if(count = freq_clock-1) then
			count := 0;
		else
			count := count + 1;
		end if;
	end if;
	q_clk <= count;
	end process;
	
	contagem: process (rst, clk_out) is
	variable count : integer range 0 to 9;
	begin
	if(rst = '1') then
		count := 0;
	elsif (rising_edge(clk_out)) then
		if(count = freq_clock-1) then
			count := 0;
		else
			count := count + 1;
		end if;
	end if;	
	
	q <= count;
	led <= std_logic_vector(to_unsigned(q,4));
	
	end process;
	
	clock: process (q) is
	begin
	if(q=0) then
		clk_out <= '1';
	else
		clk_out <= '0';
	end if;
	end process;
		
	process(q) is
	begin
		case q is
			when 0 => ssdout <= "0111111";
			when 1 => ssdout <= "0000110";
			when 2 => ssdout <= "1011011";
			when 3 => ssdout <= "1001111";
			when 4 => ssdout <= "1100110";
			when 5 => ssdout <= "1101101";
			when 6 => ssdout <= "1111101";
			when 7 => ssdout <= "0000111";
			when 8 => ssdout <= "1111111";
			when 9 => ssdout <= "1101111";
			when others => ssdout <= "0000000";
		end case;
	end process;
end architecture;
	