LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY design_lib;
USE design_lib.all;

ENTITY fibb IS
  PORT( 
    clk    : IN    std_logic;
    done   : OUT   std_logic
  );


END fibb ;

ARCHITECTURE fibber OF fibb IS

SIGNAL carry : std_logic;
SIGNAL bit1 : std_logic_vector(7 DOWNTO 0);
SIGNAL bit2 : std_logic_vector(7 DOWNTO 0);
SIGNAL sum : std_logic_vector(7 DOWNTO 0);

COMPONENT busadd
  PORT (
    bit1, bit2  : IN  std_logic_vector(7 DOWNTO 0);
    sum         : OUT std_logic_vector(7 DOWNTO 0);
    carry       : OUT std_logic
  );
END COMPONENT;

COMPONENT shift
  PORT( 
    rst,trg : IN    std_logic;
    ip      : IN    std_logic_vector (7 DOWNTO 0);
    op1     : INOUT std_logic_vector (7 DOWNTO 0);
    op2     : OUT   std_logic_vector (7 DOWNTO 0)
  );
END COMPONENT;

BEGIN
	I0 : busadd
	PORT MAP (
		bit1    => bit1,
		bit2    => bit2,
		sum     => sum,
		carry   => carry
	);
	I1 : shift
	port map (
		rst		=> carry,
		trg		=> clk,
		ip		=> sum,
		op1		=> bit1,
		op2		=> bit2
	);
  done <= carry;
END fibber;