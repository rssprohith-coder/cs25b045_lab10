`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:45:57 PM
// Design Name: 
// Module Name: tb_subtractor
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

module subtractor_tb;
    reg [5:0] A, B;
    wire [5:0] result;
    wire valid;

    subtractor uut (
        .A(A), .B(B),
        .result(result), .valid(valid)
    );

    initial begin
        // 10 - 3 = 7
        A = 6'd10; B = 6'd3;
        #10;
        $display("10 - 3 = %0d", $signed(result));

        // -5 - 3 = -8
        A = -6'sd5; B = 6'd3;
        #10;
        $display("-5 - 3 = %0d", $signed(result));

        // -10 - (-5) = -5
        A = -6'sd10; B = -6'sd5;
        #10;
        $display("-10 - (-5) = %0d", $signed(result));

        $finish;
    end
endmodule