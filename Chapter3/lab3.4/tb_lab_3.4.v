 
`timescale 1ns/1ps

module tb_ones_count;

  reg CLK;
  reg RST;
  reg [7:0] VAL;

  wire [2:0] Num;
  wire [2:0] Pos;

  // DUT
  ones_count uut (
    .CLK(CLK),
    .RST(RST),
    .VAL(VAL),
    .Num(Num),
    .Pos(Pos)
  );

  // Clock generation
  always #5 CLK = ~CLK;

  initial begin

    // Waveform dump
    $dumpfile("ones_count.vcd");
    $dumpvars(0, tb_ones_count);

    // Initial values
    CLK = 0;
    RST = 0;
    VAL = 8'b00000000;

    // Reset
    #10;
    RST = 1;

    // Test 1: No 1s
    VAL = 8'b00000000;
    #10;
    $display("VAL=%b  Num=%d  Pos=%d", VAL, Num, Pos);

    // Test 2: One 1
    VAL = 8'b00000001;
    #10;
    $display("VAL=%b  Num=%d  Pos=%d", VAL, Num, Pos);

    // Test 3: One 1 at bit 7
    VAL = 8'b10000000;
    #10;
    $display("VAL=%b  Num=%d  Pos=%d", VAL, Num, Pos);

    // Test 4: Multiple 1s
    VAL = 8'b10101010;
    #10;
    $display("VAL=%b  Num=%d  Pos=%d", VAL, Num, Pos);

    // Test 5: Multiple 1s
    VAL = 8'b11110000;
    #10;
    $display("VAL=%b  Num=%d  Pos=%d", VAL, Num, Pos);

    // Test 6: All 1s
    VAL = 8'b11111111;
    #10;
    $display("VAL=%b  Num=%d  Pos=%d", VAL, Num, Pos);

    // Test 7: Single 1 at bit 3
    VAL = 8'b00001000;
    #10;
    $display("VAL=%b  Num=%d  Pos=%d", VAL, Num, Pos);

    // Test 8: Reset during operation
    VAL = 8'b11111111;
    #5;
    RST = 0;
    #2;
    $display("RESET: VAL=%b  Num=%d  Pos=%d", VAL, Num, Pos);

    RST = 1;
    #10;

    $finish;

  end

endmodule
    
    