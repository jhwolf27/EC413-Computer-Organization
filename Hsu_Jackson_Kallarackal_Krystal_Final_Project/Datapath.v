`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:46:29 12/06/2015 
// Design Name: 
// Module Name:    Datapath 
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
module Datapath(clk, reset, ALUOut, Instr, state, PCCount);

parameter DATA_WIDTH = 32;
parameter REG_LENTH = 5;


input clk, reset;
output [DATA_WIDTH-1:0] Instr;
output [DATA_WIDTH-1:0] PCCount;
output [DATA_WIDTH-1:0] ALUOut;
output [3:0] state;


//Controller
wire [3:0] ALUOp; //ALUOp: for computation
wire [1:0] PCSource, ALUSrcB, ALUSrcA, MemtoReg; // One more option is added for the 0 (swi, lwi)

wire Zero, RegWrite,IRWrite, PCWrite, ReadSel, MemWrite, PCWriteCond, pc_wire, PCEn;

and and1 (pc_wire, Zero, PCWriteCond);
or or1 (PCEn, PCWrite, pc_wire);


//Control
Controller Controller (PCSource, ALUOp, IRWrite, ALUSrcA, ALUSrcB, RegWrite, MemtoReg, PCWrite, ReadSel, MemWrite, PCWriteCond, state, clk, reset, Instr[31:26]);


//Wires for Datapath
wire [DATA_WIDTH-1:0] PCIn, Instr1, ReadData11, ReadData1, ReadData21, ReadData2, Operand1, Operand2;
wire [DATA_WIDTH-1:0] ALUResult, ALUOut, MemData1, MemData, WriteData, SE_out, ZE_out;
wire [REG_LENTH-1:0] ReadReg2;

//Instruction Memory
IMEM #(DATA_WIDTH)Instruction_Memory (PCCount, Instr1);

//General Purpose Register
nbit_reg #(DATA_WIDTH) PC_Register (PCIn, PCCount, PCEn, reset, clk);
nbit_reg #(DATA_WIDTH) Instruction_Register (Instr1, Instr, IRWrite, reset, clk);
nbit_reg #(DATA_WIDTH) A_Register (ReadData11, ReadData1, 1'b1, reset, clk);
nbit_reg #(DATA_WIDTH) B_Register (ReadData21, ReadData2, 1'b1, reset, clk);
nbit_reg #(DATA_WIDTH) ALU_Register (ALUResult, ALUOut, 1'b1, reset, clk);
nbit_reg #(DATA_WIDTH) Memory_Register (MemData1, MemData, 1'b1, reset, clk);

//Data Memory
DMEM #(DATA_WIDTH) Data_Memory (ReadData2, MemData1, ALUOut, MemWrite, clk);

//ALU
ALU #(DATA_WIDTH)	ALU (Zero ,ALUResult, Operand1, Operand2, ALUOp);

//MUX
MUX_32 #(DATA_WIDTH) PC_Mux (PCIn, ALUResult, ALUOut, ALUOut, PCSource);
//MUX_2 #(REG_LENTH) Read_Select_Mux (ReadReg2, Instr[20:16], Instr[15:11], ReadSel);
MUX_2 #(REG_LENTH) Read_Select_Mux (ReadReg2, Instr[25:21], Instr[15:11], ReadSel);
MUX_4 #(DATA_WIDTH) Memory_To_Register_Mux (WriteData, ALUOut, MemData, {ReadData2[31:16], ALUOut[15:0]}, {ALUOut[15:0],ReadData2[15:0]}, MemtoReg);
MUX_32  #(DATA_WIDTH) SrcA_Mux (Operand1, PCCount, ReadData1, 32'h00000000, ALUSrcA);
MUX_4 #(DATA_WIDTH)SrcB_Mux (Operand2, ReadData2, 32'h00000001,SE_out, ZE_out, ALUSrcB);


//Extensions
Sign_Extension	Sign_Extension (SE_out, Instr[15:0]);
//Shif16 Sht161 (Sht_out, SE_out);
Zero_Extension Zero_Extension (ZE_out, Instr[15:0]);

//Register File
nbit_register_file #(DATA_WIDTH, 5) Register_File (WriteData, ReadData11, ReadData21, Instr[20:16], ReadReg2, Instr[25:21], RegWrite, clk);


endmodule
