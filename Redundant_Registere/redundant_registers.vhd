ENTITY redundant_registers IS
	 PORT (
		clk, x: IN BIT;
		y: OUT BIT);
 END ENTITY;
 
 ARCHITECTURE arch OF redundant_registers IS
	 SIGNAL a, b, c: BIT;
         -- NORMAL -- 1 LE
	 --ATTRIBUTE preserve: BOOLEAN;
	 --ATTRIBUTE preserve OF a, b, c: SIGNAL IS TRUE; -- 2 LE 
	 ATTRIBUTE noprune: BOOLEAN;
	 ATTRIBUTE noprune OF a, b, c: SIGNAL IS TRUE; --3 LE
	 --ATTRIBUTE keep: BOOLEAN;
	 --ATTRIBUTE keep of a,b,c: SIGNAL IS TRUE;
 BEGIN
	 PROCESS (clk)
	 BEGIN
		 IF (clk'EVENT AND clk='1') THEN
			 a <= x;
			 b <= x;
			 c <= x;
		 END IF;
	 END PROCESS;
	 y <= a AND b;
 END ARCHITECTURE;