`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:46:52 PM
// Design Name: 
// Module Name: tb_multiplier
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

module multiplier_tb;
    reg [5:0] A, B;
    wire [5:0] result;
    wire valid;

    multiplier uut (
        .A(A), .B(B),
        .result(result), .valid(valid)
    );

    initial begin
        // 5 * 4 = 20
        A = 6'sd5; B = 6'sd4;
        #10;
        $display("5 * 4 = %0d", $signed(result));

        // -5 * 4 = -20
        A = -6'sd5; B = 6'sd4;
        #10;
        $display("-5 * 4 = %0d", $signed(result));

        // -3 * -4 = 12
        A = -6'sd3; B = -6'sd4;
        #10;
        $display("-3 * -4 = %0d", $signed(result));

        // 10 * 10 = 100; six-bit result wraps to -28.
        A = 6'sd10; B = 6'sd10;
        #10;
        $display("10 * 10 (six-bit result) = %0d",
                 $signed(result));

        $finish;
    end
endmodule