library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pkg.all;

entity est is
	generic ( l : natural := 5;
				 c : natural := 4
	);
	
	port(
			mtxvagas : in matriz (l-1 downto 0, c-1 downto 0);
			nvagas : out std_logic_vector (5 downto 0)
	);	
end entity;

architecture ifsc_v1 of est is
			
begin
	process (mtxvagas)
	variable cont : integer range 0 to l*c;			
	begin
	cont := 0;	
	loop_for1:
	for i in 0 to l-1 loop
		loop_for2:
		for j in 0 to c-1 loop
			if mtxvagas(i,j) = '1' then
				cont := cont + 1;
			end if;						
		end loop;
	end loop;
	nvagas <= std_logic_vector(to_unsigned(cont, 6));
	end process;
end architecture;