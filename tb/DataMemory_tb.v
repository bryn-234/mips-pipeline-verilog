`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;

    wire [31:0] ReadData;

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	   MemWrite <= 1;
	   
    /* Please fill in the implementation here... */
	   @(posedge Clk)
	   Address <= 32'd0;
	   WriteData <= 32'd0;
	   
	   @(posedge Clk)
	   Address <= 32'd4;
	   WriteData <= 32'd1;
	   
	   @(posedge Clk)
	   Address <= 32'd8;
	   WriteData <= 32'd2;
	   
	   @(posedge Clk)
	   Address <= 32'd12;
	   WriteData <= 32'd3;
	   
	   @(posedge Clk)
	   Address <= 32'd16;
	   WriteData <= 32'd4;
	   
	   #10
	   MemRead <= 1;
	   
	   @(posedge Clk)
	   #10
	   MemWrite <= 0;
	   Address <= 32'd32;
	   
	   @(posedge Clk)
	   Address <= 32'd16;
	   
	   @(posedge Clk)
	   Address <= 32'd12;
	   
	   @(posedge Clk)
	   Address <= 32'd8;
	   
	   @(posedge Clk)
	   #10
	   Address <= 32'd4;
	   
	   @(posedge Clk)
	   Address <= 32'd0;
	   
	   @(posedge Clk)
	   MemRead <= 0;
	   
	   @(posedge Clk)
	   Address <= 32'd4;
	end

endmodule

