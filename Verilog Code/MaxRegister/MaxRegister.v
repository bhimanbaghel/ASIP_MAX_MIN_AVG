`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:27:28 10/06/2017 
// Design Name: 
// Module Name:    MaxRegister 
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
module MaxRegister(
	input [7:0] Max_in,
   input CLK,
   input RESET,
   input Max_load,
   output reg [7:0] Max_out
    );
	always @(posedge CLK or negedge RESET) begin
		if(RESET == 0)
			Max_out = 0;
		else if(Max_load == 1)
			Max_out = Max_in;
	 end

endmodule
