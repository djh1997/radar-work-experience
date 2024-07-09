LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY design_lib;
USE design_lib.ALL;

-- set up the inputs and outputs for the component
ENTITY halfadd IS
    PORT(bit1, bit2	: IN    std_logic;
         sum, carry	: OUT   std_logic);
END halfadd ;

-- set up the internal combinational logic
ARCHITECTURE halfadder OF halfadd IS
BEGIN
	sum <= bit1 XOR bit2;
	carry <= bit1 AND bit2;
END halfadder;