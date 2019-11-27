
entity and_n is
	generic ( n : natural := 500 );


	port (
		x : in bit_vector (0 to n-1);

		y : out bit
	);
end entity;

architecture laco_for of and_n is
	
	signal fio : bit_vector (0 to n-1);	

begin

	y <= fio(n-1);

	loop_for: 
	for i in 1 to n-1 generate
		fio(i) <= fio(i-1) and x(i);
	end generate;

	fio(0) <= x(0);
	

end architecture;
