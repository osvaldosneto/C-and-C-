----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

----------------------------------------------------------

entity maq_estado is
	port (
		clk, rst 		 : in STD_LOGIC;
		e5c, e10c, e25c : in STD_LOGIC;
		bala, d5c, d10c : out STD_LOGIC);
end entity ;

----------------------------------------------------------

architecture ifsc_v1 of maq_estado is
	type state is (st0, st5, st10, st15, st20, st25, st30, st35, st40, st45);
	signal pr_state, nxstate : state;
	--attribute ENUM_ENCODING : string; --optional attribute
	--attribute ENUM_ENCODING of state : type is "sequential";
begin

	------Lower section of FSM:------------
	
	process (clk, rst)
	begin
		if (rst = '1') then
			pr_state <= st0;
		elsif (clk'EVENT AND clk = '1') then
			pr_state <= nxstate;
		end if;
	end process;
	
	------Upper section of FSM:------------
	
	process (pr_state, e5c, e10c, e25c)
		begin
		
		bala <= '0';
		d5c <= '0';
		d10c <= '0';
			
			case pr_state is
				when st0 => 
					if (e5c = '1') then
						nxstate <= st5;
					elsif (e10c = '1') then
						nxstate <= st10;
					elsif (e25c = '1') then
						nxstate <= st25;
					else
						nxstate <= st0;
					end if;
					
				when st5 => 
					if (e5c = '1') then
						nxstate <= st10;
					elsif (e10c = '1') then
						nxstate <= st15;
					elsif (e25c = '1') then
						nxstate <= st30;
					else
						nxstate <= st5;
					end if;
				when st10 => 
					if (e5c = '1') then
						nxstate <= st15;
					elsif (e10c = '1') then
						nxstate <= st20;
					elsif (e25c = '1') then
						nxstate <= st35;
					else
						nxstate <= st10;
					end if;
				when st15 => 
					if (e5c = '1') then
						nxstate <= st20;
					elsif (e10c = '1') then
						nxstate <= st25;
					elsif (e25c = '1') then
						nxstate <= st40;
					else
						nxstate <= st15;
					end if;
				when st20 => 
					if (e5c = '1') then
						nxstate <= st25;
					elsif (e10c = '1') then
						nxstate <= st30;
					elsif (e25c = '1') then
						nxstate <= st45;
					else
						nxstate <= st20;
					end if;
				when st25 => 
					bala <= '1';
					nxstate <= st0;
				when st30 => 
					d5c <= '1';
					bala <= '1';
					nxstate <= st0;
				when st35 => 
					d10c <= '1';
					bala <= '1';
					nxstate <= st0;
				when st40 => 
					d10c <= '1';
					d5c <= '1';
					bala <= '1';
					nxstate <= st0;
				when st45 => 
					d10c <= '1';
					d10c <= '1';
					bala <= '1';
					nxstate <= st0;
			end case;
		end process;
		end architecture ;
		----------------------------------------------------------