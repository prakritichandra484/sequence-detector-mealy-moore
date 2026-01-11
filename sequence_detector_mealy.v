`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 13:41:57
// Design Name: 
// Module Name: sequence_detector_mealy
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


module sequence_detector_mealy (
    input clk,
    input rst,
    input in,
    output reg detected
);

    // State encoding
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    reg [1:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next-state logic + output (Mealy)
    always @(*) begin
        detected = 1'b0;           // default
        next_state = current_state;

        case (current_state)
            S0: begin
                if (in)
                    next_state = S1;
            end

            S1: begin
                if (in)
                    next_state = S1;
                else
                    next_state = S2;
            end

            S2: begin
                if (in)
                    next_state = S3;
                else
                    next_state = S0;
            end

            S3: begin
                if (in) begin
                    detected = 1'b1;   // 1011 detected
                    next_state = S1;   // overlap
                end else
                    next_state = S2;
            end
        endcase
    end

endmodule
