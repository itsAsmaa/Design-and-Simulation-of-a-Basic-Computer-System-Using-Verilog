# ENCS2380 – Computer Organization and Microprocessors - Spring 2023 Course Project (I)

## Project Overview
This project involves the design, implementation, and simulation of a basic computer system using Verilog. The primary components include:

1. **Main Memory**: Designed and implemented as a Verilog module.
2. **CPU**: Designed and implemented as a Verilog module.
3. **Simulation**: The project includes initializing memory with instructions, simulating the execution of these instructions, and verifying the results.

## File Structure

- `firstcode1210084.v`: Verilog code for the CPU design.
- `secondcode1210084.v`: Verilog code for the main memory design.
- `memorycode1210084.v`: Verilog code related to memory initialization and address assignments.
- `ELECTRICALproj1.docx`: Report containing the simulation details, instructions, and Verilog files.

## Project Description

### 1. **Main Memory Design**  
The main memory is designed and implemented using Verilog. It is initialized with four instructions at memory addresses 0-3 and data at memory addresses 10-12.

**Instructions:**
- `0x180A` → `LOAD [10]`
- `0x580B` → `MUL [11]`
- `0x3005` → `ADD 5`
- `0x280C` → `STORE [12]`

**Data:**
- `0x0009` → 9
- `0xFFFC` → -4
- `0x0000` → 0

### 2. **CPU Design**  
The CPU is implemented in Verilog to process the instructions and perform the arithmetic and logical operations based on the opcode values. The simulation initializes the Program Counter (PC) at address 0, executes the instructions, and verifies the result stored at memory address 12.

### 3. **Assembly Program**  
An assembly program is written to implement the expression `Y = A + B * C - 5 / D + E + 1`. The assembly instructions for the program are as follows:
LOAD [23] ADD [24] ADD 1 STORE [25] LOAD [21] MUL [22] SUB 5 ADD [20] DIV [25] STORE [25]

The assembly code is then converted into machine code and stored starting at address 0 in memory.

### 4. **Simulation**  
The simulation is carried out by initializing the program counter (PC) to 0 and running the program. The values of A, B, C, D, and E are set as 2, 3, 5, 8, and -5, respectively. The program computes the result for Y, which should equal 3.

### 5. **Waveform**  
The simulation waveform is attached to verify the execution of the program. The waveform shows the correct execution of the instructions and verifies that the final result is stored correctly at memory address 25.

## How to Run

1. Ensure that Verilog tools such as ModelSim or any other simulation software are installed.
2. Load the Verilog files (`firstcode1210084.v`, `secondcode1210084.v`, `memorycode1210084.v`) into your simulation environment.
3. Compile the Verilog modules and run the simulation.
4. Verify the waveforms to ensure the correct execution of the instructions and final result.

## Verilog Code

The Verilog code files provided are the designs for the memory and CPU. Please refer to the individual files for specific implementation details.

## Results

- The simulation successfully executes the instructions.
- The result stored in memory address 12 is correct.
- The final computation for `Y = A + B * C - 5 / D + E + 1` results in Y = 3.



