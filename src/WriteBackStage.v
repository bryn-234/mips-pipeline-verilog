`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2025 10:54:03 PM
// Design Name: 
// Module Name: WriteBackStage
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


module WriteBackStage(
    //Inputs
    ReadData, 
    ALUResult, 
    Address,
    MemToReg, 
    RegWrite,
    
    //Outputs
    WriteData_out, 
    WriteRegister,
    RegWrite_out 
);
                      
    input [31:0] ReadData, ALUResult;
    input [4:0] Address;
    input MemToReg, RegWrite;
    
    output reg [31:0] WriteData_out; 
    output reg [4:0] WriteRegister;
    output reg RegWrite_out;
    
    wire [31:0] WriteData;
    
    Mux32Bit2To1 MemToRegMux(
        .out(WriteData), 
        .inA(ALUResult), 
        .inB(ReadData), 
        .sel(MemToReg)
    );
    
    always @(*) begin
        WriteRegister = Address;
        WriteData_out = WriteData;
        RegWrite_out = RegWrite;
    end
endmodule
