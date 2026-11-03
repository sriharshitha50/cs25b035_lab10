`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:47:51 PM
// Design Name: 
// Module Name: tb_mini_alu
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

module tb_mini_alu;

// Inputs

reg [5:0] A;
reg [5:0] B;
reg [2:0] sel;

// Outputs

wire [5:0] result;
wire [1:0] compare;
wire valid;


// Instantiate main ALU

mini_alu DUT(
    .A(A),
    .B(B),
    .sel(sel),
    .result(result),
    .compare(compare),
    .valid(valid)
);


initial begin

    $display("==============================================");
    $display("             MINI ALU TESTBENCH               ");
    $display("==============================================");

    $monitor("Time=%0t | A=%d | B=%d | SEL=%b | RESULT=%d | COMP=%b | VALID=%b",
             $time, A, B, sel, result, compare, valid);


    // TEST 1: ADDITION (20 + 30 = 50)

    A = 6'd20;
    B = 6'd30;
    sel = 3'b000;
    #10;


    // TEST 2: ADDITION OVERFLOW (40 + 30 = 70)

    A = 6'd40;
    B = 6'd30;
    sel = 3'b000;
    #10;


    // TEST 3: SUBTRACTION (40 - 20 = 20)

    A = 6'd40;
    B = 6'd20;
    sel = 3'b001;
    #10;


    // TEST 4: SUBTRACTION INVALID (10 - 20)

    A = 6'd10;
    B = 6'd20;
    sel = 3'b001;
    #10;


    // TEST 5: BITWISE AND

    A = 6'b101010;
    B = 6'b110011;
    sel = 3'b010;
    #10;


    // TEST 6: BITWISE OR

    A = 6'b101010;
    B = 6'b110011;
    sel = 3'b011;
    #10;


    // TEST 7: BITWISE NOT

    A = 6'b101010;
    B = 6'b000000;
    sel = 3'b100;
    #10;


    // TEST 8: MULTIPLICATION (5 * 6 = 30)

    A = 6'd5;
    B = 6'd6;
    sel = 3'b101;
    #10;


    // TEST 9: MULTIPLICATION OVERFLOW (10 * 10 = 100)

    A = 6'd10;
    B = 6'd10;
    sel = 3'b101;
    #10;


    // TEST 10: COMPARATOR EQUAL

    A = 6'd25;
    B = 6'd25;
    sel = 3'b110;
    #10;


    // TEST 11: COMPARATOR GREATER

    A = 6'd40;
    B = 6'd20;
    sel = 3'b110;
    #10;


    // TEST 12: COMPARATOR SMALLER

    A = 6'd10;
    B = 6'd30;
    sel = 3'b110;
    #10;


    // TEST 13: INVALID OPERATION

    A = 6'd10;
    B = 6'd20;
    sel = 3'b111;
    #10;


    $display("==============================================");
    $display("          ALL TESTS COMPLETED                 ");
    $display("==============================================");

    $finish;

end

endmodule