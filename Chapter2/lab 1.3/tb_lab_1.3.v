module tb_mux2x1;
   reg in1;
   reg in2;
   reg sel;
   reg out;
  
  
  mux2x1 dut( in1, in2, sel,  out);
  
      initial begin
        $dumpfile("tb_mux2x1.vcd");
        $dumpvars(0, tb_mux2x1);
    end


  initial begin
    in1=0;
    in2=0;
    sel =0;
    #10;
    in1=0;
    in2=1;
    sel =1;
     #10;
    in1=1;
    in2=0;
    sel =1;
    #10;
    in1=1;
    in2=0;
    sel =0;
    #10;
    $finish;
  end
endmodule
    