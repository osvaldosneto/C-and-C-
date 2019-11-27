LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY bin2bcd IS
	PORT (
		c : IN std_logic_vector(6 DOWNTO 0); -- Ate 99
		sd, su : OUT std_logic_vector(3 DOWNTO 0)
	);
END ENTITY;
-----------------------------------------------------------Arquitetura 1
ARCHITECTURE hardware OF bin2bcd IS
	SIGNAL c_uns : unsigned (6 DOWNTO 0);
	SIGNAL sd_uns, su_uns : unsigned(6 DOWNTO 0); -- Mesmo numero de bit que o dividendo 7 bit
BEGIN
	sd <= std_logic_vector(resize(sd_uns, 4)); -- sd e su estao recebendo 7 bits/necessario usar resize unsigned
	su <= std_logic_vector(resize(su_uns, 4));

	sd_uns <= c_uns/10;
	su_uns <= c_uns REM 10;
	c_uns <= unsigned(c);
END ARCHITECTURE;

-----------------------------------------------------------Arquitetura 2 menos elementos logicos
ARCHITECTURE hardware2 OF bin2bcd IS
	SIGNAL c_uns : unsigned (6 DOWNTO 0);
	SIGNAL sd_uns, su_uns : unsigned(6 DOWNTO 0);
BEGIN
	sd <= std_logic_vector(resize(sd_uns, 4));
	su <= std_logic_vector(resize(su_uns, 4));

	sd_uns <= c_uns/10;
	su_uns <= resize(c_uns - sd_uns * 10, 7);
	c_uns <= unsigned(c);
END ARCHITECTURE;

----------------------------------------------------------ARQUITERUTRA 3 UTILIZANDO INTEIROS
ARCHITECTURE HARDWARE3 OF BIN2bcd IS
	SIGNAL SDI : INTEGER RANGE 0 TO 9;
	SIGNAL SUI : INTEGER RANGE 0 TO 9;
	SIGNAL CI : INTEGER RANGE 0 TO 99;

BEGIN
	CI <= TO_INTEGER (UNSIGNED(C));
	SDI <= CI/10;
	SUI <= CI REM 10;
	SD <= STD_logic_vector(TO_UNSIGNED(SDI, 4));
	SU <= STD_logic_vector(TO_UNSIGNED(SUI, 4));
END ARCHITECTURE;	

-----------------------------------------------------------Configuracao de arquitetura
CONFIGURATION bin2bcd_cfg OF bin2bcd IS
	FOR hardware3 END FOR;
END CONFIGURATION;