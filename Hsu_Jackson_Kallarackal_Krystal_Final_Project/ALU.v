`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:02 11/2/2015 
// Design Name: 
// Module Name:    Ideal_ALU 
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
module ALU(Zero, R1, R2, R3, ALUOp);
	 
	 
	parameter	word_size = 32;	

	input  [word_size-1:0] R2, R3;
	input	 [3:0] ALUOp;
	output reg [word_size-1:0] R1;
	output reg Zero;

//When R2, R3 or ALUOp changes, then R1 changes
 always @ (R2, R3, ALUOp)
	begin
		case (ALUOp)
			4'b0000: R1 = R2; //MOV
			4'b0001: R1 = ~R2; //NOT
			4'b0010: R1 = (R2 + R3); //ADD
			4'b0011: R1 = (R2 - R3); //SUB
			4'b0100: R1 = (R2 | R3); //OR
			4'b0101: R1 = (R2 & R3); //AND
			4'b0110: R1 = (R2 ^ R3); //XOR
			4'b0111: R1 = (($signed(R2) < $signed(R3))? 1:0);	 //SLT
			endcase
				if (R1 == 32'h00000000)
				begin
					assign Zero = 1;
				end
				else
				begin
					assign Zero = 0;
				end
	end
endmodule
