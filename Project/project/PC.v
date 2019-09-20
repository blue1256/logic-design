`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:50 05/29/2018 
// Design Name: 
// Module Name:    PC 
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
module PC(
	 input Branch,
	 input clk,
	 input reset,
	 input [7:0] bData,
    output [7:0] out
    );
	 
	 wire clkDiv;
	 reg [7:0] outReg;
	 
	 assign out = outReg;
	 
	 ClkDivider clk_div(clk,reset,clkDiv);
	 
	 always @(posedge reset) begin
		outReg<=0;
	 end
	 
	 always @(posedge clkDiv) begin
		if(Branch) begin
			outReg <= bData+outReg+1;
		end
		else begin
			outReg <= outReg+1;
		end
	 end
endmodule
