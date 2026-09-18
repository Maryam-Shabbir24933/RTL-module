// Code your design here
// lab 1.1 - Describe the full adder circuit in verilog 
module sum_calculator( CLK, RESET, LOAD, ADD, DIN, CLKCNT, SUM);
  input wire CLK;
  input wire RESET;
  input wire LOAD;
  input wire ADD;
  input wire [7:0]DIN;
  output reg [7:0]CLKCNT;
  output reg [7:0]SUM;
  reg [7:0]load_data;
  always @(posedge CLK) begin
    if(RESET) begin
      CLKCNT <=0;
      SUM <=0;
    end
    else begin
      if(LOAD) begin
        load_data<= DIN;
      end 
      if(ADD)begin
      SUM<= CLKCNT + load_data;
      end 
      CLKCNT +=1;
    end
  end 
    
      
    endmodule 