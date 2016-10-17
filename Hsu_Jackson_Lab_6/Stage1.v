`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:39 11/13/2015 
// Design Name: 
// Module Name:    Stage1 
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
module Stage1(InstrIn,clk,reset,RS1_S1,RS2_S1,IMM_S1,DataSource_S1,ALUOp_S1,WriteSel_S1,WriteEnable_S1);

input [31:0]InstrIn;
input clk,reset;
output reg [4:0]RS1_S1,RS2_S1,WriteSel_S1;
output reg [15:0]IMM_S1;
output reg DataSource_S1;
output reg [2:0]ALUOp_S1;
output reg WriteEnable_S1;

always @(posedge clk)
	begin
	if(reset)
		begin
			RS1_S1 <= 0;
			RS2_S1 <= 0;
			IMM_S1 <= 0;
			ALUOp_S1 <= 0;
			WriteSel_S1 <= 0;
			DataSource_S1 <= 0;
			WriteEnable_S1 <= 0;
		end
	
	else
		begin
			RS1_S1 <= InstrIn[20:16];
			RS2_S1 <= InstrIn[15:11];
			IMM_S1 <= InstrIn[15:0];
			ALUOp_S1 <= InstrIn[28:26];
			WriteSel_S1 <= InstrIn[25:21];
			DataSource_S1 <= InstrIn[29];
			WriteEnable_S1 <= InstrIn[30];
		end
	end

endmodule
