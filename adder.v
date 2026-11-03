`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:41:23 PM
// Design Name: 
// Module Name: adder
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
module adder(
    input [5:0] A, B,
    output [5:0] SUM,
    output valid
);

wire [6:0] C;
wire [5:0] X;
wire [5:0] P, Q, R;

assign C[0] = 1'b0;

genvar i;

generate
    for(i=0; i<6; i=i+1) begin

        xor G1(X[i], A[i], B[i]);
        xor G2(SUM[i], X[i], C[i]);

        and G3(P[i], A[i], B[i]);
        and G4(Q[i], A[i], C[i]);
        and G5(R[i], B[i], C[i]);

        or G6(C[i+1], P[i], Q[i], R[i]);

    end
endgenerate

not G7(valid, C[6]);

endmodule