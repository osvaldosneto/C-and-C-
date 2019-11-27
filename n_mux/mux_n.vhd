entity mux_n is
	generic( n:natural := 4; s:natural := 2 );	
	port(x : in bit_vector ( n-1 downto 0 );
		y : out bit;
		sel : bit_vector ( s-1 downto 0 ));
end entity;

architecture IFSC of mux_n is
begin
	y <= x(0) when sel = "00" else
		  x(1) when sel = "01" else
		  x(2) when sel = "10" else
		  x(3);
end architecture;

architecture IFSC_v2 of mux_n is
begin
	y <= x(0) when sel = "00" else
		  x(1) when sel = "01" else
		  x(2) when sel = "10" else
		  x(3);
	
end architecture;