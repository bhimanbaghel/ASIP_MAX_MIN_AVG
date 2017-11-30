`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:06:08 10/09/2017 
// Design Name: 
// Module Name:    MUX4_1 
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
module MUX4_1(
    input [7:0] ALU_OUT_in,
    input [7:0] REMAINDER_in,
    input [7:0] BUS_1_in,
    input [7:0] MEMORY_in,
    input [1:0] Select_line,
    output [7:0] OUT
    );
	assign OUT = (Select_line == 2'b00)	?	ALU_OUT_in		:
					 (Select_line == 2'b01)	?	REMAINDER_in	:
					 (Select_line == 2'b10)	?	BUS_1_in			:
					 (Select_line == 2'b11)	?	MEMORY_in		:	2'bx;
					 

endmodule
