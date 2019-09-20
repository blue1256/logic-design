`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:05 05/25/2018 
// Design Name: 
// Module Name:    Microprocessor 
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
module Microprocessor(
	 input [7:0] instruction,
	 input clk,
	 input reset,
	 output [7:0] pcOut,
	 output [6:0] wData1,
	 output [6:0] wData2,
	 output overflow
    );
	 
	 reg [1:0] opR;
	 reg [1:0] RR1R;
	 reg [1:0] RR2R;
	 reg [1:0] rdR;
	 wire [1:0] op;
	 wire [1:0] RR1;
	 wire [1:0] RR2;
	 wire [1:0] rd;
	 assign op = opR;
	 assign RR1 = RR1R;
	 assign RR2 = RR2R;
	 assign rd = rdR;
	 
	 //Control Unit
	 wire Branch,MemToReg,MemRead,MemWrite,ALUop,ALUsrc,RegWrite,RegDst;
	 //Register
	 wire [1:0] WriteReg;
	 wire [7:0] WriteData;
	 wire [7:0] RegData1;
	 wire [7:0] RegData2;
	 //ALU
	 wire [7:0] ALUout;
	 wire [7:0] ALUb;
	 //Memory
	 wire [7:0] MemData;
	 //etc
	 wire [7:0] rdExtend;
	 wire [3:0] HighWD;
	 wire [3:0] LowWD;
	 
	 assign HighWD = MemData[7:4];
	 assign LowWD = MemData[3:0];
	 
	 ControlUnit CU(op,Branch,MemToReg,MemRead,MemWrite,ALUop,ALUsrc,RegWrite,RegDst);
	 PC pc(Branch,clk,reset,rdExtend,pcOut);
	 MUX2bit RegMux(RR2,rd,RegDst,WriteReg);
	 MUX8bit MemMux(ALUout,MemData,MemToReg,WriteData);
 	 MUX8bit ALUMux(RegData2,rdExtend,ALUsrc,ALUb);
	 RegisterFile RF(RR1,RR2,RegWrite,WriteReg,WriteData,reset,RegData1,RegData2);
	 Memory MEM(ALUout,RegData2,MemWrite,MemRead,reset,MemData);
	 SignExtend SE(rd,rdExtend);
	 Alu ALU(ALUop,RegData1,ALUb,ALUout,overflow);
	 Decoder HighNum(HighWD,wData1);
	 Decoder LowNum(LowWD,wData2);
	 
	 always @(instruction) begin
		opR <= instruction[7:6];
		RR1R <= instruction[5:4];
		RR2R <= instruction[3:2];
		rdR <= instruction[1:0];
	 end

endmodule
