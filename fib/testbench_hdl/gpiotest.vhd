LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

--! Local libraries
LIBRARY design_lib;
USE design_lib.all;

--! ENTITY/Package Description
ENTITY GPIO_Test is
END ENTITY GPIO_Test;

architecture tb of GPIO_Test is
	SIGNAL	    done	       :	STD_LOGIC;
	SIGNAL	    clk          :	STD_LOGIC;
  CONSTANT    clk_speed    :  TIME  := 20 ns;
  SIGNAL      clk_system   :  STD_LOGIC;
begin

 --! Port map declaration for
	UUT : ENTITY design_lib.fibb
		port map (done	=> done,
			      clk	=> clk_system);
-- set up a process to generate a clock
    Clk_gen: PROCESS is
    begin
        while TRUE loop
            clk_system <= '0';
            wait for clk_speed/2;
            clk_system <= '1';
            wait for clk_speed/2;
        END loop;
        wait;
    END PROCESS;

END architecture tb;