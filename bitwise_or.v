`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:43:50 PM
// Design Name: 
// Module Name: bitwise_or
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
module bitwise_or(
    input [5:0] A, B,
    output [5:0] Y
);

or G1(Y[0], A[0], B[0]);
or G2(Y[1], A[1], B[1]);
or G3(Y[2], A[2], B[2]);
or G4(Y[3], A[3], B[3]);
or G5(Y[4], A[4], B[4]);
or G6(Y[5], A[5], B[5]);

endmodule