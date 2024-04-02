LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

--! Local libraries
LIBRARY design_lib;
USE design_lib.ALL;

--! ENTITY/Package Description
ENTITY GPIO_Test is
END ENTITY GPIO_Test;

architecture tb of GPIO_Test is
	SIGNAL	done	:	STD_LOGIC;
	SIGNAL	clk		:	STD_LOGIC;
begin

 --! Port map declaration for
	UUT : ENTITY design_lib.fibber
		port map (done	=> done,
			      clk	=> clk_system);

    Clk: PROCESS is
    begin
        while now <= 500*clk_speed loop
            clk_system <= '0';
            wait for clk_speed/2;
            clk_system <= '1';
            wait for clk_speed/2;
        END loop;
        wait;
    END PROCESS;

END architecture tb;