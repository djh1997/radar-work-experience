## VHDL file structure

*[GPIO]: Genral purpose input output
  
The individual [files](https://github.com/djh1997/radar-work-experience/tree/main/fibb ) contain the building block for all the sub components.
  
![halfadder](logic/halfadder.svg )
![fulladder](logic/adder.svg )
  
![halfadder](fibb/halfadder.vhdl)

The *architecture* code link's individual *components* together into larger blocks of logic. using *internal signals* where necessary.

![buss adder](fibb/adderbus.vhdl)

Then there is the GPIO test bench to run a simulation of the code.

![GPIO test bench](fibb/gpiotest.vhdl)
