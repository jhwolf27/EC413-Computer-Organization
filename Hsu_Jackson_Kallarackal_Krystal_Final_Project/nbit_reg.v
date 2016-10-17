//n bit register

module nbit_reg(nD, nQ, Write, Reset, Clk);

parameter DATA_WIDTH = 32;
	
input [DATA_WIDTH-1:0] nD;
input Write;
input Reset;
input Clk;
output [DATA_WIDTH-1:0] nQ;

DFF DFFs[DATA_WIDTH-1:0] (nD, nQ, Write, Reset, Clk);

endmodule
