LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

--! Local libraries
LIBRARY design_lib;
USE design_lib.ALL;

--! ENTITY/Package Description
ENTITY GPIO_Test IS
END ENTITY GPIO_Test;

ARCHITECTURE tb OF GPIO_Test IS
  SIGNAL done        : STD_LOGIC;
  SIGNAL clk         : STD_LOGIC;
  CONSTANT clk_speed : TIME := 20 ns;
  SIGNAL clk_system  : STD_LOGIC;
BEGIN

  --! Port map declaration for
  UUT : ENTITY design_lib.fibb
    PORT MAP(
      done => done,
      clk  => clk_system);
  -- set up a process to generate a clock
  Clk_gen : PROCESS IS
  BEGIN
    WHILE TRUE LOOP
      clk_system <= '0';
      WAIT FOR clk_speed/2;
      clk_system <= '1';
      WAIT FOR clk_speed/2;
    END LOOP;
    WAIT;
  END PROCESS;

END ARCHITECTURE tb;