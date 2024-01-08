LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY design_lib;
USE design_lib.ALL;

ENTITY halfadd IS
    PORT( 
        bit1, bit2	: IN    std_logic;
        sum, carry	: OUT   std_logic
    );


END halfadd ;

ARCHITECTURE halfadder OF halfadd IS
BEGIN
	sum <= bit1 XOR bit2;
	carry <= bit1 AND bit2;
END halfadder;