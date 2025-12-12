`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team meber: 
// Bryn - 100% (or 33% if split between all of us)
// Jonathan - 100% (or 33% if split between all of us)
// Joseph - 100% (or 33% if split between all of us)

// ECE369A - Computer Architecture
// Laboratory 3 (PostLab)
// Module - InstructionFetchUnit.v
// Description - Fetches the instruction from the instruction memory based on 
//               the program counter (PC) value.
// INPUTS:-
// Reset: 1-Bit input signal. 
// Clk: Input clock signal.
//
// OUTPUTS:-
// Instruction: 32-Bit output instruction from the instruction memory. 
//              Decimal value diplayed 
// PCResult: 32-Bit output PCResult from the program counter. 
//              Decimal value diplayed 
// FUNCTIONALITY:-
// Please connect up the following implemented modules to create this
// 'InstructionFetchUnit':-
//   (a) ProgramCounter.v
//   (b) PCAdder.v
//   (c) InstructionMemory.v
// Connect the modules together in a testbench so that the instruction memory
// outputs the contents of the next instruction indicated by the memory location
// in the PC at every clock cycle. Please initialize the instruction memory with
// some preliminary values for debugging purposes.
//
// @@ The 'Reset' input control signal is connected to the program counter (PC) 
// register which initializes the unit to output the first instruction in 
// instruction memory.
// @@ The 'Instruction' output port holds the output value from the instruction
// memory module.
// @@ The 'Clk' input signal is connected to the program counter (PC) register 
// which generates a continuous clock pulse into the module.
////////////////////////////////////////////////////////////////////////////////

module InstructionFetchUnit(Instruction, PCAddResult, debug_PCR, Address, Reset, Clk);

    /* Please fill in the implementation here... */
    input Clk, Reset;
    input [31:0] Address;
    
    output [31:0] PCAddResult;
    output [31:0] Instruction;
    output [31:0] debug_PCR;
    
    wire [31:0] PCResult;
    PCAdder PCAdder_1(PCResult, PCAddResult);
    
    ProgramCounter ProgramCounter_1(Address, PCResult, debug_PCR, Reset, Clk);
    
    InstructionMemory InstructionMemory_1(PCResult, Instruction);
    
endmodule

