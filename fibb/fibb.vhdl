LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY design_lib;
USE design_lib.ALL;

ENTITY fibb IS
    PORT( 
        clk    : IN    std_logic;
        done   : OUT   std_logic
    );


END fibb ;

ARCHITECTURE fibber OF fibb IS

SIGNAL carry : std_logic;
SIGNAL bit1 : std_logic_vector(7 downto 0);
SIGNAL bit2 : std_logic_vector(7 downto 0) := (0=>'1',others=>'0');
SIGNAL sum : std_logic_vector(7 downto 0);

COMPONENT busadder
    PORT (
        bit1, bit2    : IN    std_logic_vector(7 downto 0);
        sum     : OUT   std_logic_vector(7 downto 0);
        carry   : OUT   std_logic
    );
END COMPONENT;

COMPONENT shift_register
    PORT( 
        rst,trg : IN        std_logic;
        ip      : IN        std_logic_vector (7 DOWNTO 0);
        op1     : INOUT     std_logic_vector (7 DOWNTO 0);
        op2     : OUT       std_logic_vector (7 DOWNTO 0)
    );
END COMPONENT;

BEGIN
	I0 : busadder
	PORT MAP (
		bit1    => bit1,
		bit2    => bit2,
		sum     => sum,
		carry   => carry
	);
	I1 : shift_register
	port map (
		rst		=> carry,
		trg		=> clk,
		ip		=> sum,
		op1		=> bit1,
		op2		=> bit2
	);
END fibber;