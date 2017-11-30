`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:38 10/07/2017 
// Design Name: 
// Module Name:    AddressRegister 
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
module AddressRegister(
	 input [7:0] AR_in,
    input CLK,
    input RESET,
    input AR_load,
    input AR_inc,
    output reg [7:0] AR_out
    );
	always @(posedge CLK or negedge RESET) begin
		if(RESET == 0)
			AR_out <= 0;
		else if(AR_load == 1)
			AR_out <= AR_in;
		else if(AR_inc == 1)
			AR_out <= AR_out + 1'b1;
	 end

endmodule
