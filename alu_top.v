`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:46:21 PM
// Design Name: 
// Module Name: mini_alu
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

module alu_top (
    input  [5:0] A, B,
    input  [2:0] sel,
    output reg [5:0] result,
    output reg valid,
    output [1:0] cmp
);

    wire [5:0] and_result;
    wire [5:0] or_result;
    wire [5:0] not_result;
    wire [5:0] add_result;
    wire [5:0] sub_result;
    wire [5:0] mul_result;

    wire and_valid, or_valid, not_valid;
    wire add_valid, sub_valid, mul_valid;

    bitwise_and U1 (
        .A(A), .B(B),
        .result(and_result), .valid(and_valid)
    );

    bitwise_or U2 (
        .A(A), .B(B),
        .result(or_result), .valid(or_valid)
    );

    bitwise_not U3 (
        .A(A),
        .result(not_result), .valid(not_valid)
    );

    adder U4 (
        .A(A), .B(B),
        .result(add_result), .valid(add_valid)
    );

    subtractor U5 (
        .A(A), .B(B),
        .result(sub_result), .valid(sub_valid)
    );

    multiplier U6 (
        .A(A), .B(B),
        .result(mul_result), .valid(mul_valid)
    );

    comparator U7 (
        .A(A), .B(B), .cmp(cmp)
    );

    always @(*) begin
        result = 6'b000000;
        valid  = 1'b1;

        case (sel)
            3'b000: result = and_result;
            3'b001: result = or_result;
            3'b010: result = not_result;
            3'b011: result = add_result;
            3'b100: result = sub_result;
            3'b101: result = mul_result;
            3'b110: result = 6'b000000;

            default: begin
                result = 6'b000000;
                valid  = 1'b0;
            end
        endcase
    end

endmodule