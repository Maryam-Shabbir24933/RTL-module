module sequence_detector(din, count);
  input wire [31:0] din;
  output reg [3:0] count;

  reg [2:0] shift_reg ;
  reg [31:0] temp_din;
  integer i;
  always @(*) begin
    
    temp_din = din;
    shift_reg [2:0] = temp_din[31:29];
    count = 4'd0;
    
    for (i=0; i<29; i++) begin
    shift_reg ={shift_reg[1:0],temp_din[31]} ;
    temp_din= temp_din << 1;
    if(shift_reg[2:0] == 3'b010) begin
      count = count + 1;
    end 
  end
  end
  
    
  
    endmodule