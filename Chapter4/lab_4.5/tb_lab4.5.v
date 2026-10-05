
`timescale 1ns/1ps

module tb_edge_detect;

reg insig;
reg clk;
reg reset;

wire p_edge;
wire n_edge;
wire [7:0] count;

edge_detect uut (
    .insig(insig),
    .p_edge(p_edge),
    .n_edge(n_edge),
    .clk(clk),
    .reset(reset),
    .count(count)
);

// Clock
always #5 clk = ~clk;

initial begin

    // Waveform commands
    $dumpfile("edge_detect.vcd");
    $dumpvars(0, tb_edge_detect);

    // Initial values
    clk   = 1'b0;
    reset = 1'b0;
    insig = 1'b0;

    // Reset
    #12;
    reset = 1'b1;

    // 0 -> 1 : Positive edge
    #10;
    insig = 1'b1;

    // No edge
    #10;

    // 1 -> 0 : Negative edge
    insig = 1'b0;

    // 0 -> 1 : Positive edge
    #10;
    insig = 1'b1;

    // 1 -> 0 : Negative edge
    #10;
    insig = 1'b0;

    // 0 -> 1 : Positive edge
    #10;
    insig = 1'b1;

    // 1 -> 0 : Negative edge
    #10;
    insig = 1'b0;

    #20;

    $finish;
end

// Display
always @(posedge clk) begin
    #1;
    $display("Time=%0t | insig=%b | p_edge=%b | n_edge=%b | count=%d",
             $time, insig, p_edge, n_edge, count);
end

endmodule