`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 12:08:44 PM
// Design Name: 
// Module Name: BranchLogicInterpreter_tb
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


module BranchLogicInterpreter_tb();

    reg Zero, SignBit, Rt, Branch;
    reg [2:0] BranchLogicOp;
    
    wire Branch_out;
    
    BranchLogicInterpreter BLI(
        .Zero(Zero), 
        .SignBit(SignBit), 
        .BranchLogicOp(BranchLogicOp), 
        .Rt(Rt), 
        .Branch(Branch), 
        .Branch_out(Branch_out)
    );
                          
                          
    initial begin
        Zero <= 0;
        SignBit <= 0;
        Rt <= 0;
        Branch <= 1;
        BranchLogicOp <= 3'd0;
        
        #10
        Zero <= 1;
        SignBit <= 0;
        Rt <= 0;
        
        #10
        BranchLogicOp <= 3'd1;
        
        #10
        Zero <= 0;
        SignBit <= 0;
        Rt <= 0;
        
        #10
        BranchLogicOp <= 3'd2;
        
        #10
        Zero <= 0;
        SignBit <= 0;
        Rt <= 0;
        
        #10
        BranchLogicOp <= 3'd3;
        
        #10
        Zero <= 0;
        SignBit <= 1;
        Rt <= 0;
        
        #10
        BranchLogicOp <= 3'd4;
        
        #10
        Rt <= 1;
        Zero <= 1;
        SignBit <= 1;
        
    end      
endmodule
