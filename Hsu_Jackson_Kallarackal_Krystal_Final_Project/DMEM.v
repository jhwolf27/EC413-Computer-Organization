// DMEM

module DMEM(WriteData,   // Input data into the memory
            MemData,     // Output data from the memory
            Address,     // Address of data to be read/written
            MemWrite,    // When high, causes write to take place on posedge
            Clk);        // Clock

parameter ADDRESS_WIDTH = 16;
parameter DATA_WIDTH = 32;

//-------------Input Ports-----------------------------
input [DATA_WIDTH-1:0]       WriteData;
input [ADDRESS_WIDTH-1:0]    Address;
input MemWrite;
input Clk;
//-------------Output Ports----------------------------
output [DATA_WIDTH-1:0] MemData;
//-------------Wires-----------------------------------
//-------------Other-----------------------------------
reg [DATA_WIDTH-1:0] mem_contents [ADDRESS_WIDTH-1:0];
integer i;
//------------Code Starts Here-------------------------

assign MemData= mem_contents[Address];

always @(posedge Clk)
begin
    if(MemWrite)
    begin
        mem_contents[Address]<= #5 WriteData;
    end
end

endmodule
