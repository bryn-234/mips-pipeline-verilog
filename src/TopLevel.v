`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Team Effort: Joseph (100%), Jonathan (100%), Bryn (100%)
//
// Create Date: 10/19/2025 11:06:22 PM
// Design Name: 
// Module Name: TopLevel
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


module TopLevel(Clk, Reset, out7, en_out);
    input Clk, Reset;
    
    output [6:0] out7;
    output [7:0] en_out;

    wire [31:0] debug_PCR, debug_wData;
    
    wire ClkOut;
    
   ClkDiv CLK(Clk, 1'b0, ClkOut);
    
    //**FETCH STAGE**//
    wire PCSrc;
    wire [31:0] Instruction_IF, PCAddResult_IF;
    
    //**DECODE STAGE**//
    wire RegWrite_D, Branch_D, RegDst_D, RegWrite1_D, MemWrite_D, MemRead_D, MemToReg_D, ZeroExtend_D;
    wire [4:0] WriteRegister_D, Rt_D, Rd_D;
    wire [31:0] ReadData1_D, ReadData2_D, SignExtension_D, PCAddResult_D, WriteData_D, instr_indx_D;
    wire [3:0] ALUOp_D;
    wire [2:0] BranchLogicOp_D;
    wire [1:0] BitSel_D, sel_D, ALUSrc_D;
    
    //**EXECUTE STAGE**//
    wire SignBit_E, Zero_E, Branch_E, RegWrite_E, MemWrite_E, MemRead_E, MemToReg_E;
    wire [31:0] ReadData1_E, ReadData2_E, ALUResult_E, Rt_E, instr_indx_E, AddResult_E;
    wire [4:0] RegDstAddress_E;
    wire [2:0] BranchLogicOp_E;
    wire [1:0] BitSel_E, sel_E;
    
    //**MEMORY STAGE**//
    wire [31:0] MemoryRead_M, ALUResult_M;
    wire [4:0] AddressSelected_M;
    wire RegWrite_M, MemToReg_M;      
       
    InstructionFetchStage IFS(
        //Inputs
        .sel(sel_D), 
        .PCSrc(PCSrc),
        .branchTarget(AddResult_E), 
        .jumpTarget(instr_indx_D),  
        .jrTarget(ReadData1_D),
        
        //Outputs 
        .Instruction_out(Instruction_IF), 
        .PCAddResult_out(PCAddResult_IF), 
        
        .debug_PCR(debug_PCR),
        
        //other inputs
        .Clk(ClkOut), 
        .Reset(Reset)
    );
    
    InstructionDecodeStage IDS(
        //Inputs
        .Instruction(Instruction_IF), 
        .PCAddResult(PCAddResult_IF), 
        .RegWrite(RegWrite_D),
        .WriteData(WriteData_D), 
        .WriteRegister(WriteRegister_D),
        
        //Outputs
        .ReadData1(ReadData1_D), 
        .ReadData2(ReadData2_D), 
        .SignExtension(SignExtension_D), 
        .PCAddResult_out(PCAddResult_D), 
        .instruction_indx(instr_indx_D),
        .Rt(Rt_D), 
        .Rd(Rd_D),
        .ALUSrc(ALUSrc_D), 
        .ALUOp(ALUOp_D), 
        .Branch(Branch_D), 
        .RegDst(RegDst_D), 
        .RegWrite1(RegWrite1_D),
        .MemWrite(MemWrite_D), 
        .MemRead(MemRead_D), 
        .MemToReg(MemToReg_D), 
        .BitSel(BitSel_D), 
        .BranchLogicOp(BranchLogicOp_D), 
        .sel_D(sel_D),
        
        .debug_wData(debug_wData),
        
        //clock
        .Clk(ClkOut)
    );
                                            
    ExecutionStage ES(
        //INPUTS
        .PCAddResult(PCAddResult_D), 
        .ReadData1(ReadData1_D), 
        .ReadData2(ReadData2_D), 
        .SignExtension(SignExtension_D),
        .Rt(Rt_D), 
        .Rd(Rd_D),
        .ALUSrc(ALUSrc_D), 
        .ALUOp(ALUOp_D), 
        .Branch(Branch_D), 
        .RegDst(RegDst_D), 
        .RegWrite(RegWrite1_D), 
        .MemWrite(MemWrite_D), 
        .MemRead(MemRead_D), 
        .MemToReg(MemToReg_D), 
        .BitSel(BitSel_D), 
        .BranchLogicOp(BranchLogicOp_D), 
        
        //OUTPUTS           
        .SignBit(SignBit_E), 
        .Zero(Zero_E), 
        .ALUResult(ALUResult_E), 
        .AddResult(AddResult_E), 
        .RegDstAddress(RegDstAddress_E), 
        .Rt_Out(Rt_E),
        .Branch_out(Branch_E), 
        .RegWrite_out(RegWrite_E), 
        .MemWrite_out(MemWrite_E), 
        .MemRead_out(MemRead_E), 
        .MemToReg_out(MemToReg_E),
        .BitSel_out(BitSel_E), 
        .BranchLogicOp_out(BranchLogicOp_E), 
        .ReadData2_out(ReadData2_E),
        
        //Clock
        .Clk(ClkOut)
    );
     
    MemoryStage MS(
        //INPPUTS
        .AddResult(AddResult_E), 
        .Zero(Zero_E), 
        .ALUResult(ALUResult_E), 
        .Rt(ReadData2_E),
        .AddressSelected(RegDstAddress_E), 
        .BranchLogicOp(BranchLogicOp_E),
        .SignBit(SignBit_E), 
        .Branch(Branch_E), 
        .MemRead(MemRead_E), 
        .MemWrite(MemWrite_E), 
        .MemToReg(MemToReg_E), 
        .RegWrite(RegWrite_E), 
        .BitSel(BitSel_E),
        
        //OUTPUTS               
        .MemoryRead_out(MemoryRead_M), 
        .ALUResult_out(ALUResult_M),
        .AddressSelected_out(AddressSelected_M),
        .RegWrite_out(RegWrite_M), 
        .MemToReg_out(MemToReg_M), 
        .PCSrc(PCSrc),
        
        //Clock
        .Clk(ClkOut)
    );
    
    WriteBackStage WB(
        //Inputs
        .ReadData(MemoryRead_M), 
        .ALUResult(ALUResult_M), 
        .Address(AddressSelected_M),
        .MemToReg(MemToReg_M), 
        .RegWrite(RegWrite_M),
                  
        //Outputs        
        .WriteData_out(WriteData_D), 
        .WriteRegister(WriteRegister_D),
        .RegWrite_out(RegWrite_D) 
    );
    
   // assign debug_wData = WriteData_D;
    
    Two4DigitDisplay TDD(Clk, debug_PCR[15:0], debug_wData[15:0], out7, en_out);
    
endmodule
