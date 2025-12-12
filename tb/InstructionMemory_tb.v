`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 
// Module - InstructionMemory_tb.v
// Description - Test the 'InstructionMemory_tb.v' module.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb(); 

    wire [31:0] Instruction;

    reg [31:0] Address;

	InstructionMemory u0(
		.Address(Address),
        .Instruction(Instruction)
	);

	initial begin
	
    /* Please fill in the implementation here... */
	   #10
	   Address <= 32'd100;
	   
	   #10
	   Address <= 32'd50;
	   
	   #10
	   Address <= 32'd128;
	   
	   #10
	   Address <= 32'd23;
	   
	end

endmodule

