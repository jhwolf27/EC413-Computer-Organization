`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:46 10/09/2015 
// Design Name: 
// Module Name:    TOP_MODULE 
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
module TOP_MODULE(R2,R3,ALUOp,clk,R0);

parameter W = 32;

input [W-1:0]R2,R3;
input [2:0]ALUOp; //3 bit to define mode of ALU
input clk;
output [W-1:0]R0; //final output

//middle wire between ALU and REG
wire [W-1:0]R1;

//Reads inputs R2, R3 and the mode then outputs R1.
ALU #(.W(W)) ALU(R1,R2,R3,ALUOp); 
//takes in R1 and clk input then outputs R0.
Para_REG #(.W(W)) REG(clk,R1,R0); 

endmodule
