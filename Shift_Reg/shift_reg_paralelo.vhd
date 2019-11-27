library ieee;
use ieee.std_logic_1164.all;

entity shift_reg_paralelo is
	generic( n : natural := 8	);

	port (
		clk, rst : 	in std_logic;
		din 		: 	in std_logic;
		qout 		: 	out std_logic_vector(0 to n-1)
	);
		
end entity;

architecture ifsc_v3 of shift_reg_paralelo is --saida paralela

	signal q, d : std_logic_vector(0 to n-1);

begin
	process(clk, rst) is
	begin
		if not(rst = '1') then
			q <= (others => '0');
		elsif rising_edge(clk) then
			q <= din & q(0 to n-2);
		end if;	
	end process;

qout <= q;
	
end architecture;
