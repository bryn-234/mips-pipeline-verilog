`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2025 02:08:07 PM
// Design Name: 
// Module Name: Controller
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


module Controller(OPCode, Func, ALUSrc, RegWrite, ALUOp, RegDst, Branch, MemWrite, MemRead, MemToReg, ZeroExtend, BranchLogicOp, BitSel, sel, jal);

    input [5:0] OPCode, Func;
    
    output reg [1:0] BitSel, sel, ALUSrc;
    output reg [2:0] BranchLogicOp;
    output reg [3:0] ALUOp;
    output reg  RegDst, Branch, MemWrite, MemRead, MemToReg, RegWrite, ZeroExtend, jal; 

    always @(OPCode, Func) begin
    
        case(OPCode)
        //Add, Subtract, jr, and, or, nor, xor, sll, srl, slt
            6'b000000: begin
                //R-type
                //Signals we care about
                ALUSrc = 2'd0;
                RegDst = 1;
                MemToReg = 1;
                RegWrite = 1;
                sel = 2'b00;
                
                //Signals we dont care about
                ZeroExtend = 0;
                Branch = 0;
                MemWrite = 0;
                MemRead = 0;
                BranchLogicOp = 2'd0;
                BitSel = 2'd0;
                jal = 0;
                
                //Function
                case (Func)
                  6'b100000: begin ALUOp = 4'd0;          end // ADD
                  6'b100010: begin ALUOp = 4'd1;          end // SUB
                  6'b100100: begin ALUOp = 4'd2;          end // AND
                  6'b100101: begin ALUOp = 4'd3;          end // OR
                  6'b100110: begin ALUOp = 4'd4;          end // XOR
                  6'b000000: begin ALUOp = 4'd5;          end // SLL
                  6'b000010: begin ALUOp = 4'd6;          end // SRL
                  6'b101010: begin ALUOp = 4'd7;          end // SLT
                  6'b100111: begin ALUOp = 4'd9;          end // NOR
                  6'b001000: begin // jr
                    ALUOp = 4'd0; 
                    RegWrite = 0;   
                    sel = 2'b10;      
                  end 
                  default:   begin ALUOp = 4'd0;          end // defaults to add
                  endcase 
            end
                
            6'b001000: begin //Addi
                //Signals we care about
                ALUOp = 4'd0; //Add
                ALUSrc = 2'd1;
                RegDst = 0;
                MemToReg = 1;
                RegWrite = 1;
                
                //Signals we dont care about
                BranchLogicOp = 2'd0;
                BitSel = 2'd0;
                sel = 2'b00;
                ZeroExtend =0;
                Branch = 0;
                MemWrite = 0;
                MemRead = 0;
                jal = 0;
                
            end
            
            6'b011100: begin //Mul
                //Signals we care about
                ALUOp = 4'd8;
                ALUSrc = 2'd0;
                RegDst = 1;
                MemToReg = 1;
                RegWrite = 1;
                
                //Signals we dont care about
                BranchLogicOp = 2'd0;
                BitSel = 2'd0;
                sel = 2'b00;
                Branch = 0;
                MemWrite = 0;
                MemRead = 0;
                ZeroExtend =0;
                jal = 0;
                
            end
            
             6'b100011: begin //LW
                //Signals we care about
                BitSel = 2'b00; //load word!
                ALUOp = 4'd0; //ADD
                ALUSrc = 2'd1;
                RegDst = 0;
                MemWrite = 0;
                MemRead = 1;
                MemToReg = 0;
                RegWrite = 1;
                
                //Signals we dont care about
                BranchLogicOp = 2'd0;
                sel = 2'b00;
                Branch = 0;
                ZeroExtend =0;
                jal = 0;
                
            end
            
            6'b101011: begin //SW
                //Signals we care about
                BitSel = 2'b00; //save word
                ALUOp = 4'd0; //ADD
                ALUSrc = 2'd1;
                RegDst = 0; 
                MemWrite = 1;
                MemRead = 0;
                
                //Signals we dont care about
                BranchLogicOp = 2'd0;
                sel = 2'b00;
                ZeroExtend =0;
                Branch = 0;
                RegWrite = 0;
                MemToReg = 0;
                jal = 0;
                
            end
            
            6'b101000: begin //SB
                //Signals we care about
                BitSel = 2'b10; //save byte
                ALUOp = 4'd0; //ADD
                ALUSrc = 2'd1;
                RegDst = 0; 
                MemWrite = 1;
                MemRead = 0;
                
                //Signals we dont care about
                BranchLogicOp = 2'd0;
                sel = 2'b00;
                MemToReg = 1;
                RegWrite = 0;
                ZeroExtend =0;
                Branch = 0;
                jal = 0;
                
            end
                
            6'b100001: begin //LH
                //Signals we care about
                BitSel = 2'b01; //load half!
                ALUOp = 4'd0; //ADD
                ALUSrc = 2'd1;
                RegDst = 0;
                MemWrite = 0;
                MemRead = 1;
                MemToReg = 0;
                RegWrite = 1;
                
                
                //Signals we dont care about
                BranchLogicOp = 2'd0;
                sel = 2'b00;
                ZeroExtend =0;
                Branch = 0;
                jal = 0;
                
            end
                
            6'b100000: begin //LB
                //Signals we care about
                BitSel = 2'b10; //load byte
                ALUOp = 4'd0; //ADD
                ALUSrc = 2'd1;
                RegDst = 0;
                MemWrite = 0;
                MemRead = 1;
                MemToReg = 0;
                RegWrite = 1;

                //Signals we dont care about
                BranchLogicOp = 2'd0;
                sel = 2'b00;
                Branch = 0;
                ZeroExtend =0;
                jal = 0;
                
            end
            
            6'b101001: begin //SH
                //Signals we care about
                BitSel = 2'b01; //save half
                ALUOp = 4'd0; //ADD
                ALUSrc = 2'd1;
                RegDst = 0; 
                MemWrite = 1;
                MemRead = 0;
                
                //Signals we dont care about
                BranchLogicOp = 2'd0;
                sel = 2'b00;
                RegWrite = 0;
                ZeroExtend =0;
                Branch = 0;
                MemToReg = 1;
                jal = 0;
                
            end
            
             6'b000100: begin //BEQ
                //Signals we care about
                BranchLogicOp = 3'd0;
                sel = 2'b00;
                ALUOp = 4'd1; //Sub
                ALUSrc = 2'd0;
                Branch = 1;
                
                //Signals we dont care about
                BitSel = 2'd0;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                RegWrite = 0;
                ZeroExtend =0;
                RegDst = 0;
                jal = 0;
            end
            
             6'b000101: begin //BNE
                //Signals we care about
                BranchLogicOp = 3'd1;
                sel = 2'b00;
                ALUOp = 4'd1; //sub
                ALUSrc = 2'd0;
                Branch = 1;
                
                //Signals we dont care about
                BitSel = 2'd0;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                RegWrite = 0;
                ZeroExtend =0;
                RegDst = 0;
                jal = 0;
            end
            
            6'b000001: begin //BLTZ, BGEZ
                //Signals we care about\
                BranchLogicOp = 3'd4;
                ALUOp = 4'd1; //Sub
                ALUSrc = 2'd2;
                Branch = 1;
                sel = 2'b00;
                
                //Signals we dont care about
                BitSel = 2'd0;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                RegWrite = 0;
                ZeroExtend = 0;
                RegDst = 0;
                jal = 0;
            end
            
             6'b000111: begin //BGTZ
                //Signals we care about
                BranchLogicOp = 3'd2;
                ALUOp = 4'd1; //sub
                ALUSrc = 2'd2;
                Branch = 1;
                sel = 2'b00;
                               
                //Signals we dont care about
                BitSel = 2'd0;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                RegWrite = 0;
                ZeroExtend =0;
                RegDst = 0;
                jal = 0;
            end
                
             6'b000110: begin //BLEZ
                //Signals we care about
                BranchLogicOp = 3'd3;
                ALUOp = 4'd1; //sub
                ALUSrc = 2'd2;
                Branch = 1;
                sel = 2'b00;
                
                //Signals we dont care about
                BitSel = 2'd0;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                RegWrite = 0;
                ZeroExtend =0;
                RegDst = 0;
                jal = 0;
            end
            
             6'b000010: begin //J
                //Signals we care about
                sel = 2'b01;

                //Signals we dont care about
                ALUOp = 4'd0;
                BranchLogicOp = 2'd0;
                BitSel = 2'd0;
                Branch = 0;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                RegWrite = 0;
                ZeroExtend =0;
                ALUSrc = 2'd0;
                RegDst = 0;
                jal = 0;
            end
            
             6'b000011: begin //jal
                //Signals we care about
                ALUOp = 4'd0;
                sel = 2'b01;
                ALUSrc = 2'd0;
                RegDst = 0;
                RegWrite = 1;
                ZeroExtend =0;
                jal = 1;
                
                //Signals we dont care about
                BranchLogicOp = 2'd0;
                BitSel = 2'd0;
                Branch = 0;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
            end
            
             6'b001100: begin //ANDI
                //Signals we care about
                ALUOp = 4'd2;
                ALUSrc = 2'd1;
                RegDst = 0;
                MemToReg = 1;
                RegWrite = 1;
                ZeroExtend =1;
                
                //Signals we dont care about
                BranchLogicOp = 2'd0;
                BitSel = 2'd0;
                sel = 2'b00;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
                jal = 0;
            end
            
             6'b001101: begin //ORI
                //Signals we care about
                ALUOp = 4'd3;
                ALUSrc = 2'd1;
                RegDst = 0;
                MemToReg = 1;
                RegWrite = 1;
                ZeroExtend =1;
                
                //Signals we dont care about
                BranchLogicOp = 2'd0;
                BitSel = 2'd0;
                sel = 2'b00;
                Branch = 0;
                MemWrite = 0;
                MemRead = 0;
                jal = 0;
            end
            
             6'b001110: begin //XORI
                //Signals we care about
                ALUOp = 4'd4;
                ALUSrc = 2'd1;
                RegDst = 0;
                MemToReg = 1;
                RegWrite = 1;
                ZeroExtend =1;
                
                //Signals we dont care about
                BranchLogicOp = 2'd0;
                BitSel = 2'd0;
                sel = 2'b00;
                Branch = 0;
                MemWrite = 0;
                MemRead = 0;
                jal = 0;
            end
            
             6'b001010: begin //SLTI
                //Signals we care about
                ALUOp = 4'd7;
                ALUSrc = 2'd1;
                RegDst = 0;
                MemToReg = 1;
                RegWrite = 1;
                
                //Signals we don't care about
                BranchLogicOp = 2'd0;
                BitSel = 2'd0;
                sel = 2'b00;
                Branch = 0;
                MemWrite = 0;
                MemRead = 0;
                ZeroExtend =0;
                jal = 0;
            end
            
            default begin //Signals we care about
                ALUSrc = 2'd0;
                RegDst = 1;
                MemToReg = 1;
                RegWrite = 1;
                sel = 2'b00;
                
                //Signals we dont care about
                ZeroExtend =0;
                Branch = 0;
                MemWrite = 0;
                MemRead = 0;
                BranchLogicOp = 2'd0;
                BitSel = 2'd0;
                ALUOp = 4'd0; 
                RegWrite = 0;   
                sel = 2'b00; 
                jal = 0;
                end
            
        endcase
    end
endmodule
