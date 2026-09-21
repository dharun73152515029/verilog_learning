module fsm_traffic_light (
    input clk,
    input rst,
    output reg [1:0] light // 00=Red, 01=Yellow, 10=Green
);

    // State encoding using localparam for better readability
    localparam RED    = 2'b00;
    localparam YELLOW = 2'b01;
    localparam GREEN  = 2'b10;

    // Internal state registers
    reg [1:0] current_state, next_state;

    // 1. State Register (Sequential Logic)
    // Updates state ONLY on the rising edge of the clock
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= RED;
        end else begin
            current_state <= next_state;
        end
    end

    // 2. Next State Logic (Combinational Logic)
    // Determines what the next state should be based on current state
    always @(*) begin
        case (current_state)
            RED:    next_state = GREEN;
            GREEN:  next_state = YELLOW;
            YELLOW: next_state = RED;
            default: next_state = RED;
        endcase
    end

    // 3. Output Logic (Combinational Logic)
    // Maps the current state to the output light
    always @(*) begin
        case (current_state)
            RED:    light = 2'b00;
            YELLOW: light = 2'b01;
            GREEN:  light = 2'b10;
            default: light = 2'b00;
        endcase
    end

endmodule
