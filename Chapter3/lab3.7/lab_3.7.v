          
//3.7 ALU
module ALU(clock, reset, opcode, A, B, Dout); 
  input wire clock; 
  input wire reset; 
  input wire [3:0] opcode; 
  input wire [31:0] A; 
  input wire [31:0] B; 
  output reg [31:0] Dout; 
   
  always @(posedge clock) begin 
    if (!reset) 
      Dout <= 32'b0; 
    else begin 
      case(opcode)  

        4'd0: Dout <= A + B; 
        4'd1: Dout <= A - B; 
        4'd2: Dout <= A & B; 
        4'd3: Dout <= A | B; 
        4'd4: Dout <= A ^ B; 
        4'd5: Dout <= A >> B; 
        4'd6: Dout <= A << B; 

        // BARREL SHIFTER FOR INPUT A
        4'd7: Dout <= A; 

        4'd8: begin 
          Dout[31] <= A[0]; 
          Dout[30:0] <= A[31:1]; 
        end 

        4'd9: begin 
          Dout[31:30] <= A[1:0]; 
          Dout[29:0] <= A[31:2]; 
        end 

        4'd10: begin 
          Dout[31:29] <= A[2:0]; 
          Dout[28:0] <= A[31:3]; 
        end 

        // BARREL SHIFTER FOR INPUT B
        4'd11: Dout <= B; 

        4'd12: begin 
          Dout[31] <= B[0]; 
          Dout[30:0] <= B[31:1]; 
        end 

        4'd13: begin 
          Dout[31:30] <= B[1:0]; 
          Dout[29:0] <= B[31:2]; 
        end 

        4'd14: begin 
          Dout[31:29] <= B[2:0]; 
          Dout[28:0] <= B[31:3]; 
        end 

        default: Dout <= 32'b0;

      endcase 
    end 
  end 
   
endmodule