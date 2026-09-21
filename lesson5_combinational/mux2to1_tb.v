`timescale 1ns/1ps
module mux2to1_tb;
    reg a, b, sel;
    wire y;

    mux2to1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("mux2to1.vcd");
        $dumpvars(0, mux2to1_tb);

        // Test all combinations
        a = 0; b = 0; sel = 0; #10; // y should be 0
        a = 0; b = 1; sel = 0; #10; // y should be 0
        a = 1; b = 0; sel = 0; #10; // y should be 1
        a = 1; b = 1; sel = 0; #10; // y should be 1
        
        // Now change sel to 1 (should select b)
        a = 0; b = 0; sel = 1; #10; // y should be 0
        a = 0; b = 1; sel = 1; #10; // y should be 1
        a = 1; b = 0; sel = 1; #10; // y should be 0
        a = 1; b = 1; sel = 1; #10; // y should be 1

        $finish;
    end
endmodule
