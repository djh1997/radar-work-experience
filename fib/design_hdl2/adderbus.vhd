LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY design_lib;
USE design_lib.ALL;
USE design_lib.fib_parameters.ALL;

ENTITY busadd IS
    PORT(bit1    : IN    std_logic_vector(BusWidth downto 0);
         bit2    : IN    std_logic_vector(BusWidth downto 0);
         sum     : OUT   std_logic_vector(BusWidth downto 0) := (others=>'0');
         carry   : OUT   std_logic);
END busadd ;

ARCHITECTURE busadder OF busadd IS

SIGNAL ha1carry_int : std_logic_vector(BusWidth downto 0) := (others=>'0');

COMPONENT halfadd
    PORT (bit1    : IN    std_logic;
          bit2    : IN    std_logic;
          sum     : OUT   std_logic;
          carry   : OUT   std_logic);
END COMPONENT;

COMPONENT fulladd
    PORT (bit1    : IN    std_logic;
         bit2    : IN    std_logic;
         carryin : IN    std_logic;
         sum     : OUT   std_logic;
         carry   : OUT   std_logic);
END COMPONENT;
   
BEGIN
    I0 : halfadd
    PORT MAP (bit1    => bit1(0),
              bit2    => bit2(0),
              sum     => sum(0),
              carry   => ha1carry_int(0));
	
              -- systematically  generate component instantiate
    G1 : for i in 0 to BusWidth-1 generate
        C1: fulladd
            port map (bit1    => bit1(i+1),
                     bit2    => bit2(i+1),
                     carryin => ha1carry_int(i),
                     sum     => sum(i+1),
                     carry   => ha1carry_int(i+1));
    end generate;
    carry <= ha1carry_int(BusWidth);
END busadder;