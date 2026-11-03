`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:44:28 PM
// Design Name: 
// Module Name: comparator
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

module comparator (
    input  [5:0] A,
    input  [5:0] B,
    output [1:0] cmp
);

    wire [4:0] eq_lower;
    wire [5:0] lt_chain;
    wire [5:0] gt_chain;

    wire not_A_sign;
    wire not_B_sign;
    wire opposite_less;
    wire opposite_greater;
    wire same_sign;
    wire same_sign_less;
    wire same_sign_greater;
    wire less_signed;
    wire greater_signed;

    // Compare the lower five bits for equality.
    genvar i;
    generate
        for (i = 0; i < 5; i = i + 1) begin : EQ_STAGE
            xnor (eq_lower[i], A[i], B[i]);
        end
    endgenerate

    // Initialize the comparison chains.
    assign lt_chain[5] = 1'b0;
    assign gt_chain[5] = 1'b0;

    // Compare the lower five bits, starting at the MSB.
    genvar j;
    generate
        for (j = 4; j >= 0; j = j - 1) begin : MAG_COMPARE

            wire a_less_b;
            wire a_greater_b;
            wire l_extend;
            wire g_extend;
            wire not_A_bit;
            wire not_B_bit;

            not (not_A_bit, A[j]);
            not (not_B_bit, B[j]);

            and (a_less_b, not_A_bit, B[j]);
            and (a_greater_b, A[j], not_B_bit);

            and (l_extend, eq_lower[j], lt_chain[j+1]);
            and (g_extend, eq_lower[j], gt_chain[j+1]);

            or (lt_chain[j], a_less_b, l_extend);
            or (gt_chain[j], a_greater_b, g_extend);

        end
    endgenerate

    // Signed comparison based on sign bits.
    not (not_A_sign, A[5]);
    not (not_B_sign, B[5]);

    // A negative number is less than a non-negative number.
    and (opposite_less, A[5], not_B_sign);

    // A non-negative number is greater than a negative number.
    and (opposite_greater, not_A_sign, B[5]);

    // Determine whether both operands have the same sign.
    xnor (same_sign, A[5], B[5]);

    // If signs match, compare the lower five bits.
    and (same_sign_less, same_sign, lt_chain[0]);
    and (same_sign_greater, same_sign, gt_chain[0]);

    // Combine sign comparison and lower-bit comparison.
    or (less_signed, opposite_less, same_sign_less);
    or (greater_signed, opposite_greater, same_sign_greater);

    // Output encoding:
    // cmp = 2'b00 -> A == B
    // cmp = 2'b01 -> A < B
    // cmp = 2'b10 -> A > B

    assign cmp[0] = less_signed;
    assign cmp[1] = greater_signed;

endmodule