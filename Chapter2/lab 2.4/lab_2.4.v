module bit_counter(clk,  d_in, c, dout);
  input wire clk;
  input wire[7:0] d_in;
  input wire[1:0] c;
  output reg[7:0] dout;
  always @( posedge clk) begin
    case(c) 
     
      2'b00 : dout<= d_in;
      2'b01: dout<=dout + 1;
      2'b10: dout <= dout -1;
      2'b11: dout<=0;
    
    endcase
  end
    endmodule