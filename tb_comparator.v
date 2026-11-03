`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:47:07 PM
// Design Name: 
// Module Name: tb_comparator
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

module tb_comparator;

reg [5:0] A, B;
wire [1:0] COMP;

comparator DUT(
    .A(A),
    .B(B),
    .COMP(COMP)
);

initial begin

    $monitor("TIME=%0t A=%d B=%d COMPARE=%b",
              $time, A, B, COMP);

    // A = B

    A=6'd25; B=6'd25; #10;

    // A > B

    A=6'd40; B=6'd20; #10;

    // A < B

    A=6'd10; B=6'd30; #10;

    // A = B = 0

    A=6'd0; B=6'd0; #10;

    // Maximum A, minimum B

    A=6'd63; B=6'd0; #10;

    // Minimum A, maximum B

    A=6'd0; B=6'd63; #10;

    $finish;

end

endmodule