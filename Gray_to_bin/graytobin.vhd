library ieee;
use ieee.std_logic_1164.all;

entity graytobin is
  generic (N : natural := 6); 
  port (
    gray : in std_LOGIC_VECTOR (n-1 downto 0);
	 bin : buffer std_LOGIC_VECTOR (n-1 downto 0)
  );
end entity;

architecture ifsc_v1 of graytobin is

begin
  
  bin(n-1) <= gray(n-1);
  
  lacofor: 
	for i in gray'left-1 downto 0 generate
		-- Concurrent Statement(s)
		bin(i) <= gray(i) xor bin(i + 1);
		
	end generate;

  
end architecture; 