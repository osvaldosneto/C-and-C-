library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity conta0_9 is
	generic
	(
	-- para contagem ate 10
 	--n_bit : natural := 4;
	--	n_count : natural := 10
	
	--para contagem ate 5000000
		n_bit : natural := 26;
		n_count : natural := 50000000
	);

	port
	(
		rst, clk :in std_logic;
		q	: out std_logic_vector (n_bit-1 downto 0)
	);
end entity;

architecture IFSC_V1 of conta0_9 is

begin

	conta:
	process (rst, clk) is
	variable count : integer range 0 to n_count-1;
	begin
		if (rst = '1') then
			count := 0;
		elsif (rising_edge(clk)) then
			if count = n_count-1 then
				count := 0;
			else
				count := count + 1;
			end if;
		end if;
		q <= std_logic_vector(to_unsigned(count, n_bit));
	end process;

end architecture;
