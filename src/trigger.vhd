library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity trigger is
	port(
	clk			: in std_logic;
	trig_in		: in std_logic;
	trigSlope	: in std_logic;  
	trigger 		: out std_logic :='0'
	);
end trigger;

architecture rtl of trigger is 	
begin


trigProc : process(clk) is
	variable lastVal 		: std_logic :='0'; 
	variable trigCount 	: natural range 0 to 999:=0;

	begin
		if rising_edge(clk) then
			--positive trigger
			if trigSlope = '1' then
				if trig_in = '1' then  
					trigCount:=trigCount+1;
					if trigCount=2 then
						trigger <= '1'; --only set the trigger high on second clock cycle.
					else
						trigger <= '0';
					end if;
				else					
					trigCount:=0;
					trigger <= '0';
					
				end if;	
			else 
				--negative trigger
				if trig_in = '0' then
						trigCount:=trigCount+1;
					if trigCount=2 then
						trigger <= '1';
					else
						trigger <= '0';
					end if;
				else					
					trigCount:=0;
					trigger <= '0';
					
				end if;	
			end if;
			lastVal:=trig_in;
		end if;
			
end process trigProc;
	

end rtl;	