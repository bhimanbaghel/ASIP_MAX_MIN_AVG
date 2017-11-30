`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:11:58 10/09/2017 
// Design Name: 
// Module Name:    MUX2_1 
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
module MUX2_1(
    input [7:0] ADD_R_in,
    input [7:0] TEMP_ADD_R_in,
    input Select_line,
    output [7:0] OUT
    );
	assign OUT = (Select_line == 1'b0)	?	ADD_R_in			:
					 (Select_line == 1'b1)	?	TEMP_ADD_R_in	:	1'bx;

endmodule
