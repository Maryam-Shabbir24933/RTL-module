module tb_sync_sc_ff;

  reg clk;
  reg set;
  reg clear;
  wire [3:0] out;

  sync_sc_ff uut (
    .out(out),
    .set(set),
    .clear(clear),
    .clk(clk)
  );

  // Clock
  always #5 clk = ~clk;

  initial begin

    $dumpfile("sync_sc_ff.vcd");
    $dumpvars(0, tb_sync_sc_ff);

    clk = 0;
    set = 0;
    clear = 0;

    // Initial state
    #10;
    $display("set=%b clear=%b out=%b", set, clear, out);

    // SET
    set = 1;
    clear = 0;
    #10;
    $display("SET   : set=%b clear=%b out=%b", set, clear, out);

    // Hold
    set = 0;
    clear = 0;
    #10;
    $display("HOLD  : set=%b clear=%b out=%b", set, clear, out);

    // CLEAR
    set = 0;
    clear = 1;
    #10;
    $display("CLEAR : set=%b clear=%b out=%b", set, clear, out);

    // Hold
    set = 0;
    clear = 0;
    #10;
    $display("HOLD  : set=%b clear=%b out=%b", set, clear, out);

    // Both set and clear = 1
    set = 1;
    clear = 1;
    #10;
    $display("BOTH  : set=%b clear=%b out=%b", set, clear, out);

    $finish;

  end

endmodule