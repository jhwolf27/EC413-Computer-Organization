`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:32:20 11/1/2015 
// Design Name: 
// Module Name:    MUX31 
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
module MUX_32(MuxOut, MuxIn0, MuxIn1, MuxIn2, Sel);

parameter DATA_WIDTH = 32;

input [DATA_WIDTH-1:0] MuxIn0, MuxIn1, MuxIn2;
input [1:0]Sel;
output reg [DATA_WIDTH-1:0] MuxOut;

//When Sel, MuxIn0, MuxIn1 or MuxIn2 changes, then MuxOut changes
always @ (Sel, MuxIn0, MuxIn1, MuxIn2)			
	begin
		case (Sel)
			2'b00: MuxOut = MuxIn0; 
			2'b01: MuxOut = MuxIn1;
			2'b10: MuxOut = MuxIn2;
		endcase
	end
endmodule
