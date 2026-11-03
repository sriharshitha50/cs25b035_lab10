`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:42:55 PM
// Design Name: 
// Module Name: subtractor
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
module subtractor(
    input [5:0] A, B,
    output [5:0] DIFF,
    output valid
);

wire [6:0] Borrow;
wire [5:0] X;
wire [5:0] N, P, Q, R;

assign Borrow[0] = 1'b0;

genvar i;

generate
    for(i=0; i<6; i=i+1) begin

        xor G1(X[i], A[i], B[i]);
        xor G2(DIFF[i], X[i], Borrow[i]);

        not G3(N[i], A[i]);

        and G4(P[i], N[i], B[i]);
        and G5(Q[i], N[i], Borrow[i]);
        and G6(R[i], B[i], Borrow[i]);

        or G7(Borrow[i+1], P[i], Q[i], R[i]);

    end
endgenerate

not G8(valid, Borrow[6]);

endmodule