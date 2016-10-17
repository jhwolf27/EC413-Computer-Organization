`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:10 10/09/2015 
// Design Name: 
// Module Name:    ADD_nbit 
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
module ADD_nbit(c_out, sum, a, b, c_in);

parameter W = 32; //parameter to change the size of the input and output bits

input [W-1:0] a, b;
input c_in;
output [W-1:0] sum;
output c_out;

wire [W:0] carry;

assign carry[0] = c_in;
assign c_out = carry[W];

genvar i;
generate
	for(i = 0; i < W; i = i + 1) //for loop to ADD each bit of the inputs at a time and set it to the corresponding output bit
		begin: adder
			FA_str FA (carry[i+1], sum[i], a[i], b[i], carry[i]);
		end

endgenerate


endmodule
