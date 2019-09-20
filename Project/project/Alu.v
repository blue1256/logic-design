`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:30 05/29/2018 
// Design Name: 
// Module Name:    Alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Alu(
    input op,
    input [7:0] a,
    input [7:0] b,
    output [7:0] c,
    output over
    );
	 
	 reg [8:0] cOut;
	 reg overOut;
	 
	 assign c = cOut[7:0];
	 assign over = cOut[8]^cOut[7];
	 
	 always @(*) begin
		cOut=a+b;
	 end
	 
endmodule
