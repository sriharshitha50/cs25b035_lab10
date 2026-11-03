`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:45:33 PM
// Design Name: 
// Module Name: tb_adder
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

module tb_adder;

reg [5:0] A, B;
wire [5:0] SUM;
wire valid;

adder DUT(
    .A(A),
    .B(B),
    .SUM(SUM),
    .valid(valid)
);

initial begin

    $monitor("TIME=%0t A=%d B=%d SUM=%d VALID=%b",
              $time, A, B, SUM, valid);

    A=6'd10; B=6'd20; #10;
    A=6'd20; B=6'd30; #10;
    A=6'd40; B=6'd30; #10;
    A=6'd63; B=6'd1;  #10;
    A=6'd0;  B=6'd0;  #10;

    $finish;

end

endmodule