`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:44:01 PM
// Design Name: 
// Module Name: bitwise_not
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
module bitwise_not(
    input [5:0] A,
    output [5:0] Y
);

not G1(Y[0], A[0]);
not G2(Y[1], A[1]);
not G3(Y[2], A[2]);
not G4(Y[3], A[3]);
not G5(Y[4], A[4]);
not G6(Y[5], A[5]);

endmodule