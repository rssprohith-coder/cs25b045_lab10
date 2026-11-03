`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:46:32 PM
// Design Name: 
// Module Name: tb_bitwise_or
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

module bitwise_or_tb;
    reg [5:0] A, B;
    wire [5:0] result;
    wire valid;

    bitwise_or uut (
        .A(A), .B(B),
        .result(result), .valid(valid)
    );

    initial begin
        A = 6'b001101; B = 6'b010111;
        #10;
        $display("OR: A=%b B=%b result=%b", A, B, result);

        A = 6'b111111; B = 6'b000000;
        #10;
        $display("OR: A=%b B=%b result=%b", A, B, result);

        A = 6'b100000; B = 6'b000001;
        #10;
        $display("OR: A=%b B=%b result=%b", A, B, result);

        $finish;
    end
endmodule