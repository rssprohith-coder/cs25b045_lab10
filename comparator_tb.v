`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:47:07 PM
// Design Name: 
// Module Name: tb_comparator
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

module comparator_tb;

    reg [5:0] A;
    reg [5:0] B;
    wire [1:0] cmp;

    comparator uut (
        .A(A),
        .B(B),
        .cmp(cmp)
    );

    initial begin

        // Test 1: 10 > 5
        A = 6'sd10;
        B = 6'sd5;
        #10;
        $display("A=10, B=5, cmp=%b", cmp);

        // Test 2: -10 < 5
        A = -6'sd10;
        B = 6'sd5;
        #10;
        $display("A=-10, B=5, cmp=%b", cmp);

        // Test 3: -5 > -10
        A = -6'sd5;
        B = -6'sd10;
        #10;
        $display("A=-5, B=-10, cmp=%b", cmp);

        // Test 4: -10 == -10
        A = -6'sd10;
        B = -6'sd10;
        #10;
        $display("A=-10, B=-10, cmp=%b", cmp);

        // Test 5: 0 == 0
        A = 6'sd0;
        B = 6'sd0;
        #10;
        $display("A=0, B=0, cmp=%b", cmp);

        // Test 6: Maximum positive > minimum negative
        A = 6'sd31;
        B = -6'sd32;
        #10;
        $display("A=31, B=-32, cmp=%b", cmp);

        $finish;
    end

endmodule