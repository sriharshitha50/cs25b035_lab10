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

module comparator(
    input [5:0] A, B,
    output reg [1:0] COMP
);

wire [5:0] DIFF;
wire sub_valid;
wire equal;

subtractor U1(
    .A(A),
    .B(B),
    .DIFF(DIFF),
    .valid(sub_valid)
);

nor G1(equal,
       DIFF[0],
       DIFF[1],
       DIFF[2],
       DIFF[3],
       DIFF[4],
       DIFF[5]);

always @(*) begin

    if(equal)
        COMP = 2'b00;

    else if(sub_valid)
        COMP = 2'b01;

    else
        COMP = 2'b10;

end

endmodule