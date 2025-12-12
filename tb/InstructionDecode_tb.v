`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:50:31 AM
// Design Name: 
// Module Name: InstructionDecode_tb
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


module InstructionDecode_tb();
    
    reg Clk, RegWrite;
    reg [31:0] Instruction, PCAddResult, WriteData;
    reg [4:0] WriteRegister;
    
    wire [31:0] ReadData1, ReadData2, SignExtension, PCAddResult_out, instruction_indx;
    wire [4:0] Rt, Rd;
    wire ALUSrc;
    wire [3:0] ALUOp; 
    wire [2:0] BranchLogicOp;
    wire Branch, RegDst, RegWrite1, MemWrite, MemRead, MemToReg;
    wire [1:0] BitSel, sel_D;
    
    InstructionDecodeStage IDS(
        .Instruction(Instruction), 
        .PCAddResult(PCAddResult), 
        .RegWrite(RegWrite), 
        .WriteData(WriteData), 
        .WriteRegister(WriteRegister),
        .ReadData1(ReadData1), 
        .ReadData2(ReadData2), 
        .SignExtension(SignExtension), 
        .PCAddResult_out(PCAddResult_out), 
        .instruction_indx(instruction_indx),
        .Rt(Rt), 
        .Rd(Rd),
        .ALUSrc(ALUSrc), 
        .ALUOp(ALUOp), 
        .Branch(Branch), 
        .RegDst(RegDst), 
        .RegWrite1(RegWrite1), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .MemToReg(MemToReg), 
        .BitSel(BitSel), 
        .BranchLogicOp(BranchLogicOp), 
        .sel_D(sel_D),
        .Clk(Clk)
        );
    
    initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
	initial begin
        RegWrite <= 0;
        Instruction <= 32'd0;
        PCAddResult <= 32'd1;
        WriteData <= 32'd2;
        WriteRegister <= 5'b0;
        
        @(posedge Clk) 
        Instruction <= 32'h20080005;
        
        @(posedge Clk) Instruction <= 32'h20080005;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h20090003;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h01095020;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h01095822;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h71096002;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h340d0000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'hada80000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h8db00000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'ha1a90004;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h81b10004;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'ha5aa0006;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h85b20006;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h01097024;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h01097825;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h0109c027;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h0109c826;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h31ce0007;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h35ef0002;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h3b390001;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00099880;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h0013a042;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h0128a82a;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h2916000a;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h20080002;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h0501000b;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h20080000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h1108000b;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h20090009;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h1509000b;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h200a000a;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h1d00000b;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h200b000b;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h1920000b;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h200c000c;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h0520000b;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h200d000d;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h080000de;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h0c0000ea;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h200e000e;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h03e00008;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h08000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;
        @(posedge Clk) Instruction <= 32'h00000000;

end
    
    
endmodule
