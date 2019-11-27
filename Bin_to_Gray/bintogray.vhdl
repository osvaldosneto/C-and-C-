library ieee;
use ieee.std_logic_1164.all;

entity bintogray is
  generic (N : natural := 6); 
  port (
    bin : in std_LOGIC_VECTOR (n-1 downto 0);
	 gray : out std_LOGIC_VECTOR (n-1 downto 0)
  );
end entity;

architecture ifsc_v1 of bintogray is

begin
  
  gray(n-1) <= bin(n-1);
  
  lacofor: 
	for i in bin'left-1 downto 0 generate
		-- Concurrent Statement(s)
		gray(i) <= bin(i) xor bin(i + 1);
		
	end generate;
	
	
  
end architecture;