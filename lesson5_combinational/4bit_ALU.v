module ALU (
    input [3:0] a,
    input [3:0] b,
    input [1:0] op,
    output reg [3:0] result
);

    wire [3:0] sum;
    wire [3:0] logic_and;
    wire [3:0] logic_or;

    // Addition using adder_4bit module
    adder_4bit add_unit (
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(sum),
        .cout()
    );

    // Logic operations
    assign logic_and = a & b;
    assign logic_or = a | b;

    // ALU operation selection
    always @(*) begin
        case (op)
            2'b00: result = sum;       // Addition
            2'b01: result = a - b;    // Subtraction
            2'b10: result = logic_and; // AND
            2'b11: result = logic_or;  // OR
            default: result = 4'b0000;
        endcase
    end

endmodule
