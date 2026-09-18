module divider (din, result, remainder);
  input wire [15:0]din;
  output reg [14:0] result;
  output reg [1:0] remainder;
  reg [15:0] number;

  always_comb begin 
  number=din;
    result = 0;
    remainder =0;
 
    while(number>=3)
    begin
      //sucessive subtractions 
     
      number = number -3;
      result = result +1;
      
    end 
    remainder =  number;
  end 
endmodule