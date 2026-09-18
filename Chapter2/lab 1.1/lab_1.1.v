module full_adder(A, B, C, sum, carry);
  input A;
  input B;
  input C;
  output sum;
  output carry;
  
  assign sum = A ^ B ^ C;
  assign carry = A & B | B & C | C & A;
  
  endmodule 