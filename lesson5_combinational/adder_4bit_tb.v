`timescale 1ns/1ps
module adder_4bit_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    adder_4bit uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $dumpfile("adder_4bit.vcd");
        $dumpvars(0, adder_4bit_tb);

        cin = 0;
        a = 4'b0000; b = 4'b0000; #10; // 0 + 0 = 0
        a = 4'b0011; b = 4'b0101; #10; // 3 + 5 = 8 (1000)
        a = 4'b1111; b = 4'b0001; #10; // 15 + 1 = 16 (10000) -> sum=0000, cout=1
        a = 4'b1010; b = 4'b0101; #10; // 10 + 5 = 15 (1111)

        $finish;
    end
endmodule
