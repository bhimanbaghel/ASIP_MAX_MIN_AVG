`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:47:19 10/06/2017 
// Design Name: 
// Module Name:    CountRegister 
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
module CountRegister(
    input [7:0] Count_in,
    input CLK,
    input RESET,
    input Count_load,
	 input Count_dec,
    output reg [7:0] Count_out,
	 output reg zero_flag
    );
	always @(posedge CLK or negedge RESET) begin
		if(RESET == 0)
			begin
			Count_out = 0;
			zero_flag = |Count_out;
			end
		else if(Count_load == 1)
			begin
			Count_out = Count_in;
			zero_flag = |Count_out;
			end
		else if(Count_dec == 1)
			begin
			Count_out = Count_out - 1'b1;
			zero_flag = |Count_out;
			end
	 end
endmodule
