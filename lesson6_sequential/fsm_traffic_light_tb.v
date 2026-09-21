`timescale 1ns/1ps
module fsm_traffic_light_tb;
    reg clk;
    reg rst;
    wire [1:0] light;

    // Instantiate the FSM
    fsm_traffic_light uut (
        .clk(clk),
        .rst(rst),
        .light(light)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        $dumpfile("fsm_traffic_light.vcd");
        $dumpvars(0, fsm_traffic_light_tb);

        // Apply reset
        rst = 1;
        #10;
        rst = 0; // Release reset

        // Let it run for 100ns to see the lights change
        #100;
        
        $finish;
    end
endmodule
