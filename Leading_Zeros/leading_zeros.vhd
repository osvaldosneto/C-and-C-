------------------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 ------------------------------------------------
 ENTITY leading_zeros IS
 PORT (data: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
 zeros: OUT INTEGER RANGE 0 TO 8);
 END ENTITY;
 ------------------------------------------------
 ARCHITECTURE behavior OF leading_zeros IS
 BEGIN
 PROCESS (data)
	VARIABLE count: INTEGER RANGE 0 TO 8;
	BEGIN
	count := 0;
	FOR i IN data'RANGE LOOP
		CASE data(i) IS
			WHEN '0' => count := count + 1;
			WHEN OTHERS => EXIT;
		END CASE;
	END LOOP;
	zeros <= count;
 END PROCESS;
 END ARCHITECTURE;
 ------------------------------------------------


