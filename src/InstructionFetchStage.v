`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2025 10:54:03 PM
// Design Name: 
// Module Name: InstructionFetchStage
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


module InstructionFetchStage(
    //Inputs
    sel, 
    PCSrc, 
    branchTarget, 
    jumpTarget, 
    jrTarget, 
    
    //Outputs
    Instruction_out,
    PCAddResult_out, 
    
    debug_PCR,
    
    //Clock / reset
    Clk, 
    Reset
);

    input Reset, Clk, PCSrc;
    input [31:0] jrTarget, jumpTarget, branchTarget;
    input [1:0] sel;
    
    output reg [31:0] Instruction_out, PCAddResult_out;
    output [31:0] debug_PCR;
    
    wire [31:0] PCAddResult, Instruction, out, addressNormal;
    
    Mux32Bit2To1 Mux(
        .out(addressNormal), 
        .inA(branchTarget),  
        .inB(PCAddResult), 
        .sel(PCSrc)
    );
    
    MuxToPC MPC(
        .out(out), 
        .normalAddress(addressNormal), 
        .jumpRegister(jrTarget), 
        .jumpTarget(jumpTarget), 
        .sel(sel)
    );
    
    InstructionFetchUnit IFT(
        .Instruction(Instruction), 
        .PCAddResult(PCAddResult), 
        
        .debug_PCR(debug_PCR),
        
        .Address(out), 
        .Reset(Reset), 
        .Clk(Clk)
     );
    
    always @(posedge Clk) begin
        Instruction_out <= Instruction;
        PCAddResult_out <= PCAddResult;
    end
    
endmodule
