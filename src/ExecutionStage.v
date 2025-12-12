`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2025 10:54:03 PM
// Design Name: 
// Module Name: ExecutionStage
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


module ExecutionStage(
    //Inputs
    PCAddResult, 
    ReadData1, 
    ReadData2, 
    SignExtension,
    Rt, 
    Rd,
    ALUSrc, 
    ALUOp, 
    Branch, 
    RegDst, 
    RegWrite, 
    MemWrite, 
    MemRead, 
    MemToReg, 
    BitSel, 
    BranchLogicOp, 
    
    //Outputs
    SignBit, 
    Zero, 
    ALUResult, 
    AddResult, 
    RegDstAddress, 
    Rt_Out,
    Branch_out, 
    RegWrite_out, 
    MemWrite_out, 
    MemRead_out, 
    MemToReg_out, 
    BitSel_out, 
    BranchLogicOp_out, 
    ReadData2_out,
    
    //Clock
    Clk
);
                      
    input [31:0] PCAddResult, ReadData1, ReadData2, SignExtension;
    input [4:0] Rt, Rd;
    input [3:0] ALUOp;
    input [2:0] BranchLogicOp;
    input [1:0] BitSel, ALUSrc;
    input Branch, RegDst, RegWrite, MemWrite, MemRead, MemToReg, Clk;
    
    output reg [31:0] ALUResult, AddResult, Rt_Out, ReadData2_out;
    output reg [4:0] RegDstAddress;
    output reg [2:0] BranchLogicOp_out;
    output reg [1:0] BitSel_out;
    output reg SignBit, Zero, Branch_out, RegWrite_out, MemWrite_out, MemRead_out, MemToReg_out;
    
    wire [31:0] ALUResult_t, ALUSrc_out, shifted, ShiftedPlusAdded, HI, LO;
    wire [4:0] RegDstAddress_t;
    wire Zero_t, SignBit_t;
    
    
    //ALUSrc Mux
    Mux32Bit3To1 ALUSrcMux(
        .out(ALUSrc_out), 
        .inA(SignExtension), 
        .inB(ReadData2), 
        .sel(ALUSrc)
    );
    
    //ALU
    ALU32Bit ALU(
        .ALUControl(ALUOp), 
        .A(ReadData1), 
        .B(ALUSrc_out), 
        .Shamt(SignExtension[10:6]), 
        .HI(HI), 
        .LO(LO), 
        .ALUResult(ALUResult_t), 
        .Zero(Zero_t), 
        .SignBit(SignBit_t)
    );
    
    //Shifter
    assign shifted = SignExtension << 2;
    
    //Adder
    assign ShiftedPlusAdded = shifted + PCAddResult;
    
    //RegDst Mux
    Mux5Bit2To1 RegDstMux(
        .out(RegDstAddress_t), 
        .inA(Rd), 
        .inB(Rt), 
        .sel(RegDst)
    );
               
    always @(posedge Clk) begin
        
        ReadData2_out <= ReadData2;
        ALUResult <= ALUResult_t;
        AddResult <= ShiftedPlusAdded;
        RegDstAddress <= RegDstAddress_t;
        
        Rt_Out <= Rt;
        Zero <= Zero_t;
        SignBit <= SignBit_t;
        Branch_out <= Branch;
        BitSel_out <= BitSel;
        BranchLogicOp_out <= BranchLogicOp;
        RegWrite_out <= RegWrite;
        MemWrite_out <= MemWrite;
        MemRead_out <= MemRead;
        MemToReg_out <= MemToReg;
        
    end
endmodule
