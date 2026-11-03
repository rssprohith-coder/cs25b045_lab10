`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:47:34 PM
// Design Name: 
// Module Name: tb_bitwise_not
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

module bitwise_not_tb;
    reg [5:0] A;
    wire [5:0] result;
    wire valid;

    bitwise_not uut (
        .A(A), .result(result), .valid(valid)
    );

    initial begin
        A = 6'b000000;
        #10;
        $display("NOT: A=%b result=%b", A, result);

        A = 6'b111111;
        #10;
        $display("NOT: A=%b result=%b", A, result);

        A = 6'b100000;
        #10;
        $display("NOT: A=%b result=%b", A, result);

        $finish;
    end
endmodule