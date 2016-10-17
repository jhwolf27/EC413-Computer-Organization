`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:30:58 11/13/2015 
// Design Name: 
// Module Name:    Stage2 
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
module Stage2(clk,reset,RD1_IN,RD2_IN,IMM_IN,DataSource_IN,ALUOp_IN,WriteSelect_IN,WriteEnable_IN, RD1_OUT,RD2_OUT,IMM_OUT,DataSource_OUT,ALUOp_OUT,WriteSelect_OUT,WriteEnable_OUT);

input clk,reset;
input [31:0]RD1_IN,RD2_IN;
input [4:0]WriteSelect_IN;
input [15:0]IMM_IN;
input DataSource_IN;
input [2:0]ALUOp_IN;
input WriteEnable_IN;

output reg [31:0]RD1_OUT,RD2_OUT;
output reg [4:0]WriteSelect_OUT;
output reg [15:0]IMM_OUT;
output reg DataSource_OUT;
output reg [2:0]ALUOp_OUT;
output reg WriteEnable_OUT;

always @(posedge clk)
	begin
	if(reset)
		begin
			RD1_OUT <= 0;
			RD2_OUT <= 0;
			IMM_OUT <= 0;
			ALUOp_OUT <= 0;
			WriteSelect_OUT <= 0;
			DataSource_OUT <= 0;
			WriteEnable_OUT <= 0;
		end
	
	else
		begin
			RD1_OUT <= RD1_IN;
			RD2_OUT <= RD2_IN;
			IMM_OUT <= IMM_IN;
			ALUOp_OUT <= ALUOp_IN;
			WriteSelect_OUT <= WriteSelect_IN;
			DataSource_OUT <= DataSource_IN;
			WriteEnable_OUT <= WriteEnable_IN;
		end
	end

 
endmodule
