module comparator(a,b,EQ,GT,LT);
  input wire [7:0]a;
  input wire[7:0]b;
  output reg EQ, GT, LT;
  
  always @(*)begin
    if (a<b)begin
    LT =1;
    GT =0;
    EQ=0;
  end
  else if(a>b) begin
    GT=1;
    LT=0;
    EQ=0;
  end
    else begin
      EQ=1;
      LT=0;
      GT=0;
  end 
  end
endmodule 