`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:37:04 11/13/2015 
// Design Name: 
// Module Name:    Stage3 
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
module Stage3(clk,reset,R1_S3,WriteSelect_IN,WriteEnable_IN,ALUOut,WriteSelect_OUT,WriteEnable_OUT);


input clk,reset;
input [31:0]R1_S3;
input [4:0]WriteSelect_IN;
input WriteEnable_IN;

output reg [31:0]ALUOut;
output reg [4:0]WriteSelect_OUT;
output reg WriteEnable_OUT;

always @ (posedge clk)
	begin
	if(reset)
		begin
			ALUOut <= 0;
			WriteSelect_OUT <= 0;
			WriteEnable_OUT <= 0;
		end
	else
		begin
			ALUOut <= R1_S3;
			WriteSelect_OUT <= WriteSelect_IN;
			WriteEnable_OUT <= WriteEnable_IN;
		end
	end

endmodule
