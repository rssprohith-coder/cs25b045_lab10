`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:45:30 PM
// Design Name: 
// Module Name: adder_tb
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


`timescale 1ns / 1ps

module adder_tb;
    reg [5:0] A, B;
    wire [5:0] result;
    wire valid;

    adder uut (
        .A(A), .B(B),
        .result(result), .valid(valid)
    );

    initial begin
        // 5 + 3 = 8
        A = 6'd5; B = 6'd3;
        #10;
        $display("5 + 3 = %0d", $signed(result));

        // -5 + 3 = -2
        A = -6'sd5; B = 6'd3;
        #10;
        $display("-5 + 3 = %0d", $signed(result));

        // -10 + -5 = -15
        A = -6'sd10; B = -6'sd5;
        #10;
        $display("-10 + -5 = %0d", $signed(result));

        // 31 + 1 overflows six-bit signed arithmetic.
        A = 6'sd31; B = 6'sd1;
        #10;
        $display("31 + 1 = %0d (wrapped)", $signed(result));

        $finish;
    end
endmodule
