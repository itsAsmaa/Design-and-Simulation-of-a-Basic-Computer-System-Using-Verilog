
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

## Contact

For any questions or concerns, please contact:

- **Name**: Asmaa Abed Al-Rahman Fares
- **Student ID**: 1210084
