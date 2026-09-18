module tb_mux8x1;

    // Inputs
    reg d0, d1, d2, d3, d4, d5, d6, d7;
    reg [2:0] sel;

    // Output
    wire out;

    // Instantiate DUT
    mux8x1 dut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .d4(d4),
        .d5(d5),
        .d6(d6),
        .d7(d7),
        .sel(sel),
        .out(out)
    );

    // Waveform
    initial begin
        $dumpfile("tb_mux8x1.vcd");
        $dumpvars(0, tb_mux8x1);
    end

    initial begin

        // Give each input a different value
        d0 = 1'b0;
        d1 = 1'b1;
        d2 = 1'b0;
        d3 = 1'b1;
        d4 = 1'b0;
        d5 = 1'b1;
        d6 = 1'b0;
        d7 = 1'b1;

        // Select d0
        sel = 3'b000;
        #10;

        // Select d1
        sel = 3'b001;
        #10;

        // Select d2
        sel = 3'b010;
        #10;

        // Select d3
        sel = 3'b011;
        #10;

        // Select d4
        sel = 3'b100;
        #10;

        // Select d5
        sel = 3'b101;
        #10;

        // Select d6
        sel = 3'b110;
        #10;

        // Select d7
        sel = 3'b111;
        #10;

        $finish;
    end

    // Display results
    initial begin
        $monitor(
            "Time=%0t | sel=%b | d0=%b d1=%b d2=%b d3=%b d4=%b d5=%b d6=%b d7=%b | out=%b",
            $time, sel,
            d0, d1, d2, d3, d4, d5, d6, d7,
            out
        );
    end

endmodule