## VHDL File Structure
  
*[GPIO]: Genral purpose input output
  
The individual [files](https://github.com/djh1997/radar-work-experience/tree/main/fib ) contain the building block for all the sub components.
  
![fulladder](logic/busadder.svg )
  
```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
  
LIBRARY design_lib;
USE design_lib.all;
  
ENTITY halfadd IS
    PORT( 
        num1, num2	: IN    std_logic;
        sum, carry	: OUT   std_logic
    );
  
END halfadd ;
  
ARCHITECTURE halfadder OF halfadd IS
BEGIN
	sum <= num1 XOR num2;
	carry <= num1 AND num2;
END halfadder;
```  
  
The *architecture* code links individual *components* together into larger blocks of logic, using *internal signals* where necessary.
  
```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
  
LIBRARY design_lib;
USE design_lib.all;
  
ENTITY busadd IS
    PORT( 
        num1    : IN    std_logic_vector(7 DOWNTO 0);
        num2    : IN    std_logic_vector(7 DOWNTO 0);
        sum     : OUT   std_logic_vector(7 DOWNTO 0);
        carry   : OUT   std_logic
    );
  
END busadd ;
  
ARCHITECTURE busadder OF busadd IS
  
SIGNAL ha1carry_int : std_logic_vector(7 DOWNTO 0);
  
COMPONENT halfadder
    PORT (
        num1    : IN    std_logic;
        num2    : IN    std_logic;
        sum     : OUT   std_logic;
        carry   : OUT   std_logic
    );
END COMPONENT;
  
COMPONENT fulladder
    PORT (
        num1    : IN    std_logic;
        num2    : IN    std_logic;
        carryin : IN    std_logic;
        sum     : OUT   std_logic;
        carry   : OUT   std_logic
    );
END COMPONENT;
  
BEGIN
    I0 : halfadder
    PORT MAP (
        num1    => num1(0),
        num2    => num2(0),
        sum     => sum(0),
        carry   => ha1carry_int(0)
    );
  
    G1 : for i in 0 to 6 generate
        C1: fulladder
            port map (
                num1    => num1(i+1),
                num2    => num2(i+1),
                carryin => ha1carry_int(i),
                sum     => sum(i+1),
                carry   => ha1carry_int(i+1)
            );
    end generate;
    carry <= ha1carry_int(7);
END busadder;
```  
  
Then there is the GPIO test bench to run a simulation of the code.
  
```vhdl
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;
  
--! Local libraries
  
LIBRARY design_lib;
USE design_lib.all;
  
--! ENTITY/Package Description
ENTITY GPIO_Test is
END ENTITY GPIO_Test;
  
architecture tb of GPIO_Test is
  
	SIGNAL	done	:	STD_LOGIC;
	SIGNAL	clk		:	STD_LOGIC;
  
begin
  
 --! Port map declaration for
	UUT : ENTITY design_lib.fiber
		port map (
			done	=> done,
			clk		=> clk_system,
		);
  
    Clk: PROCESS is
    begin
  
        while now <= 500*clk_speed loop
  
            clk_system <= '0';
            wait for clk_speed/2;
            clk_system <= '1';
            wait for clk_speed/2;
  
        END loop;
  
        wait;
    END PROCESS;
  
END architecture tb;
```  
  