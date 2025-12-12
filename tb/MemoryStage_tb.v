`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:50:31 AM
// Design Name: 
// Module Name: MemoryStage_tb
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


module MemoryStage_tb();

    reg [31:0] AddResult, ALUResult, Rt;
    reg Zero, SignBit, Branch, MemRead, MemWrite, MemToReg, RegWrite, Clk;
    reg [4:0] AddressSelected;
    reg [2:0] BranchLogicOp;
    reg [1:0] BitSel;
    
    wire RegWrite_out, MemToReg_out, PCSrc;
    wire [4:0] AddressSelected_out;
    wire [31:0] ALUResult_out, MemoryRead_out;
    
    MemoryStage MS(
        .AddResult(AddResult), 
        .Zero(Zero), 
        .ALUResult(ALUResult), 
        .Rt(Rt),
        .AddressSelected(AddressSelected), 
        .BranchLogicOp(BranchLogicOp),
        .SignBit(SignBit), 
        .Branch(Branch), 
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .MemToReg(MemToReg), 
        .RegWrite(RegWrite),
        .BitSel(BitSel),
        .MemoryRead_out(MemoryRead_out), 
        .ALUResult_out(ALUResult_out),
        .AddressSelected_out(AddressSelected_out),
        .RegWrite_out(RegWrite_out), 
        .MemToReg_out(MemToReg_out), 
        .PCSrc(PCSrc),
        .Clk(Clk)
        );
        
        initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
	initial begin
	    AddResult <= 32'd0; 
	    ALUResult <= 32'd0;
	    Rt <= 32'd0;
        Zero <= 0;
        SignBit <= 0;
        Branch <= 0;
        MemRead <= 0; 
        MemWrite <= 0;
        MemToReg <= 0; 
        RegWrite <= 0; 
        AddressSelected <= 5'd0;
        BranchLogicOp <= 3'd0;
        BitSel <= 2'b00;
        
	end
endmodule
