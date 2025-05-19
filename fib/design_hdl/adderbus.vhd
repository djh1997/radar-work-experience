LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY design_lib;
USE design_lib.ALL;

ENTITY busadd IS
  PORT (
    bit1  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    bit2  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    sum   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    carry : OUT STD_LOGIC);
END busadd;

ARCHITECTURE busadder OF busadd IS

  SIGNAL ha1carry_int : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

  COMPONENT halfadd
    PORT (
      bit1  : IN  STD_LOGIC;
      bit2  : IN  STD_LOGIC;
      sum   : OUT STD_LOGIC;
      carry : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT fulladd
    PORT (
      bit1    : IN  STD_LOGIC;
      bit2    : IN  STD_LOGIC;
      carryin : IN  STD_LOGIC;
      sum     : OUT STD_LOGIC;
      carry   : OUT STD_LOGIC);
  END COMPONENT;

BEGIN
  I0 : halfadd
  PORT MAP(
    bit1  => bit1(0),
    bit2  => bit2(0),
    sum   => sum(0),
    carry => ha1carry_int(0));

  -- systematically  generate component instantiate
  G1 : FOR i IN 0 TO 6 GENERATE
    C1 : fulladd
    PORT MAP(
      bit1    => bit1(i + 1),
      bit2    => bit2(i + 1),
      carryin => ha1carry_int(i),
      sum     => sum(i + 1),
      carry   => ha1carry_int(i + 1));
  END GENERATE;
  carry <= ha1carry_int(7);
END busadder;