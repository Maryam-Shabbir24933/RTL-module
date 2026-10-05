`timescale 1ns/1ps

module tb_counter;

  reg clk;
  reg rst;
  reg up;
  reg down;
  wire [7:0] count;

  counter uut (
    .rst(rst),
    .clk(clk),
    .up(up),
    .down(down),
    .count(count)
  );

  // Clock
  always #5 clk = ~clk;

  initial begin

    $dumpfile("counter.vcd");
    $dumpvars(0, tb_counter);

    clk = 0;
    rst = 0;
    up = 0;
    down = 0;

    // Reset
    #10;
    rst = 1;

    // UP: 0 -> 1
    up = 1;
    down = 0;
    #10;
    $display("UP   : up=%b down=%b count=%d", up, down, count);

    // UP: 1 -> 2
    #10;
    $display("UP   : up=%b down=%b count=%d", up, down, count);

    // UP: 2 -> 3
    #10;
    $display("UP   : up=%b down=%b count=%d", up, down, count);

    // DOWN: 3 -> 2
    up = 0;
    down = 1;
    #10;
    $display("DOWN : up=%b down=%b count=%d", up, down, count);

    // DOWN: 2 -> 1
    #10;
    $display("DOWN : up=%b down=%b count=%d", up, down, count);

    // HOLD
    up = 0;
    down = 0;
    #10;
    $display("HOLD : up=%b down=%b count=%d", up, down, count);

    // Reset again
    rst = 0;
    #10;
    $display("RESET: up=%b down=%b count=%d", up, down, count);

    $finish;

  end

endmodule