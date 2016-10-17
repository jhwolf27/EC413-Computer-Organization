`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:14 10/26/2015 
// Design Name: 
// Module Name:    Mux 
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
module nbmux(In1,In2,MuxSel,Output);

input [31:0]In1;
input [15:0]In2;
input MuxSel;
output reg [31:0]Output;

always @(MuxSel,In1,In2)
begin
	case(MuxSel)
		1'b0: assign Output = In1;
		1'b1: assign Output = 16'b0000_0000_0000_0000 + In2;
	endcase
end

endmodule
