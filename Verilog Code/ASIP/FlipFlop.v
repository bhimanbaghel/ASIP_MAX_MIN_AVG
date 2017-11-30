`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:40:47 10/08/2017 
// Design Name: 
// Module Name:    FlipFlop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FlipFlop(
    input CLK,
    input RESET,
    input BIT_in,
    input FF_load,
    output reg BIT_out
    );
	always @ (posedge CLK or negedge RESET)
	begin
		if(RESET == 0)
			BIT_out <= 1'b0;
		else if(FF_load == 1)
			BIT_out <= BIT_in;
	end
endmodule
