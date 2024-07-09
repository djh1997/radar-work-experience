## VHDL File Structure

*[GPIO]: Genral purpose input output
  
The individual [files](https://github.com/djh1997/radar-work-experience/tree/main/fib ) contain the building block for all the sub components.
  
![fulladder](logic/busadder.svg )
  
![halfadder](fib/design_hdl/halfadder.vhd)

The *architecture* code links individual *components* together into larger blocks of logic, using *internal signals* where necessary.

![buss adder](fib/design_hdl/adderbus.vhd)

Then there is the GPIO test bench to run a simulation of the code.

![GPIO test bench](fib/testbench_hdl/gpiotest.vhd)
