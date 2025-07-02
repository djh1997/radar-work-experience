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