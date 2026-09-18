`timescale 1ns/1ps

module tb_divider;

    // Inputs
    reg [15:0] din;

    // Outputs
    wire [14:0] result;
    wire [1:0]  remainder;

    // Instantiate DUT
    divider dut (
        .din       (din),
        .result    (result),
        .remainder (remainder)
    );

    // Waveform dump
    initial begin
        $dumpfile("tb_divider.vcd");
        $dumpvars(0, tb_divider);
    end

    // Test cases
    initial begin

        // 9 / 3 = 3 remainder 0
        din = 16'd9;
        #10;

        // 10 / 3 = 3 remainder 1
        din = 16'd10;
        #10;

        // 11 / 3 = 3 remainder 2
        din = 16'd11;
        #10;

        // 15 / 3 = 5 remainder 0
        din = 16'd15;
        #10;

        // 20 / 3 = 6 remainder 2
        din = 16'd20;
        #10;

        // 100 / 3 = 33 remainder 1
        din = 16'd100;
        #10;

        // 0 / 3 = 0 remainder 0
        din = 16'd0;
        #10;

        $finish;
    end
endmodule