`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:51 05/25/2018 
// Design Name: 
// Module Name:    Memory 
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
module Memory(
    input [7:0] Address,
    input [7:0] WriteData,
    input Write,
    input Read,
    input reset,
    output [7:0] ReadData
    );
	 
	 reg [7:0] outdata;
	 reg [7:0] mem [0:31];
	 integer i = 0;
	 
	 assign ReadData = outdata;
	 
	 always @(Address or Write or Read or WriteData) begin
		if(Write == 1'b1) begin
			mem[Address] <= WriteData;
		end
		else if(Read == 1'b1) begin
			outdata <= mem[Address];
		end
	 end
	 always@(posedge reset) begin
		for(i=0;i<16;i=i+1) begin
			mem[i] = i;
		end
		for(i=0;i<16;i=i+1) begin
			mem[i+16] = -i;
		end
	end

endmodule
