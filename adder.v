`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:41:23 PM
// Design Name: 
// Module Name: adder
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
module adder (
    input  [5:0] A, B,
    output [5:0] result,
    output valid
);
    wire [6:0] carry;

    assign carry[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 6; i = i + 1) begin : ADD_STAGE
            wire p, g;

            xor (p, A[i], B[i]);
            xor (result[i], p, carry[i]);

            and (g, A[i], B[i]);
            wire h;
            and (h, p, carry[i]);
            or  (carry[i+1], g, h);
        end
    endgenerate

    // Valid means this operation is implemented.
    // It does not indicate whether signed overflow occurred.
    assign valid = 1'b1;
endmodule
