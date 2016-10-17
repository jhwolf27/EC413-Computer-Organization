`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:29:45 11/13/2015
// Design Name:   Top_Module
// Module Name:   C:/Users/jax/Desktop/EC413/Lab6Final/TOP_MODULE_TB.v
// Project Name:  Lab6Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top_Module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TOP_MODULE_TB;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] InstrIn;

	// Outputs
	wire [31:0] ALUOut;

	// Instantiate the Unit Under Test (UUT)
	Top_Module uut (
		.clk(clk), 
		.reset(reset), 
		.InstrIn(InstrIn), 
		.ALUOut(ALUOut)
	);

	always #5
	clk = ~clk;

	initial begin
		// Initialize Inputs
		InstrIn = 0;
		reset = 1;
		clk = 0;
 

		// Wait 100 ns for global reset to finish
		#100;
      
		reset = 0;
		
		
//		---- I type ---
		#30
		InstrIn= 32'b011010_00000_00000_0000000000000100;		// I, add r0 with 00000004 =>   r0 

		#10
		InstrIn= 32'b011010_00001_00001_0000000000001111;		// I, add r1 with 0000000F =>   r1 

		#10
		InstrIn= 32'b011010_00010_00010_1111111111111110;		// I, add r2 with 0000FFFE =>   r2 
		#10
		InstrIn= 32'b011001_00011_00011_1111111111111000;		// I, not r3     				=>   r3 
		
		#10
		InstrIn= 32'b011100_00100_00100_1010101010101010;		// I, or r4 with 0000AAAA  =>   r4 
		
		#10
		InstrIn= 32'b011101_00101_00101_1111111111111111;		// I, and r5 with 0000FFFF =>   r5 
		
		#10
		InstrIn= 32'b011110_00110_00110_1111111111111000;		// I, slt r6 with 0000FFFFE =>  r6 

//		---- R type ---
		#10
		InstrIn= 32'b010001_00111_00001_00000_00000000000;		// R, not r1(0000000F)                   =>  r7 

		#10
		InstrIn= 32'b010010_01000_00001_00010_00000000000;		// R, add r1(0000000F) with r2(0000FFFE) =>  r8 
		
		#10
		InstrIn= 32'b010010_01001_00001_00011_00000000000;		// R, add r1(0000000F) with r3(FFFFFFFF) =>  r9 
		
		#10
		InstrIn= 32'b010010_01010_00001_00100_00000000000;		// R, add r1(0000000F) with r4(0000AAAA) =>  r10 
	
		#10
		InstrIn= 32'b010010_01011_00001_00101_00000000000;		// R, add r1(0000000F) with r5(00000000) =>  r11 
		
		#10
		InstrIn= 32'b010010_01100_00001_00110_00000000000;		// R, add r1(0000000F) wtih r6(00000001) =>  r12 
		
		
		
		// Add stimulus here

	end
      
endmodule


