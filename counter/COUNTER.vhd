Library IEEE;
Use IEEE.std_logic_1164.All;
Use IEEE.numeric_std.All; -- for the unsigned type

Entity COUNTER Is
	Generic (
		WIDTH : In Natural := 32
	);
	Port (
		RST : In std_logic;
		CLK : In std_logic;
		LOAD : In std_logic;
		DATA : In std_logic_vector(WIDTH - 1 Downto 0);
		Q : Out std_logic_vector(WIDTH - 1 Downto 0)
	);
End Entity COUNTER;

Architecture RTL Of COUNTER Is
	Signal CNT : unsigned(WIDTH - 1 Downto 0);
Begin
	Process (RST, CLK) Is
	Begin
		If RST = '1' Then
			CNT <= (Others => '0');
		Elsif rising_edge(CLK) Then
			If LOAD = '1' Then
				CNT <= unsigned(DATA); -- type is converted to unsigned
			Else
				CNT <= CNT + 1;
			End If;
		End If;
	End Process;

	Q <= std_logic_vector(CNT); -- type is converted back to std_logic_vector
End Architecture RTL;