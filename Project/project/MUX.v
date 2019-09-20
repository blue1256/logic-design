`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:53 05/29/2018 
// Design Name: 
// Module Name:    MUX2bit 
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
module MUX2bit(
    input [1:0] a,
    input [1:0] b,
    input control,
    output [1:0] out
    );
	 
	 reg [1:0] outReg;
	 
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
