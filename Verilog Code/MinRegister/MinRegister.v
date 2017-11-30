`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:36 10/06/2017 
// Design Name: 
// Module Name:    MinRegister 
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
module MinRegister(
	input [7:0] Min_in,
   input CLK,
   input RESET,
   input Min_load,
   output reg [7:0] Min_out
    );
	always @(posedge CLK or negedge RESET) begin
		if(RESET == 0)
			Min_out = 127;
		else if(Min_load == 1)
			Min_out = Min_in;
	 end

endmodule
