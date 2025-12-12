`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2025 10:54:03 PM
// Design Name: 
// Module Name: InstructionDecodeStage
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


module InstructionDecodeStage(
    //Inputs
    Instruction, 
    PCAddResult, 
    RegWrite, 
    WriteData, 
    WriteRegister,
    
    //Outputs
    ReadData1, 
    ReadData2, 
    SignExtension, 
    PCAddResult_out, 
    instruction_indx,
    Rt, 
    Rd,
    ALUSrc, 
    ALUOp, 
    Branch, 
    RegDst, 
    RegWrite1, 
    MemWrite, 
    MemRead, 
    MemToReg, 
    BitSel, 
    BranchLogicOp, 
    sel_D,
    
    debug_wData,
    
    //Clock
    Clk
);
                              
    input [31:0] Instruction, PCAddResult, WriteData;
    input [4:0] WriteRegister;
    input RegWrite, Clk;
    
    output reg [31:0] ReadData1, ReadData2, SignExtension, PCAddResult_out, instruction_indx;
    output reg [4:0] Rt, Rd;
    output reg [3:0] ALUOp;
    output reg [2:0] BranchLogicOp; 
    output reg [1:0] BitSel, sel_D, ALUSrc;
    output reg Branch, RegDst, RegWrite1, MemWrite, MemRead, MemToReg;
    
    output [31:0] debug_wData;
    
    wire [31:0]SignExtension_t, ReadData1_out, ReadData2_out, jalAddress;
    (* mark_debug = "true" *) wire [31:0] wData;
    wire [4:0] wAddress;
    wire [3:0] ALUOp_t;
    wire [2:0] BranchLogicOp_t;
    wire [1:0] BitSel_t, sel_t, ALUSrc_t;
    wire RegWriteOut, Branch_t, RegDst_t, RegWrite1_t, MemWrite_t, MemRead_t, MemToReg_t, ZeroExtend, jal;
    
    SignExtension SE(
        .in(Instruction[15:0]), 
        .ZeroExtend(ZeroExtend), 
        .out(SignExtension_t)
    ); 
    
    Controller controller(
        //Input
        .OPCode(Instruction[31:26]),
        .Func(Instruction[5:0]),
        
        //Outputs        
        .ALUSrc(ALUSrc_t), 
        .RegWrite(RegWrite1_t), 
        .ALUOp(ALUOp_t), 
        .RegDst(RegDst_t), 
        .Branch(Branch_t), 
        .MemWrite(MemWrite_t), 
        .MemRead(MemRead_t), 
        .MemToReg(MemToReg_t),
        .ZeroExtend(ZeroExtend),
        .BranchLogicOp(BranchLogicOp_t),
        .BitSel(BitSel_t),
        .sel(sel_t),
        .jal(jal)
    );
    
    assign RegWriteOut = RegWrite || jal;
    
    RegisterFile Register(
        //Inputs
        .ReadRegister1(Instruction[25:21]), 
        .ReadRegister2(Instruction[20:16]), 
        .WriteRegister(wAddress), 
        .WriteData(wData), 
        .RegWrite(RegWriteOut),
        
        //Clock
        .Clk(Clk),
        
        //Outputs
        .ReadData1(ReadData1_out),
        .ReadData2(ReadData2_out)
    );
    
    assign jalAddress = PCAddResult + 4;
    
    Mux32Bit2To1 writeDataMux(
        .out(wData),
        .inA(jalAddress),
        .inB(WriteData),
        .sel(jal)
    );
    
    Mux5Bit2To1 writeAddressMux(
        .out(wAddress),
        .inA(5'd31),
        .inB(WriteRegister),
        .sel(jal)
    );
    
    always @(posedge Clk) begin
        PCAddResult_out <= PCAddResult;
        SignExtension <= SignExtension_t;
        Rt <= Instruction[20:16];
        Rd <= Instruction[15:11];
        ReadData1 <= ReadData1_out;
        ReadData2 <= ReadData2_out;
        sel_D <= sel_t;
        instruction_indx <= {PCAddResult[31:28], Instruction[25:0] << 2};
        
        ALUSrc <= ALUSrc_t;
        Branch <= Branch_t;
        RegDst <= RegDst_t;
        RegWrite1 <= RegWrite1_t;
        MemWrite <= MemWrite_t;
        MemRead <= MemRead_t;
        MemToReg <= MemToReg_t;
        BitSel <= BitSel_t;
        ALUOp <= ALUOp_t;
        BranchLogicOp <= BranchLogicOp_t;
        
    end
    
    assign debug_wData = wData;

endmodule
