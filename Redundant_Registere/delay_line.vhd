library ieee;
use ieee.std_logic_1164.all;

entity delay_line is
	port (x: in bit;
			y: out bit);
end entity;

architecture example of delay_line is

	signal a, b, c: bit;
	attribute keep: boolean;
	attribute keep of a, b, c: signal is true;

begin

	a <= not x;
	b <= not a;
	c <= not b;
	y <= not c;

end architecture;
