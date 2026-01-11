`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 13:47:52
// Design Name: 
// Module Name: sequence_detector_moore
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


module sequence_detector_moore (
    input clk,
    input rst,
    input in,
    output reg detected
);

    // State encoding
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100;   // Detection state

    reg [2:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        next_state = current_state;

        case (current_state)
            S0: if (in) next_state = S1;

            S1: if (in) next_state = S1;
                else    next_state = S2;

            S2: if (in) next_state = S3;
                else    next_state = S0;

            S3: if (in) next_state = S4;
                else    next_state = S2;

            S4: begin
                if (in) next_state = S1;   // overlap
                else    next_state = S2;
            end
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        if (current_state == S4)
            detected = 1'b1;
        else
            detected = 1'b0;
    end

endmodule

