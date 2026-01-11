`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 13:49:59
// Design Name: 
// Module Name: sequence_detector_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sequence_detector_tb;

    reg clk;
    reg rst;
    reg in;
    wire mealy_detected;
    wire moore_detected;

    // Instantiate Mealy FSM
    sequence_detector_mealy MEALY (
        .clk(clk),
        .rst(rst),
        .in(in),
        .detected(mealy_detected)
    );

    // Instantiate Moore FSM
    sequence_detector_moore MOORE (
        .clk(clk),
        .rst(rst),
        .in(in),
        .detected(moore_detected)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        in  = 0;

        #10 rst = 0;

        // Input stream: 1 0 1 1 (detect)
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;

        // Overlapping detection
        in = 0; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;

        $stop;
    end

endmodule
