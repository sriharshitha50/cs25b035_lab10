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

module mini_alu(
    input [5:0] A, B,
    input [2:0] sel,

    output reg [5:0] result,
    output reg [1:0] compare,
    output reg valid
);

wire [5:0] add_result;
wire [5:0] sub_result;
wire [5:0] and_result;
wire [5:0] or_result;
wire [5:0] not_result;
wire [5:0] mul_result;

wire add_valid;
wire sub_valid;
wire mul_valid;

wire [1:0] comp_result;


// ADDER

adder U1(
    .A(A),
    .B(B),
    .SUM(add_result),
    .valid(add_valid)
);


// SUBTRACTOR

subtractor U2(
    .A(A),
    .B(B),
    .DIFF(sub_result),
    .valid(sub_valid)
);


// AND

bitwise_and U3(
    .A(A),
    .B(B),
    .Y(and_result)
);


// OR

bitwise_or U4(
    .A(A),
    .B(B),
    .Y(or_result)
);


// NOT

bitwise_not U5(
    .A(A),
    .Y(not_result)
);


// MULTIPLIER

Multiplier U6(
    .A(A),
    .B(B),
    .PRODUCT(mul_result),
    .valid(mul_valid)
);


// COMPARATOR

comparator U7(
    .A(A),
    .B(B),
    .COMP(comp_result)
);


// ALU CONTROL AND OUTPUT SELECTION

always @(*) begin

    result  = 6'b000000;
    compare = 2'b11;
    valid   = 1'b0;

    case(sel)

        3'b000: begin
            result = add_result;
            valid = add_valid;
        end

        3'b001: begin
            result = sub_result;
            valid = sub_valid;
        end

        3'b010: begin
            result = and_result;
            valid = 1'b1;
        end

        3'b011: begin
            result = or_result;
            valid = 1'b1;
        end

        3'b100: begin
            result = not_result;
            valid = 1'b1;
        end

        3'b101: begin
            result = mul_result;
            valid = mul_valid;
        end

        3'b110: begin
            compare = comp_result;
            valid = 1'b1;
        end

        3'b111: begin
            result = 6'b000000;
            compare = 2'b11;
            valid = 1'b0;
        end

        default: begin
            result = 6'b000000;
            compare = 2'b11;
            valid = 1'b0;
        end

    endcase

end

endmodule