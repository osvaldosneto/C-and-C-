----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------

entity sinaleira is
	generic
	(
		tmax	: natural := 45;
		trg	: natural := 30;
		try	: natural := 5;
		tgr	: natural := 45;
		tyr	: natural := 5);

	port (
		clk, rst 		 : 	in STD_LOGIC;
		
		r1, r2, g1, g2, y1, y2 : out STD_LOGIC);
end entity ;

----------------------------------------------------------

architecture ifsc_v1 of sinaleira is
	type state is (ry, gr, yr, rg);
	signal pr_state, nxstate : state;
	--attribute ENUM_ENCODING : string; --optional attribute
	--attribute ENUM_ENCODING of state : type is "sequential";
begin

	------Lower section of FSM:------------
	
	
	
	process (clk, rst)
	variable cont : integer range 0 to max;
	begin
		if (rst = '1') then
			pr_state <= rr;
			cont := 0;
		elsif (clk'EVENT AND clk = '1') then
			cont := cont+1;
				if(cont>=max) then
					pr_state <= nxstate;
					cont := 0;
				end if;
		end if;
	end process;
	
	------Upper section of FSM:------------
	
	process (pr_state)
		begin
			case pr_state is
				when rr => 
					if (timermax = ) then
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