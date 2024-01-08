LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY design_lib;
USE design_lib.ALL;

ENTITY fulladd IS
    PORT( 
        bit1, bit2, carryin	: IN    std_logic;
        sum, carry			: OUT   std_logic
    );


END fulladd ;

ARCHITECTURE fulladder OF fulladd IS

SIGNAL ha1sum_int   : Std_Logic;
SIGNAL ha1carry_int : Std_Logic;
SIGNAL ha2sum_int   : Std_Logic;
SIGNAL ha2carry_int : Std_Logic;

COMPONENT halfadder
    PORT (
        bit1, bit2	: IN    std_logic;
        sum, carry	: OUT   std_logic
    );
END COMPONENT;
   
BEGIN
    I0 : halfadder
    PORT MAP (
        bit1    => bit1,
        bit2    => bit2,
        sum     => ha1sum_int,
        carry   => ha1carry_int
    );
	
    I1 : halfadder
    PORT MAP (
        bit1    => ha1sum_int,
        bit2    => carryin,
        sum     => sum,
        carry   => ha2carry_int
    );
    carry <= ha1carry_int OR ha2carry_int;
END fulladder;