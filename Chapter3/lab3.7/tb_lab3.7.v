
`timescale 1ns/1ps

module tb_ALU;

  reg clock;
  reg reset;
  reg [3:0] opcode;
  reg [31:0] A;
  reg [31:0] B;
  wire [31:0] Dout;

  ALU uut (
    .clock(clock),
    .reset(reset),
    .opcode(opcode),
    .A(A),
    .B(B),
    .Dout(Dout)
  );

  // Clock
  always #5 clock = ~clock;

  initial begin

    $dumpfile("ALU.vcd");
    $dumpvars(0, tb_ALU);

    clock = 0;
    reset = 0;
    opcode = 0;
    A = 0;
    B = 0;

    // Reset
    #10;
    reset = 1;

    // ADD: 5 + 3 = 8
    opcode = 4'd0;
    A = 5;
    B = 3;
    #10;
    $display("ADD       : A=%d B=%d Dout=%d", A, B, Dout);

    // SUB: 8 - 3 = 5
    opcode = 4'd1;
    A = 8;
    B = 3;
    #10;
    $display("SUB       : A=%d B=%d Dout=%d", A, B, Dout);

    // AND: 6 & 3 = 2
    opcode = 4'd2;
    A = 6;
    B = 3;
    #10;
    $display("AND       : A=%d B=%d Dout=%d", A, B, Dout);

    // OR: 6 | 3 = 7
    opcode = 4'd3;
    A = 6;
    B = 3;
    #10;
    $display("OR        : A=%d B=%d Dout=%d", A, B, Dout);

    // XOR: 6 ^ 3 = 5
    opcode = 4'd4;
    A = 6;
    B = 3;
    #10;
    $display("XOR       : A=%d B=%d Dout=%d", A, B, Dout);

    // RIGHT SHIFT: 8 >> 1 = 4
    opcode = 4'd5;
    A = 8;
    B = 1;
    #10;
    $display("RIGHT SHIFT: A=%d B=%d Dout=%d", A, B, Dout);

    // LEFT SHIFT: 2 << 2 = 8
    opcode = 4'd6;
    A = 2;
    B = 2;
    #10;
    $display("LEFT SHIFT : A=%d B=%d Dout=%d", A, B, Dout);

    // PASS A
    opcode = 4'd7;
    A = 7;
    B = 0;
    #10;
    $display("PASS A     : A=%d Dout=%d", A, Dout);

    // Barrel shifter A by 1
    opcode = 4'd8;
    A = 5;
    B = 0;
    #10;
    $display("BARREL A 1 : A=%d Dout=%d", A, Dout);

    // Barrel shifter A by 2
    opcode = 4'd9;
    A = 5;
    #10;
    $display("BARREL A 2 : A=%d Dout=%d", A, Dout);

    // Barrel shifter A by 3
    opcode = 4'd10;
    A = 5;
    #10;
    $display("BARREL A 3 : A=%d Dout=%d", A, Dout);

    // PASS B
    opcode = 4'd11;
    A = 0;
    B = 6;
    #10;
    $display("PASS B     : B=%d Dout=%d", B, Dout);

    // Barrel shifter B by 1
    opcode = 4'd12;
    B = 5;
    #10;
    $display("BARREL B 1 : B=%d Dout=%d", B, Dout);

    // Barrel shifter B by 2
    opcode = 4'd13;
    B = 5;
    #10;
    $display("BARREL B 2 : B=%d Dout=%d", B, Dout);

    // Barrel shifter B by 3
    opcode = 4'd14;
    B = 5;
    #10;
    $display("BARREL B 3 : B=%d Dout=%d", B, Dout);

    $finish;

  end

endmodule
   