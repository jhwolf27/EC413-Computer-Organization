`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:37 10/09/2015 
// Design Name: 
// Module Name:    Para_REG 
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
module Para_REG(clk,reg_in,reg_out);

parameter W=32; 

input clk;
input [W-1:0]reg_in;
output [W-1:0]reg_out;

reg[W-1:0] Reg;


assign reg_out = Reg;

//every posedge assigns input of regsiter to output of register
always@(posedge clk)
	begin
		Reg <= reg_in;
	end

endmodule
