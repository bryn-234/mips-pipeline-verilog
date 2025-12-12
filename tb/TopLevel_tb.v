`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 09:26:44 PM
// Design Name: 
// Module Name: TopLevel_tb
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


module TopLevel_tb();

    reg Clk;
    reg Reset;
    
    TopLevel u0(
        .Clk(Clk), 
        .Reset(Reset)
        );
        
    initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
	initial begin 
	   Reset <= 1;
	   
	   @(posedge Clk)
	   #5
	   Reset <= 0;
	   
	end
	
endmodule
