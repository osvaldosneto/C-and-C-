library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity soma_cout is
	generic
	(	n	: natural  :=	4	);

	port
	(
		a,b	: in  std_logic_vector(n-1 downto 0);
		c_out : out std_logic;
		x	: out std_logic_vector (n-1 downto 0)
	);
end soma_cout;


architecture IFSC_V1 of soma_cout is

	signal a_uns, b_uns, x_uns : unsigned (n downto 0);

begin
	
	a_uns <= resize(unsigned(a), n+1);
	b_uns <= resize(unsigned(b), n+1);
	c_out <= x_uns(n);
	x_uns <= a_uns + b_uns;
	x <= std_logic_vector(resize(x_uns, n));
	
end architecture;
