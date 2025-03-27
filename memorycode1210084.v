module Memory(
  input [10:0] address,
  input [15:0] data_in,
  input rd,
  input wr,
  output reg [15:0] data_out
);

  reg [15:0] memory [0:63];

  always @(address) begin
    if (rd)
      data_out <= memory[address];
    else if (wr)
      memory[address] <= data_in;
  end

endmodule
