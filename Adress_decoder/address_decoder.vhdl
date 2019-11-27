
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity address_decoder is
  generic (N : natural := 9); 
  port (
    address : in STD_LOGIC_VECTOR (N - 1 downto 0);
    ena : in STD_LOGIC;
    word_line : out STD_LOGIC_VECTOR(2 ** N - 1 downto 0)
  );
end entity;

architecture decoder of address_decoder is
  signal addr : natural range 0 to 2 ** N - 1;
begin
  addr <= to_integer(unsigned(address));
  gen : for i in word_line'range generate
    word_line(i) <= '0' when i = addr and ena = '1' else '1';
  end generate;
end architecture;
