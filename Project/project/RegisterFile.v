`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:53 05/25/2018 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
    input [1:0] ReadReg1,
    input [1:0] ReadReg2,
	 input Write,
    input [1:0] WriteReg,
    input [7:0] WriteData,
	 input reset,
    output [7:0] ReadData1,
    output [7:0] ReadData2
    );
	 
	 reg [7:0] regist[0:3];
	 reg [7:0] RD1;
	 reg [7:0] RD2;
	 assign ReadData1 = RD1;
	 assign ReadData2 = RD2;
	 
	 always@(posedge reset) begin
		regist[0]=0;
		regist[1]=0;
		regist[2]=0;
		regist[3]=0;
	 end
	 always@(Write or ReadReg1 or ReadReg2 or WriteReg or WriteData) begin
		RD1 <= regist[ReadReg1];
		RD2 <= regist[ReadReg2];
		if(Write==1'b1) begin
			regist[WriteReg] <= WriteData;
		end
	 end
endmodule
