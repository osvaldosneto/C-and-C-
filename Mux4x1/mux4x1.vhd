library ieee;
use ieee.std_logic_1164.all;


entity mux4x1 is
	
	port	(	
		x0, x1, x2, x3 : in std_logic;
		sel : in std_logic_vector (1 downto 0);
		
		y : out std_logic);


end mux4x1;





architecture v1 of mux4x1 is

begin

label_01: y <= 
	x0 when sel = "00" else
	x1 when sel = "01" else
	x2 when sel = "10" else
	x3;
	--<value> when <condition> else 
end architecture;





architecture v2 of mux4x1 is

begin

label_01: with sel select
	y <= x0 when "00",
		  x1 when "01",
		  x2 when "10",
		  x3 when others;	  
			--	<value> when <choices>
			--	<value> when <choices>
	 		 --   ...
			--	<value> when others;

end architecture;




architecture v3 of mux4x1 is

begin

end architecture;






configuration confmux4x1 of mux4x1 is
	for v2
	end for;
end configuration;

