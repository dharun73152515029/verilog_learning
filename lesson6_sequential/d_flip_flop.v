module d_flip_flop (
    input clk,
    input rst,  // Reset
    input d,
    output reg q
);
    // This block triggers ONLY on the rising edge of the clock
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0;  // If reset is high, clear q to 0
        end else begin
            q <= d;     // Otherwise, capture d on the clock edge
        end
    end
endmodule
