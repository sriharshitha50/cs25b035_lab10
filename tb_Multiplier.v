`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:46:52 PM
// Design Name: 
// Module Name: tb_multiplier
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

module tb_Multiplier;

reg [5:0] A, B;
wire [5:0] PRODUCT;
wire valid;

Multiplier DUT(
    .A(A),
    .B(B),
    .PRODUCT(PRODUCT),
    .valid(valid)
);

initial begin

    $monitor("TIME=%0t A=%d B=%d PRODUCT=%d VALID=%b",
              $time, A, B, PRODUCT, valid);

    A=6'd5;  B=6'd6;  #10;
    A=6'd2;  B=6'd3;  #10;
    A=6'd7;  B=6'd8;  #10;
    A=6'd10; B=6'd10; #10;
    A=6'd63; B=6'd1;  #10;
    A=6'd63; B=6'd63; #10;
    A=6'd0;  B=6'd50; #10;

    $finish;

end

endmodule