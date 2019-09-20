`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:01 05/29/2018 
// Design Name: 
// Module Name:    Decoder 
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
module Decoder(
    input [3:0] bcd,
    output [6:0] seg
    );
	 
	 reg [6:0] sReg;
	 
	 assign seg = sReg;
	 
	 always @(*) begin
		case(bcd)
			4'd0: sReg <= 7'b0111111;
			4'd1: sReg <= 7'b0000110;
			4'd2: sReg <= 7'b1011011;
			4'd3: sReg <= 7'b1001111;
			4'd4: sReg <= 7'b1100110;
			4'd5: sReg <= 7'b1101101;
			4'd6: sReg <= 7'b1111101;
			4'd7: sReg <= 7'b0000111;
			4'd8: sReg <= 7'b1111111;
			4'd9: sReg <= 7'b1101111;
			4'd10: sReg <= 7'b1110111;
			4'd11: sReg <= 7'b0011111;
			4'd12: sReg <= 7'b1001110;
			4'd13: sReg <= 7'b0111101;
			4'd14: sReg <= 7'b1001111;
			4'd15: sReg <= 7'b1000111;
		endcase
	 end
endmodule
