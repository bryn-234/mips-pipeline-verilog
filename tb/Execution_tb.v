`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:50:31 AM
// Design Name: 
// Module Name: Execution_tb
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


module Execution_tb();

    reg [31:0] PCAddResult, ReadData1, ReadData2, ShiftedImm;
    reg [4:0] Rt, Rd;
    reg ALUSrc, Branch, RegDst, RegWrite, MemWrite, MemRead, MemToReg, ZeroExtend;
    reg [3:0] ALUOp;
    reg [1:0] BitSel, sel;
    reg [2:0] BranchLogicOp;
    reg Clk;
    
    wire SignBit, Zero;
    wire [31:0] ALUResult, AddResult;
    wire [4:0] RegDstAddress, Rt_Out;
    wire [1:0] BitSel_out, sel_E;
    wire [2:0] BranchLogicOp_out;
    wire Branch_out, RegWrite_out, MemWrite_out, MemRead_out, MemToReg_out;
    
    ExecutionStage ES(
    .PCAddResult(PCAddResult), 
    .ReadData1(ReadData1), 
    .ReadData2(ReadData2), 
    .ShiftedImm(ShiftedImm),
    .Rt(Rt), 
    .Rd(Rd),
    .ALUSrc(ALUSrc), 
    .ALUOp(ALUOp), 
    .Branch(Branch), 
    .RegDst(RegDst), 
    .RegWrite(RegWrite), 
    .MemWrite(MemWrite), 
    .MemRead(MemRead), 
    .MemToReg(MemToReg), 
    .ZeroExtend(ZeroExtend),
    .BitSel(BitSel),
    .BranchLogicOp(BranchLogicOp),
    .sel(sel),               
    .SignBit(SignBit), 
    .Zero(Zero), 
    .ALUResult(ALUResult), 
    .AddResult(AddResult), 
    .RegDstAddress(RegDstAddress), 
    .Rt_Out(Rt_Out),
    .Branch_out(Branch_out), 
    .RegWrite_out(RegWrite_out), 
    .MemWrite_out(MemWrite_out), 
    .MemRead_out(MemRead_out), 
    .MemToReg_out(MemToReg_out),
    .BitSel_out(BitSel_out), 
    .BranchLogicOp_out(BranchLogicOp_out), 
    .sel_E(sel_E),
    .Clk(Clk)
    );
    
    initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
	initial begin
	    PCAddResult <= 32'd0;
	    ReadData1 <= 32'd0;
	    ReadData2 <= 32'd0;
	    ShiftedImm <= 32'd0;
        Rt <= 5'd0; 
        Rd <= 5'd0;
        ALUSrc <= 0;
        Branch <= 0;
        RegDst <= 0;
        RegWrite <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 0;
        ALUOp <= 4'd0;
        ZeroExtend <= 0;
        BitSel <= 2'b00;
        sel <= 2'b00;
        BranchLogicOp <= 3'b000;
        
        @(posedge Clk) 
        PCAddResult <= 32'd4;
        ReadData1 <= 32'd5;
        ReadData2 <= 32'd7;
        ALUOp<= 4'd0;
        RegDst <= 1;
        ALUSrc <= 0;
	end
endmodule
