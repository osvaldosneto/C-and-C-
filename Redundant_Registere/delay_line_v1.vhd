library ieee;
use ieee.std_logic_1164.all;

--

entity delay_line_v1 is
	port (x: in bit;
			y: out bit);
end entity;

architecture example of delay_line_v1 is

	signal a, b, c: bit;
	attribute keep: boolean;
	attribute keep of a, b, c: signal is false;

begin

	a <= not x;
	b <= not a;
	c <= x;
	y <= c xor b;

end architecture;
