// Code your design here
// LAB 1.2

module clk_count_addr (
    RESET,
    CLK,
    ADD,
    CLKCNT,
    DIN,
    LOAD,
    SUM
);

    input wire RESET;
    input wire CLK;
    input wire ADD;
    input wire LOAD;
    input wire [7:0] DIN;

    output reg [7:0] SUM;
    output reg [7:0] CLKCNT;

    reg [7:0] data;

    always @(posedge CLK or negedge RESET) begin
        if (!RESET) begin
            SUM    <= 8'b0;
            CLKCNT <= 8'b0;
            data   <= 8'b0;
        end
        else begin
            CLKCNT <= CLKCNT + 8'd1;

            if (LOAD) begin
                data <= DIN;
            end
            else if (ADD) begin
                SUM <= data + CLKCNT;
            end
            else begin
                SUM <= 8'b0;
            end
        end
    end

endmodule
