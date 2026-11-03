`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:44:01 PM
// Design Name: 
// Module Name: bitwise_not
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
module bitwise_not (
    input  [5:0] A,
    output [5:0] result,
    output valid
);
    not (result[0], A[0]);
    not (result[1], A[1]);
    not (result[2], A[2]);
    not (result[3], A[3]);
    not (result[4], A[4]);
    not (result[5], A[5]);

    assign valid = 1'b1;
endmodule