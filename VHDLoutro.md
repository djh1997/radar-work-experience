## VHDL File Structure
  
*[GPIO]: Genral purpose input output
  
The individual [files](https://github.com/djh1997/radar-work-experience/tree/main/fib ) contain the building block for all the sub components.
  
![fulladder](logic/busadder.svg )
  
```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
  
LIBRARY design_lib;
USE design_lib.ALL;
  
-- set up the inputs and outputs for the component
ENTITY halfadd IS
  PORT (
    num1, num2 : IN  STD_LOGIC;
    sum, carry : OUT STD_LOGIC);
END halfadd;
  
-- set up the internal combinational logic
ARCHITECTURE halfadder OF halfadd IS
BEGIN
  sum   <= num1 XOR num2;
  carry <= num1 AND num2;
END halfadder;
```  
  
The *architecture* code links individual *components* together into larger blocks of logic, using *internal signals* where necessary.
  
![image showing a representation of the vhdl components being built up](assets/8_Bit_Adder_01.png )
  
```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
  
LIBRARY design_lib;
USE design_lib.ALL;
  
ENTITY busadd IS
  PORT (
    num1  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    num2  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    sum   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    carry : OUT STD_LOGIC);
END busadd;
  
ARCHITECTURE busadder OF busadd IS
  
  SIGNAL ha1carry_int : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
  
  COMPONENT halfadd
    PORT (
      num1  : IN  STD_LOGIC;
      num2  : IN  STD_LOGIC;
      sum   : OUT STD_LOGIC;
      carry : OUT STD_LOGIC);
  END COMPONENT;
  
  COMPONENT fulladd
    PORT (
      num1    : IN  STD_LOGIC;
      num2    : IN  STD_LOGIC;
      carryin : IN  STD_LOGIC;
      sum     : OUT STD_LOGIC;
      carry   : OUT STD_LOGIC);
  END COMPONENT;
  
BEGIN
  I0 : halfadd
  PORT MAP(
    num1  => num1(0),
    num2  => num2(0),
    sum   => sum(0),
    carry => ha1carry_int(0));
  
  -- systematically  generate component instantiate
  G1 : FOR i IN 0 TO 6 GENERATE
    C1 : fulladd
    PORT MAP(
      num1    => num1(i + 1),
      num2    => num2(i + 1),
      carryin => ha1carry_int(i),
      sum     => sum(i + 1),
      carry   => ha1carry_int(i + 1));
  END GENERATE;
  carry <= ha1carry_int(7);
END busadder;
```  
  
Then there is the GPIO test bench to run a simulation of the code.
  
```vhdl
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
```  
  