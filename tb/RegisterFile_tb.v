`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;


	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    /* Please fill in the implementation here... */
	   @(posedge Clk)
	   ReadRegister1 <= 32'd20;
	   ReadRegister2 <= 32'd24;
	   WriteRegister <= 1'b0;
	   WriteData <= 32'd0;
	   
	   @(posedge Clk)
	   RegWrite <= 1'b1;
	   
	   @(posedge Clk)
	   RegWrite <= 1'b0;
	   ReadRegister1 <= 32'd0;
	   
	   @(posedge Clk)
	   RegWrite <= 1'b1;
	   WriteRegister <= 32'd1;
	   WriteData <= 32'd1;
	   
	   @(posedge Clk)
	   WriteRegister <= 32'd2;
	   WriteData <= 32'd2;
	   
	   @(posedge Clk)
	   WriteRegister <= 32'd3;
	   WriteData <= 32'd3;
	   
	   @(posedge Clk)
	   WriteRegister <= 32'd31;
	   WriteData <= 32'd1056;
	   
	   @(posedge Clk)
	   RegWrite <= 1'b0;
	   ReadRegister1 <= 32'd1;
	   ReadRegister2 <= 32'd2;
	   
	   @(posedge Clk)
	   ReadRegister1 <= 32'd3;
	   ReadRegister2 <= 32'd31;
	   
	end

endmodule
