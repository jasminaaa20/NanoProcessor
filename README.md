# Nanoprocessor Design

Welcome to the repository for our Nanoprocessor Design, a project undertaken as part of the CS1050 Computer Organization and Digital Design module at the University of Moratuwa.

## Overview

This project revolves around the design and development of a 4-bit processor capable of executing a set of 4 specific instructions. The main goal was to understand the intricacies of processor design, from arithmetic units to instruction decoding.
<!--
![Nanoprocessor Diagram](link_to_diagram_image.png)  
*Figure: High-level diagram of the nanoprocessor.*
-->
## Features

- **4-bit Add/Subtract Unit**: Capable of adding and subtracting numbers represented using 2’s complement.
- **3-bit Adder**: Used to increment the Program Counter.
- **3-bit Program Counter (PC)**: Can be reset to 0 when required.
- **Multiplexers**: Including 2-way 3-bit, 2-way 4-bit, and 8-way 4-bit multiplexers.
- **Register Bank**: Contains 8, 4-bit registers (R0 to R7).
- **Program ROM**: Stores the Assembly program.
- **Instruction Decoder**: Activates necessary components based on the instructions.

## Instruction Set

| Instruction | Description | Format |
|-------------|-------------|--------|
| MOVI R, d | Move immediate value d to register R | 1 0 R R R 0 0 0 d d d d |
| ADD Ra, Rb | Add values in registers Ra and Rb | 0 0 Ra Ra Ra Rb Rb Rb 0 0 0 0 |
| NEG R | 2’s complement of registers R | 0 1 R R R 0 0 0 0 0 0 0 |
| JZR R, d | Jump if value in register R is 0 | 1 1 R R R 0 0 0 0 d d d |

## Testing

The design was tested using a series of simulations, followed by deployment on a BASYS 3 board. The output of R7 was connected to LEDs and a 7-segment display for result visualization.

## Acknowledgements

- Dr. Dilum Bandara for the project guidelines and continuous support.
- Mihir Kedia and Aseem Kishore for their resources on "Building a processor from scratch".
