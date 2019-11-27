entity p1 is
	
	port
	(
		-- Input ports
		a0	: in  bit;
		a1	: in  bit;

		-- Output ports
		d0	: out bit;
		d1	: out bit;
		d2	: out bit;
		d3	: out bit
	);
end entity;

architecture IFSC of p1 is
begin
	
	d0 <= not(a0) and not(a1);
	d1 <= a0 and not (a1);
	d2 <= a1 and not (a0);
	d3 <= a0 and a1;
	
end architecture;