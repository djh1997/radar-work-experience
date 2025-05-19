LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY design_lib;
USE design_lib.ALL;

ENTITY fulladd IS
  PORT (
    bit1, bit2, carryin : IN  STD_LOGIC;
    sum, carry          : OUT STD_LOGIC
  );
END fulladd;

ARCHITECTURE fulladder OF fulladd IS

  -- set up internal signals
  SIGNAL ha1sum_int   : STD_LOGIC;
  SIGNAL ha1carry_int : STD_LOGIC;
  SIGNAL ha2sum_int   : STD_LOGIC;
  SIGNAL ha2carry_int : STD_LOGIC;

  -- call up lower component
  COMPONENT halfadd
    PORT (
      bit1, bit2 : IN  STD_LOGIC;
      sum, carry : OUT STD_LOGIC
    );
  END COMPONENT;

BEGIN

  -- connect lower components to each other and internal signals
  I0 : halfadd
  PORT MAP(
    bit1  => bit1,
    bit2  => bit2,
    sum   => ha1sum_int,
    carry => ha1carry_int
  );

  I1 : halfadd
  PORT MAP(
    bit1  => ha1sum_int,
    bit2  => carryin,
    sum   => sum,
    carry => ha2carry_int
  );
  carry <= ha1carry_int OR ha2carry_int;
END fulladder;