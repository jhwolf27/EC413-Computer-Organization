`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:51 10/09/2015 
// Design Name: 
// Module Name:    AND_nbit 
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
module AND_nbit(c_out,R2,R3);

parameter W = 32; //parameter to change input and output bit size

input [W-1:0]R2,R3;
output [W-1:0]c_out;

genvar i;
generate
	for(i = 0; i < W; i = i + 1) //for loop to AND each bit of the inputs at a time and set it to the corresponding output bit
		begin: ander
			and and1(c_out[i],R2[i],R3[i]);
		end
endgenerate

endmodule
