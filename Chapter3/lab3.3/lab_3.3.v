module dec3to8 (d_in, en, d0, d1, d2, d3, d4, d5, d6, d7);
input wire[2:0] d_in;
input wire en;
output reg d0, d1, d2, d3, d4, d5, d6, d7;
  
  always @(*) begin
    d0=0;
    d1=0;
    d2=0;
    d3=0;
    d4=0;
    d5=0;
    d6=0;
    d7=0;
    
    if(d_in ==3'b000) d0=1;
    else if (d_in == 3'b001) d1=1;
    else if (d_in == 3'b010) d2=1;
    else if (d_in == 3'b011) d3=1;
    else if (d_in == 3'b100) d4=1;
    else if (d_in == 3'b101) d5=1;
    else if (d_in == 3'b110) d6=1;
    else d7=1;
  end
endmodule
