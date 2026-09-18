module sum_calculator( CLK, RESET, LOAD, ADD, DIN, CLK_CNT, SUM);
  input wire CLK;
  input wire RESET;
  input wire LOAD;
  input wire [7:0]ADD;
  output reg [7:0]CLKCNT;
  output reg [7:0]SUM;
  
  always @(posedge CLK) begin
    if(RESET) begin
      CLKCNT <=0;
      SUM <=0;
    end
    else begin
      SUM<= CLKCNT + DIN;
      CLKCNT +=1;
    end
    
      
    endmodule 