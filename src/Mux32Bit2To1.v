`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit2To1(out, inA, inB, sel);

    output reg [31:0] out;
    
    input [31:0] inA; //Option for selection 1
    input [31:0] inB; //Option for selection 0
    input sel;

    /* Fill in the implementation here ... */ 
    always @(*) begin 
        if(sel) begin
            out = inA;
        end
        else begin
            out = inB;
        end
     end
     
endmodule
