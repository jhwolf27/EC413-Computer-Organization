`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:10:07 10/09/2015 
// Design Name: 
// Module Name:    ALU 
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
module ALU(R1,R2,R3,ALUOp);

parameter W = 32; 

input [W-1:0]R2,R3;
input	[2:0]ALUOp; //3 bit to determine mode
output reg [W-1:0]R1;

//wires to compute all the various ALU functions
wire c_out1, c_out2;
wire [W-1:0]R1_NOT,R1_ADD, R1_SUB, R1_OR, R1_AND, R3_not;

NOT_nbit #(W) NOT(R1_NOT,R2);
ADD_nbit #(W) ADD(c_out1,R1_ADD,R2,R3,1'b0);
NOT_nbit #(W) R3_NOT(R3_not,R3); //NOT R3 FOR SUBTRACTION WHICH TAKES TWO'S COMPLEMENT OF R3
ADD_nbit #(W) SUB(c_out2,R1_SUB,R2,R3_not,1'b1); //Add 1 byte for 2's complement
OR_nbit	#(W) OR(R1_OR,R2,R3);
AND_nbit #(W) AND(R1_AND,R2,R3);

//whenever these variables change
always @(R2 or R3 or ALUOp)

begin
	case(ALUOp) //depending on the 3 bit value of the ALU Operation, the output will be set to the value of a different function
		3'b000: assign R1 = R2;	// MOV
		3'b001: assign R1 = R1_NOT;	// NOT
		3'b010: assign R1 = R1_ADD; // ADD
		3'b011: assign R1 = R1_SUB;	// SUB
		3'b100: assign R1 = R1_OR;	//	OR
		3'b101: assign R1 = R1_AND;	//	AND
	endcase
end

endmodule
