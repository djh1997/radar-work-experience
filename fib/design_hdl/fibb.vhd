LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY design_lib;
USE design_lib.ALL;

ENTITY fibb IS
  PORT (
    clk  : IN  STD_LOGIC;
    done : OUT STD_LOGIC
  );

END fibb;

ARCHITECTURE fibber OF fibb IS

  SIGNAL carry : STD_LOGIC;
  SIGNAL bit1  : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL bit2  : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL sum   : STD_LOGIC_VECTOR(7 DOWNTO 0);

  COMPONENT busadd
    PORT (
      bit1, bit2 : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      sum        : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      carry      : OUT STD_LOGIC
    );
  END COMPONENT;

  COMPONENT shift
    PORT (
      rst, trg : IN    STD_LOGIC;
      ip       : IN    STD_LOGIC_VECTOR (7 DOWNTO 0);
      op1      : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      op2      : OUT   STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;

BEGIN
  I0 : busadd
  PORT MAP(
    bit1  => bit1,
    bit2  => bit2,
    sum   => sum,
    carry => carry
  );
  I1 : shift
  PORT MAP(
    rst => carry,
    trg => clk,
    ip  => sum,
    op1 => bit1,
    op2 => bit2
  );
  done <= carry;
END fibber;