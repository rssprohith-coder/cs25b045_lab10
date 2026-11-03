`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:47:51 PM
// Design Name: 
// Module Name: tb_mini_alu
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

module alu_top_tb;

    reg [5:0] A, B;
    reg [2:0] sel;

    wire [5:0] result;
    wire valid;
    wire [1:0] cmp;

    alu_top uut (
        .A(A),
        .B(B),
        .sel(sel),
        .result(result),
        .valid(valid),
        .cmp(cmp)
    );

    initial begin
        // AND
        A = 6'sd5; B = 6'sd3; sel = 3'b000;
        #10;
        $display("AND result = %0d", $signed(result));

        // OR
        A = 6'sd5; B = 6'sd3; sel = 3'b001;
        #10;
        $display("OR result = %0d", $signed(result));

        // NOT A
        A = 6'sd5; B = 6'sd0; sel = 3'b010;
        #10;
        $display("NOT result = %0d", $signed(result));

        // Signed addition: -5 + 3 = -2
        A = -6'sd5; B = 6'sd3; sel = 3'b011;
        #10;
        $display("-5 + 3 = %0d", $signed(result));

        // Signed subtraction: -5 - 3 = -8
        A = -6'sd5; B = 6'sd3; sel = 3'b100;
        #10;
        $display("-5 - 3 = %0d", $signed(result));

        // Signed multiplication: -5 * 3 = -15
        A = -6'sd5; B = 6'sd3; sel = 3'b101;
        #10;
        $display("-5 * 3 = %0d", $signed(result));

        // Signed comparison: -5 < 3
        A = -6'sd5; B = 6'sd3; sel = 3'b110;
        #10;
        $display("Comparison: cmp=%b (01 means A < B)", cmp);

        // Invalid operation
        A = 6'sd5; B = 6'sd3; sel = 3'b111;
        #10;
        $display("Invalid operation: valid=%b", valid);

        $finish;
    end

endmodule