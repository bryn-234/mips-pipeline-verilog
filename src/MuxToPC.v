`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2025 06:08:11 PM
// Design Name: 
// Module Name: MuxToPC
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


module MuxToPC(out, normalAddress, jumpRegister, jumpTarget, sel);
    input [31:0] normalAddress, jumpRegister, jumpTarget;
    input [1:0] sel;
    
    output reg [31:0] out;
    
    always @(*) begin
        case(sel)
            2'b00: begin
                out = normalAddress;
            end
            2'b01: begin
                out = jumpTarget;
            end
            2'b10: begin
                out = jumpRegister;
            end
            default:
                out = normalAddress;
        endcase
    end
endmodule
