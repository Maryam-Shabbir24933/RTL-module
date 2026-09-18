`timescale 1ns/1ps

module tb_shifter;

    reg       clk;
    reg       sel;
    reg       SHL;
    reg       SHR;
    reg [7:0] load;

    wire [7:0] data_out;

    // Instantiate DUT
    shifter dut (
        .clk      (clk),
        .sel      (sel),
        .SHL      (SHL),
        .SHR      (SHR),
        .load     (load),
        .data_out (data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Waveform
    initial begin
        $dumpfile("tb_shifter.vcd");
        $dumpvars(0, tb_shifter);
    end

    initial begin

        // Initial values
        sel  = 0;
        SHL  = 0;
        SHR  = 0;
        load = 8'b0000_0000;

        // LEFT SHIFT
        // load = 10110010
        // result = 01100100 with SHL = 0
        #10;
        load = 8'b1011_0010;
        SHL  = 0;
        sel  = 0;

        #10;

        // LEFT SHIFT with serial 1
        // result = 01100101
        load = 8'b1011_0010;
        SHL  = 1;
        sel  = 0;

        #10;

        // RIGHT SHIFT
        // load = 10110010
        // result = 01011001 with SHR = 0
        load = 8'b1011_0010;
        SHR  = 0;
        sel  = 1;

        #10;

        // RIGHT SHIFT with serial 1
        // result = 11011001
        load = 8'b1011_0010;
        SHR  = 1;
        sel  = 1;

        #10;

        $finish;
    end

    // Display
    initial begin
        $monitor(
            "Time=%0t | sel=%b | load=%b | SHL=%b | SHR=%b | data_out=%b",
            $time, sel, load, SHL, SHR, data_out
        );
    end

endmodule