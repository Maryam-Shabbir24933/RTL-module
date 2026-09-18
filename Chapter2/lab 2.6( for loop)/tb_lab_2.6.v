
module tb_sequence_detector;

    reg  [31:0] din;
    wire [3:0]  count;

    // Instantiate DUT
    sequence_detector dut (
        .din   (din),
        .count (count)
    );

    // Waveform dump
    initial begin
        $dumpfile("tb_sequence_detector.vcd");
        $dumpvars(0, tb_sequence_detector);
    end

    initial begin

        // Test 1
        // No 010 pattern
        din = 32'b11111111111111111111111111111111;
        #10;

        // Test 2
        // One occurrence of 010
        din = 32'b01011111111111111111111111111111;
        #10;

        // Test 3
        // Multiple occurrences
        din = 32'b01001001001011111111111111111111;
        #10;

        // Test 4
        // Alternating pattern
        din = 32'b01010101010101010101010101010101;
        #10;

        // Test 5
        din = 32'b00000000000000000000000000000000;
        #10;

        // Test 6
        din = 32'b01001000010010000010010000000000;
        #10;

        $finish;
    end

    // Display result
    initial begin
        $monitor(
            "Time=%0t | DIN=%b | COUNT=%0d",
            $time, din, count
        );
    end

endmodule
