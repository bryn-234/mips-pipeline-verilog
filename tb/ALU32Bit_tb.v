`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [3:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs

	wire [31:0] ALUResult, HI, LO;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .HI(HI),
        .LO(LO),
        .ALUResult(ALUResult), 
        .Zero(Zero),
        .SignBit(SignBit)
    );

	initial begin
	
    /* Please fill in the implementation here... */
	#10
	A <= 32'd100;
	B <= 32'd101;
	
	#10
	ALUControl <= 4'b0000;
	
	#10
	ALUControl <= 4'b0001;
	
	#10
	ALUControl <= 4'b0010;
	
	#10
	ALUControl <= 4'b0011;
	
	#10
	ALUControl <= 4'b0100;
    
    #10
	ALUControl <= 4'b0101;
	B <= 32'd2;
	
	#10
	ALUControl <= 4'b0110;
	
	#10
	ALUControl <= 4'b0111;
	
	#10
	ALUControl <= 4'b1000;
	
	#10
	ALUControl <= 4'b1001;
	
	#10
	ALUControl <= 4'b0000;
	end

endmodule

