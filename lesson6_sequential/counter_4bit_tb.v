`timescale 1ns/1ps
module counter_4bit_tb;
    reg clk;
    reg rst;
    wire [3:0] count;

    // Instantiate the counter
    counter_4bit uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock generation: toggles every 5ns (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        // Don't forget the VCD dump for GTKWave!
        $dumpfile("counter_4bit.vcd");
        $dumpvars(0, counter_4bit_tb);

        // Apply reset
        rst = 1;
        #10;
        rst = 0; // Release reset

        // Let it count for a while
        #100;
        
        $finish;
    end
endmodule
