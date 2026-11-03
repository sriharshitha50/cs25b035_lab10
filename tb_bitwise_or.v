`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:46:32 PM
// Design Name: 
// Module Name: tb_bitwise_or
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

module tb_bitwise_or;

reg [5:0] A, B;
wire [5:0] Y;

bitwise_or DUT(
    .A(A),
    .B(B),
    .Y(Y)
);

initial begin

    $monitor("TIME=%0t A=%b B=%b OR=%b",
              $time, A, B, Y);

    A=6'b101010; B=6'b110011; #10;
    A=6'b111111; B=6'b000000; #10;
    A=6'b000000; B=6'b000000; #10;
    A=6'b101101; B=6'b010110; #10;
    A=6'b111111; B=6'b111111; #10;

    $finish;

end

endmodule