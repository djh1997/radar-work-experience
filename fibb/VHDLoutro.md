## VHDL file structure

The individual [files](https://github.com/djh1997/radar-work-experience/tree/main/fibb) contain the building block for all the sub components.

![halfadder](/logic/halfadder.svg)
![fulladder](/logic/adder.svg)
  
![halfaddervhdl](/fibb/halfadder.vhdl)
  
The *architecture* code link's individual *components* together into larger blocks of logic. using *internal signals* where necessary.
  
![bussaddervhdl](/fibb/adderbus.vhdl)
  
Then there is the GPIO test bench to run a simulation of the code.
  
![gpiotestvhdl](/fibb/gpiotest.vhdl)
