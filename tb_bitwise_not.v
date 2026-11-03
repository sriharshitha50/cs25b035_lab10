`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:47:34 PM
// Design Name: 
// Module Name: tb_bitwise_not
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

module tb_bitwise_not;

reg [5:0] A;
wire [5:0] Y;

bitwise_not DUT(
    .A(A),
    .Y(Y)
);

initial begin

    $monitor("TIME=%0t A=%b NOT=%b",
              $time, A, Y);

    A=6'b101010; #10;
    A=6'b111111; #10;
    A=6'b000000; #10;
    A=6'b110011; #10;
    A=6'b010101; #10;

    $finish;

end

endmodule