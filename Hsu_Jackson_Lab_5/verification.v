`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:46 10/09/2015 
// Design Name: 
// Module Name:    verification 
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
module verification(R0, R2, R3, ALUOp);
	
	parameter W = 32;

	input	[W-1:0] R2, R3; //declare inputs to be parameterized
	input [2:0] ALUOp;
	output reg [W-1:0]	R0;

//Behaviorial ALU

	always @ (R2, R3, ALUOp)
	begin
		case(ALUOp)
			3'b000: assign R0 = R2;
			3'b001: assign R0 = ~R2;
			3'b010: assign R0 = R2 + R3;
			3'b011: assign R0 = R2 - R3;
			3'b100: assign R0 = R2 | R3;
			3'b101: assign R0 = R2 & R3;
			default: assign R0 = 0;
		endcase
	end


endmodule
