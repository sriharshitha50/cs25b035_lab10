`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:43:34 PM
// Design Name: 
// Module Name: bitwise_and
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

module bitwise_and(
    input [5:0] A, B,
    output [5:0] Y
);

and G1(Y[0], A[0], B[0]);
and G2(Y[1], A[1], B[1]);
and G3(Y[2], A[2], B[2]);
and G4(Y[3], A[3], B[3]);
and G5(Y[4], A[4], B[4]);
and G6(Y[5], A[5], B[5]);

endmodule