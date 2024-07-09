LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY shift IS
    PORT( 
        rst, trg	: IN        std_logic := '0';
        ip			: IN        std_logic_vector (7 DOWNTO 0);
        op1			: INOUT     std_logic_vector (7 DOWNTO 0) := (0=>'1',others=>'0');
        op2			: OUT       std_logic_vector (7 DOWNTO 0) := (others=>'0')
    );

END shift ;

ARCHITECTURE shift_register OF shift IS
BEGIN
shiftrg: PROCESS(trg)
    BEGIN
        IF FALLING_EDGE(trg) THEN
            op2<=op1;
            op1<=ip(7 downto 0);
            IF rst='1' THEN
                op1<=(0=>'1',others=>'0');
                op2<=(others=>'0');
            END IF;
        END IF;
    END PROCESS shiftrg;
END shift_register;
