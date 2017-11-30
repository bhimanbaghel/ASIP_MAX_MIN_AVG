`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:48 10/08/2017 
// Design Name: 
// Module Name:    Register 
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
module Register(
	input [7:0] Data_in,
   input CLK,
   input RESET,
   input Reg_load,
   output reg [7:0] Data_out
    );
	 always @(posedge CLK or negedge RESET) begin
		if(RESET == 0)
			Data_out <= 0;
		else if(Reg_load == 1)
			Data_out <= Data_in;
	 end
endmodule
