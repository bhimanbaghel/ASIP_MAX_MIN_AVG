`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:52:38 10/08/2017 
// Design Name: 
// Module Name:    MUX8_1 
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
module MUX8_1(
    input [7:0] MAX_in,
    input [7:0] MIN_in,
    input [7:0] R0_in,
    input [7:0] COUNT_in,
    input [7:0] SUM_in,
    input [7:0] PC_in,
    input [7:0] IR_in,
    input [7:0] TEMP_in,
    input [2:0] Select_line,
    output [7:0] OUT
    );
	
	assign OUT = (Select_line == 3'b000)	?	MAX_in	:
					 (Select_line == 3'b001)	?	MIN_in	:
					 (Select_line == 3'b010)	?	R0_in		:
					 (Select_line == 3'b011)	?	COUNT_in	:
					 (Select_line == 3'b100)	?	SUM_in	:
					 (Select_line == 3'b101)	?	PC_in		:
					 (Select_line == 3'b110)	?	IR_in		:
					 (Select_line == 3'b111)	?	TEMP_in	:	3'bx;
endmodule
