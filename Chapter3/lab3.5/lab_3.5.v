
module parity_gen(CLK, DIN, DOUT);
  input wire CLK;
  input wire [31:0] DIN;
  output reg [35:0] DOUT;

  reg [2:0] parity;

  always @(posedge CLK) begin
    parity = ^DIN;
    DOUT = {parity, DIN};
  end

endmodule