module mult3(mult_in, en, mult_out);
  input en;
  input wire [5:0] mult_in;
  output reg [7:0] mult_out;
  
  reg [7:0] temp;
      always @(*) begin
        if(en) begin
          temp =0;
          temp = temp +mult_in;
           temp = temp + mult_in;
           temp = temp + mult_in;
          mult_out = temp;
        end 
      end 
endmodule 