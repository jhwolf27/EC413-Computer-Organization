`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:44 10/09/2015 
// Design Name: 
// Module Name:    NOT_nbit 
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
module NOT_nbit(c_out,R2);

parameter W = 32; //parameter to change the size of the input and output bits

input [W-1:0]R2;
output [W-1:0]c_out;

genvar i;
generate
	for(i = 0; i < W; i = i + 1) //for loop to NOT W bits
		begin
			not not1(c_out[i],R2[i]);
		end
endgenerate

endmodule
