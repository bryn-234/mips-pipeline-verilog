`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:50:31 AM
// Design Name: 
// Module Name: WriteBack_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module WriteBack_tb();
    reg [31:0] ReadData, ALUResult;
    reg [4:0] Address;
    reg MemToReg, RegWrite, Clk;
    
    wire [31:0] WriteData_out; 
    wire [4:0] WriteRegister;
    wire RegWrite_out;
    
    WriteBackStage WBS(
    .ReadData(ReadData), 
    .ALUResult(ALUResult), 
    .Address(Address),
    .MemToReg(MemToReg), 
    .RegWrite(RegWrite),
    .WriteData_out(WriteData_out), 
    .WriteRegister(WriteRegister),
    .RegWrite_out(RegWrite_out), 
    .Clk(Clk)
    );
    
     initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
	initial begin
	    ReadData <= 32'd0;
	    ALUResult <= 32'd0;
        Address <= 5'd0;
        MemToReg <= 0;
        RegWrite <= 0;
	end
	
endmodule
