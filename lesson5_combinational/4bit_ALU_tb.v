`timescale 1ns/1ps

module ALU_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg [1:0] op;
    wire [3:0] result;

    // Instantiate ALU
    ALU uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    initial begin
        // THESE TWO LINES CREATE THE .VCD FILE FOR GTKWAVE
        $dumpfile("4bit_ALU.vcd");
        $dumpvars(0, ALU_tb);

        $monitor("Time=%0t | a=%b | b=%b | op=%b | result=%b",
                 $time, a, b, op, result);

        // Addition
        a = 4'b0101;
        b = 4'b0011;
        op = 2'b00;
        #10;

        // Subtraction
        a = 4'b0101;
        b = 4'b0011;
        op = 2'b01;
        #10;

        // AND
        a = 4'b1100;
        b = 4'b1010;
        op = 2'b10;
        #10;

        // OR
        a = 4'b1100;
        b = 4'b1010;
        op = 2'b11; // <-- Added the missing op code
        #10;

        $finish; // <-- Added the missing finish
    end
endmodule
