`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:00:52 11/24/2015 
// Design Name:
// Module Name:    MUX21 
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
module MUX_2(MuxOut, MuxIn0, MuxIn1, Sel);

parameter WORD_SIZE = 32;

input [WORD_SIZE-1:0] MuxIn0, MuxIn1;
input Sel;
output reg [WORD_SIZE-1:0] MuxOut;

//When Sel, MuxIn0 or MuxIn1 changes, then MuxOut changes
always @ (Sel, MuxIn0, MuxIn1)				
	begin
		case (Sel)
			1'b0: MuxOut = MuxIn0;
			1'b1: MuxOut = MuxIn1; 
			
		endcase
	end
 endmodule
