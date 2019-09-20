`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:46 05/25/2018 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
    input [1:0] op,
    output Branch,
    output MemToReg,
    output MemRead,
    output MemWrite,
    output ALUop,
    output ALUsrc,
    output RegWrite,
    output RegDst
    );
	 reg[7:0] out;
	 assign {Branch,MemToReg,MemRead,MemWrite,ALUop,ALUsrc,RegWrite,RegDst} = out;
	 always @(op) begin
		case(op)
			2'b00 : out <= 8'b00001011;
			2'b01 : out <= 8'b01100110;
			2'b10 : out <= 8'b00010100;
			2'b11 : out <= 8'b10000000;
		endcase
	end

endmodule
