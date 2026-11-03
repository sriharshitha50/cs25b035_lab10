

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
module Multiplier(
    input [5:0] A, B,
    output [5:0] PRODUCT,
    output valid
);

wire [11:0] stage [0:6];

assign stage[0] = 12'b000000000000;

genvar r, k;

generate
    for(r=0; r<6; r=r+1) begin: ROW

        wire [5:0] pp;
        wire [11:0] row_bits;
        wire [12:0] carry;

        assign carry[0] = 1'b0;

        for(k=0; k<6; k=k+1) begin: PART

            and G1(pp[k], A[k], B[r]);

        end

        for(k=0; k<12; k=k+1) begin: ADD

            wire x, p, q, t;

            if((k>=r) && (k<r+6)) begin
                buf G2(row_bits[k], pp[k-r]);
            end
            else begin
                assign row_bits[k] = 1'b0;
            end

            xor G3(x, stage[r][k], row_bits[k]);
            xor G4(stage[r+1][k], x, carry[k]);

            and G5(p, stage[r][k], row_bits[k]);
            and G6(q, stage[r][k], carry[k]);
            and G7(t, row_bits[k], carry[k]);

            or G8(carry[k+1], p, q, t);

        end
    end
endgenerate

assign PRODUCT = stage[6][5:0];

nor G9(valid,
       stage[6][6],
       stage[6][7],
       stage[6][8],
       stage[6][9],
       stage[6][10],
       stage[6][11]);

endmodule