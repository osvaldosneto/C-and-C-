library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
	generic
	( n	: natural :=	7	);

	port
	(
		-- Input ports
		rst_a	: in  std_logic;
		clk	: in  std_logic;

		-- Output ports
		resultado	: out std_logic_vector(2 downto 0)
	);
end entity;


architecture ifsc of counter is

begin
	process(clk, rst_a)
	
		variable cont : integer range 0 to n;
		
		begin
	
		if rst_a = '1' then
			cont := 0;
			
		elsif rising_edge(clk) then
			-- Sequential Statement(s)
			
			if cont = 7 then
				cont := 0;
			else
				cont := cont + 1;
			end if;
		
		end if;
		
		resultado <= std_logic_vector(to_unsigned(cont, 3));
		
	end process;

end architecture;
