-- Declarao das bibliotecas e pacotes
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Especificao de todas as entradas e sadas do circuito
ENTITY n_flip_flop IS
	GENERIC (N : NATURAL := 8);
	PORT (
		d : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		clk, rst : STD_LOGIC;
		q : OUT STD_LOGIC_VECTOR (N-1 downto 0)
	);
END;

-- Descrio de como o circuito deve funcionar
ARCHITECTURE ifsc_v1 OF n_flip_flop IS
BEGIN
	PROCESS (clk, rst)
	BEGIN
		IF (rst = '1') THEN
			q <= (OTHERS => '0');
		ELSIF rising_edge(clk) THEN
			q <= d;
		END IF;
	END PROCESS;
END;