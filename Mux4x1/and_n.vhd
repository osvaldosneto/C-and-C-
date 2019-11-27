
entity <and_n> is
	generic ( n : natural := 8 );


	port (
		x : in bit_vector (0 to n-1);

		y : out bit
	);
end entity;

architecture laco_for of and_n is
	
	signal fio : bit (0 to n-1);	

begin

	

	<generate_label>: 
	for i in (1 to n-1) generate
		
	end generate;


	

end architecture;
