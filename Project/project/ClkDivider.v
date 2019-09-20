`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:41 05/29/2018 
// Design Name: 
// Module Name:    ClkDivider 
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
module ClkDivider(
    input clkin,
    input reset,
    output reg clkout
    );
	 
	 reg [31:0] cnt;
	 always @(posedge reset) begin
		cnt<=0;
		clkout<=0;
	 end
	 always @(posedge clkin) begin
		if(cnt==32'd2500) begin
			cnt<=0;
			clkout<=~clkout;
		end
		else begin
			cnt<=cnt+1;
		end
	 end
endmodule
