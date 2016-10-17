`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:19:47 10/09/2015
// Design Name:   TOP_MODULE
// Module Name:   C:/Users/jax/Desktop/Lab5/Lab5Final/TOP_MODULE_TB.v
// Project Name:  Lab5Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TOP_MODULE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TOP_MODULE_TB;

	parameter W = 32;

	// Inputs
	reg [W-1:0] R2;
	reg [W-1:0] R3;
	reg [2:0] ALUOp;
	reg clk;

	// Outputs
	wire [W-1:0] R0;
	wire [W-1:0] R0_verify;

	// Instantiate the Unit Under Test (UUT)
	TOP_MODULE 
	#(.W(W))
	uut (
		.R2(R2), 
		.R3(R3), 
		.ALUOp(ALUOp), 
		.clk(clk), 
		.R0(R0)
	);
	
	verification
	#(.W(W))
	verification (
		.R0(R0_verify),
		.R2(R2),
		.R3(R3),
		.ALUOp(ALUOp)
	);
	

	// Define clk signal for Verfication purpose
	always #5 clk = ~clk;	
	
	//random register input
	//always #200 assign {ALUOp, R3, R2} = {$random, $random, $random};
	
	//error flag
	assign error_flag = (R0 != R0_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			$display("Error occurs when R2 = %d, R3 = %d, ALUOp = %d\n", R2, R3, ALUOp);
		end
	
	initial begin
		// Initialize Inputs
		R2 = 0;
		R3 = 0;
		ALUOp = 0; //MOV function
		clk = 0;

		#100;
		R2 = 32'h12367485;
		R3 = 32'h42135262;
		
		#100;
		R2 = 32'h12367485;
		R3 = 32'h42135262;
		ALUOp = 3'b001; //NOT function
		
		#100;
		R2 = 32'h12367485;
		R3 = 32'h42135262;
		ALUOp = 3'b010; //ADD function
		
		#100;
		R2 = 32'h12367485;
		R3 = 32'h42135262;
		ALUOp = 3'b011; //SUB function
		
		#100;
		R2 = 32'h12367485;
		R3 = 32'h42135262;
		ALUOp = 3'b100; //OR function
		
		#100;
		R2 = 32'h12367485;
		R3 = 32'h42135262;
		ALUOp = 3'b101; //AND function
		

	end
      
endmodule

