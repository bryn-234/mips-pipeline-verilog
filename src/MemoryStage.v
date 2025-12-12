`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2025 10:54:03 PM
// Design Name: 
// Module Name: MemoryStage
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


module MemoryStage(
    //Inputs
    AddResult, 
    Zero, 
    ALUResult, 
    Rt,
    AddressSelected, 
    BranchLogicOp,
    SignBit, 
    Branch, 
    MemRead, 
    MemWrite, 
    MemToReg, 
    RegWrite, 
    BitSel,
    
    //Outputs
    MemoryRead_out, 
    ALUResult_out,
    AddressSelected_out,
    RegWrite_out, 
    MemToReg_out, 
    PCSrc, 
    
    //Clock
    Clk
);
                   
    input [31:0] AddResult, ALUResult, Rt;
    input [4:0] AddressSelected;
    input [2:0] BranchLogicOp;
    input [1:0] BitSel;       
    input SignBit, Zero, Branch, MemRead, MemWrite, MemToReg, RegWrite, Clk;        
    
    output reg [31:0] MemoryRead_out, ALUResult_out;
    output reg [4:0] AddressSelected_out;
    output reg RegWrite_out, MemToReg_out, PCSrc;
    
    wire [31:0] MemoryReadData;
    wire PCSrc_Out;
    
    DataMemory DM(
        .Address(ALUResult), 
        .WriteData(Rt), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(MemoryReadData), 
        .BitSel(BitSel)
    );
    
    BranchLogicInterpreter BLI(
        .Zero(Zero), 
        .SignBit(SignBit), 
        .BranchLogicOp(BranchLogicOp), 
        .Rt(AddressSelected[0]), 
        .Branch(Branch), 
        .Branch_out(PCSrc_Out)
    );
    
    always @(PCSrc_Out) begin
        PCSrc = PCSrc_Out;
    end
    
    always @(negedge Clk) begin
        ALUResult_out <= ALUResult;
        MemoryRead_out <= MemoryReadData;
        
        AddressSelected_out <= AddressSelected;
        
        RegWrite_out <= RegWrite;
        MemToReg_out <= MemToReg;
        
    end
endmodule
