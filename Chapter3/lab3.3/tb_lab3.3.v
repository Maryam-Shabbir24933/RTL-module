`timescale 1ns/1ps

module tb_dec3to8;

  reg [2:0] d_in;
  reg en;

  wire d0, d1, d2, d3, d4, d5, d6, d7;

  // DUT
  dec3to8 uut (
    .d_in(d_in),
    .en(en),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .d4(d4),
    .d5(d5),
    .d6(d6),
    .d7(d7)
  );

  initial begin

    // Waveform dump
    $dumpfile("decoder3to8.vcd");
    $dumpvars(0, tb_dec3to8);

    // Enable decoder
    en = 1;

    // Test d0
    d_in = 3'b000;
    #10;
    $display("en=%b d_in=%b | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b",
             en,d_in,d0,d1,d2,d3,d4,d5,d6,d7);

    // Test d1
    d_in = 3'b001;
    #10;
    $display("en=%b d_in=%b | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b",
             en,d_in,d0,d1,d2,d3,d4,d5,d6,d7);

    // Test d2
    d_in = 3'b010;
    #10;
    $display("en=%b d_in=%b | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b",
             en,d_in,d0,d1,d2,d3,d4,d5,d6,d7);

    // Test d3
    d_in = 3'b011;
    #10;
    $display("en=%b d_in=%b | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b",
             en,d_in,d0,d1,d2,d3,d4,d5,d6,d7);

    // Test d4
    d_in = 3'b100;
    #10;
    $display("en=%b d_in=%b | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b",
             en,d_in,d0,d1,d2,d3,d4,d5,d6,d7);

    // Test d5
    d_in = 3'b101;
    #10;
    $display("en=%b d_in=%b | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b",
             en,d_in,d0,d1,d2,d3,d4,d5,d6,d7);

    // Test d6
    d_in = 3'b110;
    #10;
    $display("en=%b d_in=%b | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b",
             en,d_in,d0,d1,d2,d3,d4,d5,d6,d7);

    // Test d7
    d_in = 3'b111;
    #10;
    $display("en=%b d_in=%b | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b",
             en,d_in,d0,d1,d2,d3,d4,d5,d6,d7);

    // Disable decoder
    en = 0;
    d_in = 3'b010;
    #10;
    $display("en=%b d_in=%b | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b",
             en,d_in,d0,d1,d2,d3,d4,d5,d6,d7);

    $finish;

  end

endmodule
  

    
    
 
   
  
