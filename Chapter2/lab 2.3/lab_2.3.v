module comparator(a,b,g,l,e);
  input wire [7:0] a;
  input wire [7:0] b;
  output reg g;
  output reg l;
  output reg e;
  
  always_comb begin
    l=0;
    g=0;
    e=0;
    if(a<b) begin
      $display(" A is less than B");
      l=1;
  
      end
      else if (a>b) begin
        $display("A is greater than B");
        g=1;
  
      end
    else  begin
      $display("A equals B");
    e=1;

    end

  end 
endmodule