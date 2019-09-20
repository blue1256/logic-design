`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:01 05/29/2018 
// Design Name: 
// Module Name:    MUX8bit 
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
module MUX8bit(
    input [7:0] a,
    input [7:0] b,
    input control,
    output [7:0] out
    );
	 
	 reg [7:0] outReg;
	 
	 assign out = outReg;
	 
	 always @(*) begin
		if(control) begin
			outReg=b;
		end
		else begin
			outReg=a;
		end
	 end


endmodule
