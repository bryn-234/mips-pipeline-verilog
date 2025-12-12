`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2025 01:10:54 PM
// Design Name: 
// Module Name: InstructionFetchUnit_tb
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


module InstructionFetchUnit_tb();

    wire [31:0] Instruction, PCAddResult;
    reg [31:0] Address;
    reg Reset, Clk;
    
    InstructionFetchUnit u0(
        .Instruction(Instruction), 
        .PCAddResult(PCAddResult),
        .Address(Address), 
        .Reset(Reset), 
        .Clk(Clk)
        );
        
    initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
    
    initial begin
        Address <= 0;
        
        @(posedge Clk)
        Reset <= 1'b1;
       
        @(posedge Clk)
        Reset <= 1'b0;
        
        @(posedge Clk)
        #5;
        Address <= PCAddResult;
        
        @(posedge Clk)
        #5;
        Address <= PCAddResult;
        
        @(posedge Clk)
        #5;
        Address <= PCAddResult;
        
        @(posedge Clk)
        #5;
        Address <= PCAddResult;
        
    end
    
endmodule
