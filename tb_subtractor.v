`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:45:57 PM
// Design Name: 
// Module Name: tb_subtractor
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

module tb_subtractor;

reg [5:0] A, B;
wire [5:0] DIFF;
wire valid;

subtractor DUT(
    .A(A),
    .B(B),
    .DIFF(DIFF),
    .valid(valid)
);

initial begin

    $monitor("TIME=%0t A=%d B=%d DIFF=%d VALID=%b",
              $time, A, B, DIFF, valid);

    A=6'd40; B=6'd20; #10;
    A=6'd30; B=6'd10; #10;
    A=6'd10; B=6'd20; #10;
    A=6'd5;  B=6'd5;  #10;
    A=6'd63; B=6'd1;  #10;
    A=6'd0;  B=6'd63; #10;

    $finish;

end

endmodule