`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:50:31 AM
// Design Name: 
// Module Name: InstructionFetchStage_tb
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


module InstructionFetchStage_tb();
    
    reg PCSrc, Clk, Reset;
    reg [1:0] sel;
    reg [31:0] branchTarget, jumpTarget, jrTarget;
    
    wire [31:0] Instruction_out, PCAddResult_out; 
    
    
    InstructionFetchStage IFS(
        .sel(sel), 
        .PCSrc(PCSrc), 
        .branchTarget(branchTarget), 
        .jumpTarget(jumpTarget), 
        .jrTarget(jrTarget), 
        .Instruction_out(Instruction_out), 
        .PCAddResult_out(PCAddResult_out), 
        .Clk(Clk), 
        .Reset(Reset)
        );
   
   initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
	initial begin 
	   Reset <= 1;
	   PCSrc <= 0;
	   sel <= 2'b00;
	   branchTarget <= 32'd0;
	   jumpTarget <= 32'd0;
	   jrTarget <= 32'd0;
	   
	   @(posedge Clk)
	   #10;
	   Reset <= 0;
	   @(posedge Clk)
	   
	   @(posedge Clk)
	   #20
	   Reset <= 0;
	   
	end
endmodule
