--File: mux1Dx1D.vhd
USE work.meu_pkg.ALL;

ENTITY mux1Dx1D IS
	GENERIC (M : NATURAL := 8);
	PORT (
		x : IN array1Dx1D(M - 1 DOWNTO 0);
		sel : IN INTEGER RANGE 0 TO M - 1;
		y : OUT bit_vector(Nbit - 1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE ifsc OF mux1Dx1D IS
BEGIN
	y <= x(sel);
END ARCHITECTURE;