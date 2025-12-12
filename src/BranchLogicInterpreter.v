`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 11:22:51 AM
// Design Name: 
// Module Name: BranchLogicInterpreter
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


module BranchLogicInterpreter(Zero, SignBit, BranchLogicOp, Rt, Branch, Branch_out);

    input Zero, SignBit, Rt, Branch;
    input [2:0] BranchLogicOp;
    
    output reg Branch_out;
    
    always @(*) begin
         
         if(Branch) begin
             case (BranchLogicOp)
             
                3'd0: begin //BEQ
                    Branch_out = (Zero) ? 1:0;
                end
                    
                3'd1: begin //BNE
                    Branch_out = (!Zero) ? 1:0;
                end
                
                3'd2: begin //Bgtz
                    Branch_out = (!Zero && !SignBit) ? 1:0;
                end
                
                3'd3: begin //Blez
                    Branch_out = (Zero || SignBit) ? 1:0;
                end
                
                3'd4: begin //Bltz & Bgez
                
                    case(Rt) 
                        1'b0: begin //Bltz
                            Branch_out = (!Zero && SignBit) ? 1:0;
                        end
                        
                        1'b1: begin //Bgez
                            Branch_out = (Zero || !SignBit) ? 1:0;
                        end
                    endcase
                end
                
                endcase
        end
        else begin
            Branch_out = 0;
        end
    end
endmodule
