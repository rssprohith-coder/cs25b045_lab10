`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:44:13 PM
// Design Name: 
// Module Name: multiplier
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
module mul_fa (
    input A, B, Cin,
    output Sum, Cout
);
    wire p, g, h;

    xor (p, A, B);
    xor (Sum, p, Cin);

    and (g, A, B);
    and (h, p, Cin);
    or  (Cout, g, h);
endmodule


module mul_add6 (
    input  [5:0] A, B,
    output [5:0] S
);
    wire [6:0] C;

    assign C[0] = 1'b0;

    genvar k;
    generate
        for (k = 0; k < 6; k = k + 1) begin : ADD
            mul_fa FA (
                .A(A[k]),
                .B(B[k]),
                .Cin(C[k]),
                .Sum(S[k]),
                .Cout(C[k+1])
            );
        end
    endgenerate
endmodule


module multiplier (
    input  [5:0] A, B,
    output [5:0] result,
    output valid
);
    wire [5:0] pp [0:5];
    wire [5:0] rows [0:5];
    wire [5:0] sums [0:6];

    assign sums[0] = 6'b000000;

    genvar i, j;
    generate
        for (i = 0; i < 6; i = i + 1) begin : ROW
            for (j = 0; j < 6; j = j + 1) begin : PARTIAL
                and (pp[i][j], A[j], B[i]);
            end

            assign rows[i] = pp[i] << i;

            mul_add6 ADD_ROW (
                .A(sums[i]),
                .B(rows[i]),
                .S(sums[i+1])
            );
        end
    endgenerate

    assign result = sums[6];
    assign valid = 1'b1;

endmodule