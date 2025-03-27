module CPU(
  input clock,
  output reg [10:0] PC,
  output reg [15:0] IR,
  output reg [15:0] MBR,
  output reg [15:0] AC,
  output reg [10:0] MAR,
  output reg ZF, CF, OF, NF,
  output reg rd, wr, // New output signals
  input [15:0] memory_data_in
);

  reg [2:0] state;
  reg [15:0] Memory [0:63];
  parameter load=4'b0001, store=4'b0010, add=4'b0011, sub=4'b0100, mul=4'b0101, div=4'b0110, branch=4'b0111, brz=4'b1000;

  initial begin
    // program
    Memory[0] = 16'h180A;
    Memory[1] = 16'h580B;
    Memory[2] = 16'h3005;
    Memory[3] = 16'h280C;
    // data at byte address
    Memory[10] = 16'h0009;
    Memory[11] = 16'hFFFC;
    Memory[12] = 16'h0000;
    // set the program counter to the start of the program
    PC = 0;
    state = 0;
  end

  always @(posedge clock) begin
    case (state)

      0: begin
        MAR <= PC;
        state = 1;
      end

      1: begin // fetch the instruction from the memory
        IR <= Memory[MAR];
        PC <= PC + 1;
        state = 2; // next state
      end

      2: begin // Instruction decode
        if (IR[11]) begin
          MAR <= Memory[MAR];
          MBR <= Memory[MAR];
          rd <= 1; // Set rd signal for memory read
          wr <= 0; // Clear wr signal for memory write
        end else begin
          MBR <= memory_data_in;
          rd <= 0; // Clear rd signal for memory read
          wr <= 1; // Set wr signal for memory write
        end
        state = 3;
      end

      3: begin // Operand fetch
        state = 4;
        case (IR[15:12])
load:MBR<=Memory[MAR];
store:MBR<=AC;
add:MBR<=Memory[MAR];
sub:MBR<=Memory[MAR];
mul:MBR<=Memory[MAR];
div:MBR<=Memory[MAR];
branch:PC <= MAR;
brz:PC <= MAR;
        endcase
      end

      4: begin // execute
        if (IR[15:12] == load) begin // load
          if (IR[11]) begin
            AC <= MBR;
          end else begin
            AC <= memory_data_in;
          end
          state = 0; // next state
        end
        else if (IR[15:12] == store) begin // store
          if (IR[11]) begin
            Memory[MAR] <= MAR;
            MBR <= AC;
            state = 0;
          end else begin
            Memory[MAR] <= MAR;
            MBR <= AC;
            state = 0;
          end
        end
        else if (IR[15:12] == add) begin // add
    if (MBR[15]) begin
      AC <= AC - (~MBR + 1); // Perform two's complement addition
    end else begin
      AC <= AC + MBR;
    end
    state = 0;
  end
        else if (IR[15:12] == sub) begin // sub
          AC <= AC - MBR;
          state = 0;
        end
        else if (IR[15:12] == mul) begin // mul
          AC <= AC * MBR;
          state = 0;
        end
        else if (IR[15:12] == div) begin // div
          AC <= AC / MBR;
          state = 0;
        end
        else if (IR[15:12] == branch) begin // branch
          PC <= MAR;
          state = 0;
        end
        else if (IR[15:12] == brz) begin // brz
          if (ZF == 1)
            PC <= MAR;
          state = 0;
        end
      end
    endcase

    ZF <= (AC == 0);
    CF <= (AC < 0);
    OF <= (AC > 32767 || AC < -32768);
    NF <= (AC < 0);

  end

endmodule
