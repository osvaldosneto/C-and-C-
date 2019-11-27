--File: mux2D.vhd
library ieee;

USE work.meu_pkg.ALL;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY mux2D IS
	GENERIC (M : NATURAL := 3; s : natural :=2; n : natural := 40);
	PORT (
		x : IN array2D(M - 1 DOWNTO 0, N - 1 DOWNTO 0);
		sel : IN bit_vector(s - 1 DOWNTO 0);
		y : OUT bit_vector(N - 1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE ifsc OF mux2D IS
	signal sel_slv : std_logic_vector (s-1 downto 0);
	signal sel_uns : unsigned (s-1 downto 0);
	signal sel_int : integer range 0 to m-1;

BEGIN
	sel_slv <= to_stdlogicvector(sel);
	sel_uns <= unsigned(sel_slv);
	sel_int <= to_integer(sel_uns);
	
	--y(0) <= x(sel_int,0);
	--y(1) <= x(sel_int,1);
	
	a: for i in 0 to n-1 generate
		y(i) <= x(sel_int, i);
		end generate;
	
END ARCHITECTURE;