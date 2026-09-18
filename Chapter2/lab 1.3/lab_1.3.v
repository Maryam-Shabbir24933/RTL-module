module mux2x1( in1, in2, sel, out);
  input wire in1;
  input wire in2;
  input wire sel;
  output wire out;
  
  assign out = (sel) ? in2 :in1;
endmodule