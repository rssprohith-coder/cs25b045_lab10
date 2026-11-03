`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:43:34 PM
// Design Name: 
// Module Name: bitwise_and
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

module bitwise_and (
    input  [5:0] A, B,
    output [5:0] result,
    output valid
);
    and (result[0], A[0], B[0]);
    and (result[1], A[1], B[1]);
    and (result[2], A[2], B[2]);
    and (result[3], A[3], B[3]);
    and (result[4], A[4], B[4]);
    and (result[5], A[5], B[5]);

    assign valid = 1'b1;
endmodule