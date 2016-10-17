`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:20:07 11/13/2015 
// Design Name: 
// Module Name:    Top_Module 
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
module Top_Module(clk,reset,InstrIn,ALUOut);


input clk,reset;
input [31:0]InstrIn;

output [31:0]ALUOut;


wire [4:0]RS1_S1,RS2_S1,WriteSel_S1; //stage 1 wires
wire [15:0]IMM_S1;
wire [2:0]ALUOp_S1;
wire WriteEnable_S1,DataSource_S1;


wire [31:0] ReadData1,ReadData2; //reg wires

wire [31:0] RD1_S2,RD2_S2; //stage 2 wires
wire [4:0] WriteSelect_S2;
wire [15:0] IMM_S2;
wire [2:0] ALUOp_S2;
wire WriteEnable_S2,DataSource_S2;


wire [31:0] MuxOut; //mux wires

wire [31:0] ALU_IN; //alu wire

wire [4:0]WriteSelect_S3; //stage 3 wires
wire WriteEnable_S3;

//Stage 1
Stage1 Stage_1(
	.InstrIn(InstrIn),
	.clk(clk),
	.reset(reset),
	.RS1_S1(RS1_S1),
	.RS2_S1(RS2_S1),
	.IMM_S1(IMM_S1),
	.DataSource_S1(DataSource_S1),
	.ALUOp_S1(ALUOp_S1),
	.WriteSel_S1(WriteSel_S1),
	.WriteEnable_S1(WriteEnable_S1));
	

//Stage 2
Stage2 Stage_2(
	.clk(clk),
	.reset(reset),
	.RD1_IN(ReadData1),
	.RD2_IN(ReadData2),
	.IMM_IN(IMM_S1),
	.DataSource_IN(DataSource_S1),
	.ALUOp_IN(ALUOp_S1),
	.WriteSelect_IN(WriteSel_S1),
	.WriteEnable_IN(WriteEnable_S1),
	.RD1_OUT(RD1_S2),
	.RD2_OUT(RD2_S2),
	.IMM_OUT(IMM_S2),
	.DataSource_OUT(DataSource_S2),
	.ALUOp_OUT(ALUOp_S2),
	.WriteSelect_OUT(WriteSelect_S2),
	.WriteEnable_OUT(WriteEnable_S2));

//Stage 3
Stage3 Stage_3(
	.clk(clk),
	.reset(reset),
	.R1_S3(ALU_IN),
	.WriteSelect_IN(WriteSelect_S2),
	.WriteEnable_IN(WriteEnable_S2),
	.ALUOut(ALUOut),
	.WriteSelect_OUT(WriteSelect_S3),
	.WriteEnable_OUT(WriteEnable_S3));


//MUX
nbmux MUX(
	.In1(RD2_S2),
	.In2(IMM_S2),
	.MuxSel(DataSource_S2),
	.Output(MuxOut));
	
//ALU
ALU ALU0(
	.R1(ALU_IN),
	.R2(RD1_S2),
	.R3(MuxOut),
	.ALUOp(ALUOp_S2));
	
	
nbit_register_file NB_Reg(
	.WriteData(ALUOut),   //input
   .ReadData1(ReadData1),   // Output 1
   .ReadData2(ReadData2),   // output 2
   .ReadSelect1(RS1_S1), // output 1 select
   .ReadSelect2(RS2_S1), // output 2 select
   .WriteSelect(WriteSelect_S3), // input select
   .WriteEnable(WriteEnable_S3), // posedge write
   .Reset(reset),       //sync reset
   .Clk(clk));        // Clock





endmodule
