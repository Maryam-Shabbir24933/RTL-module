module edge_detect (insig,p_edge,n_edge,clk,reset,count);
input wire insig;
input wire clk;
input wire reset;
output reg p_edge;
output reg n_edge;
output reg [7:0] count;

reg insig_d;// to latch for 1 cycle 

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        count   <= 8'b0;
        insig_d <= 1'b0;
        p_edge  <= 1'b0;
        n_edge  <= 1'b0;
    end
    else begin
        p_edge  <= insig & ~insig_d;
        n_edge  <= ~insig & insig_d;
        insig_d <= insig;
           if ((insig & ~insig_d) || (~insig & insig_d))
            count <= count + 1'b1;
    end
end

endmodule
 