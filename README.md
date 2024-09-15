# Design-of-a-General-Purpose-Processor
This project focuses on the design and implementation of a Simple General-Purpose Processor using VHDL, developed over a two-week period as part of a Digital Systems Lab. The processor is deployed on an FPGA board and consists of several critical components working together to perform arithmetic and logical operations.

**Key Components:**
- Arithmetic and Logic Unit (ALU): The core of the processor, responsible for executing various arithmetic and logical operations.
- Register Storage Unit: An 8-bit storage unit for input data, simulated and designed to hold and manipulate input values.
- Control Unit: Includes a Finite State Machine (FSM) and a 4-to-16 Decoder that orchestrates the operations of the ALU by generating a 16-bit microcode.
- Integration: All components are integrated into a cohesive circuit that ensures seamless communication and functionality.

**Features:**
- ALU Operations: Performs arithmetic operations like addition, subtraction, and bitwise logical operations such as AND, OR, and XOR.
- Control Unit Functionality: Manages the flow of operations within the ALU using an FSM and Decoder, enabling precise execution based on microcode instructions.
- VHDL Implementation: The entire project is written in VHDL, with each module simulated and verified for correct functionality.
- FPGA Deployment: The design is implemented on an FPGA board to physically demonstrate the processor's operations.

This project provides a comprehensive approach to understanding processor design, from basic register storage and control mechanisms to the execution of complex operations within the ALU. The aim is to demonstrate the effectiveness of VHDL in creating a fully functional processor through practical, hands-on experimentation.
