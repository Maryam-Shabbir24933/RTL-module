`timescale 1ns/1ps

module tb_mult3;

  reg en;
  reg [5:0] mult_in;
  wire [7:0] mult_out;

  mult3 uut (
    .mult_in(mult_in),
    .en(en),
    .mult_out(mult_out)
  );

  initial begin

    $dumpfile("mult3.vcd");
    $dumpvars(0, tb_mult3);

    // Test 1
    en = 1;
    mult_in = 6'd2;
    #10;
    $display("en=%b mult_in=%d mult_out=%d", en, mult_in, mult_out);

    // Test 2
    mult_in = 6'd3;
    #10;
    $display("en=%b mult_in=%d mult_out=%d", en, mult_in, mult_out);

    // Test 3
    mult_in = 6'd5;
    #10;
    $display("en=%b mult_in=%d mult_out=%d", en, mult_in, mult_out);

    // Test 4
    mult_in = 6'd10;
    #10;
    $display("en=%b mult_in=%d mult_out=%d", en, mult_in, mult_out);

    // Test enable = 0
    en = 0;
    mult_in = 6'd7;
    #10;
    $display("en=%b mult_in=%d mult_out=%d", en, mult_in, mult_out);

    $finish;
  end

endmodule