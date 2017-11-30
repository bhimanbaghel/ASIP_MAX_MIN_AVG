`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:50 10/06/2017 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter(
    input [7:0] PC_in,
    input CLK,
    input RESET,
    input PC_load,
    input PC_inc,
    output reg [7:0] PC_out
    );
	 always @(posedge CLK or negedge RESET) begin
		if(RESET == 0)
				PC_out <= 8'b0;
		else if(PC_load == 1)
			PC_out <= PC_in;
		else if(PC_inc == 1)
			PC_out <= PC_out + 1'b1;
	 end

endmodule
