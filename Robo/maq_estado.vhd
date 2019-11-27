library ieee;
use ieee.std_logic_1164.all;

entity maq_estado is
	port(
		clk, rst, sensor, inicia : in std_logic;
		avanca, limpa, direita, esquerda : out std_logic
	);
end entity;

architecture ifsc of maq_estado is
	
	type state is (A1, R1, A2, R2, A3, R3, A4, R4, FIM, W2, INICIO, W1, I1, I2, I3, I4, I5);
	signal prstate, nxstate : state;
	--attribute ENUM_ENCODING : string; --optional attribute
	--attribute ENUM_ENCODING of state : type is "sequential";
begin

	process (clk, rst)
	begin
		if (rst = '1') then
			prstate <= INICIO;
		elsif (clk'EVENT AND clk = '1') then
			prstate <= nxstate;
		end if;
	end process;

	process (sensor, inicia, prstate)
	begin
	
		avanca <= '0';
		limpa <= '0';
		direita <= '0';
		esquerda <= '0';
	
		case prstate is
		
		when INICIO =>
			if (inicia = '1') then
				nxstate <= W1;
			else
				nxstate <= INICIO;
			end if;
	
		when W1 =>
			if (inicia = '0') then
				nxstate <= I1;
			else
				nxstate <= W1;
			end if;
			
		when I1 =>
			avanca <= '1';
			if (sensor = '1') then
				nxstate <= I2;
			elsif (inicia = '1') then
				nxstate <= W2;
			else
				nxstate <= I1;
			end if;
			
		when I2 =>
			esquerda <= '1';
			nxstate <= I3;
		
		when I3 =>
			avanca <= '1';
			if(sensor = '1') then
				nxstate <= I4;
			elsif (inicia = '1') then
				nxstate <= W2;
			else
				nxstate <= I3;
			end if;
			
		when I4 =>
			direita <= '1';
			nxstate <= I5;
			
		when I5 =>
			direita <= '1';
			nxstate <= A1;
			
		when A1 =>
			avanca <= '1';
			limpa <= '1';
			if(sensor = '1') then
				nxstate <= R1;
			else
				nxstate <= A1;
			end if;
			
		when R1 =>
			direita <= '1';
			if(sensor = '1') then
				nxstate <= FIM;
			else
				nxstate <= A2;
			end if;
			
		when A2 =>
			avanca <= '1';
			nxstate <= R2;
			
		when R2 =>
			direita <= '1';
			nxstate <= A3;
		
		when A3 =>
			avanca <= '1';
			limpa <= '1';
			if(sensor = '1') then
				nxstate <= R3;
			elsif(inicia = '1') then
				nxstate <= W2;
			else
				nxstate <= A3;
			end if;
			
		when R3 =>
			esquerda <= '1';
			if(sensor = '1') then
				nxstate <= FIM;
			else
				nxstate <= A4;
			end if;
		
		when A4 =>
			avanca <= '1';
			nxstate <= R4;
			
		when R4 =>
			avanca <= '1';
			nxstate <= A1;
			
		when W2 =>
			if(inicia = '0') then
				nxstate <= INICIO;
			else
				nxstate <= W2;
			end if;
			
		when FIM =>
			nxstate <= FIM;
			
		end case;
	end process;


end architecture;