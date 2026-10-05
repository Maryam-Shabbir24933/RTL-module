  
  `timescale 1ns/1ps

module tb_comparator;

  reg [7:0] a;
  reg [7:0] b;
  wire EQ, GT, LT;

  // DUT
  comparator uut (
    .a(a),
    .b(b),
    .EQ(EQ),
    .GT(GT),
    .LT(LT)
  );

  initial begin

    // Waveform dump
    $dumpfile("comparator.vcd");
    $dumpvars(0, tb_comparator);

    // Test 1: a < b
    a = 8'd10;
    b = 8'd20;
    #10;
    $display("a=%d b=%d EQ=%b GT=%b LT=%b",
             a, b, EQ, GT, LT);

    // Test 2: a > b
    a = 8'd30;
    b = 8'd20;
    #10;
    $display("a=%d b=%d EQ=%b GT=%b LT=%b",
             a, b, EQ, GT, LT);

    // Test 3: a == b
    a = 8'd25;
    b = 8'd25;
    #10;
    $display("a=%d b=%d EQ=%b GT=%b LT=%b",
             a, b, EQ, GT, LT);

    // Test 4: a = 0, b = 255
    a = 8'd0;
    b = 8'd255;
    #10;
    $display("a=%d b=%d EQ=%b GT=%b LT=%b",
             a, b, EQ, GT, LT);

    // Test 5: a = 255, b = 0
    a = 8'd255;
    b = 8'd0;
    #10;
    $display("a=%d b=%d EQ=%b GT=%b LT=%b",
             a, b, EQ, GT, LT);

    $finish;

  end

endmodule