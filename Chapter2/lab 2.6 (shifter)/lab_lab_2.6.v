module shifter ( clk, SHL, SHR, load, sel, data_out);
  input wire clk;
  input wire SHL;
  input wire SHR;
  input wire [7:0]load;
  output reg [7:0] data_out;
  input wire sel;//additionally added 
  always @(posedge clk) begin
   
    case (sel)
    //left shift 
      0:  data_out = {load[6:0],SHL};
          
          1: data_out = {SHR, load[7:1]};
      
    endcase
  end
    endmodule