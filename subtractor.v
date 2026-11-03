`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:42:55 PM
// Design Name: 
// Module Name: subtractor
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
module subtractor (
    input  [5:0] A, B,
    output [5:0] result,
    output valid
);
    wire [5:0] B_inv;
    wire [6:0] carry;

    not (B_inv[0], B[0]);
    not (B_inv[1], B[1]);
    not (B_inv[2], B[2]);
    not (B_inv[3], B[3]);
    not (B_inv[4], B[4]);
    not (B_inv[5], B[5]);

    assign carry[0] = 1'b1;

    genvar i;
    generate
        for (i = 0; i < 6; i = i + 1) begin : SUB_STAGE
            wire p, g, h;

            xor (p, A[i], B_inv[i]);
            xor (result[i], p, carry[i]);

            and (g, A[i], B_inv[i]);
            and (h, p, carry[i]);
            or  (carry[i+1], g, h);
        end
    endgenerate

    assign valid = 1'b1;
endmodule