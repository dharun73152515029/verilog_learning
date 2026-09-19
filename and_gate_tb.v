`timescale 1ns/1ps

module and_gate_tb;
    reg a;
    reg b;
    wire y;

    // Instantiate the AND gate
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Create a waveform file for GTKWave
        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_gate_tb);

        // Test case 1: 0 AND 0
        a = 0; b = 0;
        #10; // Wait 10 nanoseconds

        // Test case 2: 0 AND 1
        a = 0; b = 1;
        #10;

        // Test case 3: 1 AND 0
        a = 1; b = 0;
        #10;

        // Test case 4: 1 AND 1
        a = 1; b = 1;
        #10;

        $finish; // End simulation
    end
endmodule
