`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, Shamt, HI, LO, ALUResult, Zero, SignBit);

    input [3:0] ALUControl;     // control bits for ALU operation
    input [31:0] A, B;          // inputs
    input [4:0] Shamt; // shift amount for sll and srl
    
    output reg [31:0] ALUResult; // 32-bit output result
    output reg [31:0] HI, LO;    // for mult (64-bit result)
    output reg Zero;             // high if ALUResult == 0
    output reg SignBit;          // MSB of ALUResult (sign)

    // Compute ALUResult
    always @(*) begin
        ALUResult = 0; HI = 0; LO = 0;
        case (ALUControl)
            4'd0: ALUResult = A + B;            // ADD
            4'd1: ALUResult = A - B;            // SUB
            4'd2: ALUResult = A & B;            // AND
            4'd3: ALUResult = A | B;            // OR
            4'd4: ALUResult = A ^ B;            // XOR
            4'd5: ALUResult = B << Shamt;       // SLL rd, rt (b), shamt
            4'd6: ALUResult = B >> Shamt;       // SRL rd, rt (b), shamt
            4'd7: ALUResult = (A < B) ? 32'd1 : 32'd0; // SLT
            4'd8: begin 
            {HI, LO} = A * B;           // MULT
            ALUResult = LO;
            end
            4'd9: ALUResult = ~(A | B); //NOR
            default: ALUResult = 32'd0;
        endcase
    end

    // Compute Zero and Sign flags
    always @(*) begin
        Zero = (ALUResult == 32'd0);
        SignBit = ALUResult[31];
    end

endmodule

