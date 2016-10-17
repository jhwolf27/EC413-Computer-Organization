`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:32:23 11/1/2015 
// Design Name: 
// Module Name:    SE 
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
module Sign_Extension(out_32, in_16);

input [15:0] in_16;
output [31:0] out_32;

assign out_32 = {{in_16[15]*16'b1111111111111111}, in_16};

endmodule
