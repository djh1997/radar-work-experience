LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY shift IS
  PORT (
    rst, trg : IN    STD_LOGIC := '0';
    ip       : IN    STD_LOGIC_VECTOR (7 DOWNTO 0);
    op1      : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0) := (0      => '1', OTHERS => '0');
    op2      : OUT   STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0')
  );

END shift;

ARCHITECTURE shift_register OF shift IS
BEGIN
  shiftrg : PROCESS (trg)
  BEGIN
    IF FallING_EDGE(trg) THEN
      op2 <= op1;
      op1 <= ip(7 DOWNTO 0);
      IF rst = '1' THEN
        op1 <= (0      => '1', OTHERS => '0');
        op2 <= (OTHERS => '0');
      END IF;
    END IF;
  END PROCESS shiftrg;
END shift_register;