`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:30 10/06/2017 
// Design Name: 
// Module Name:    Memory 
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
module Memory(
	 input [7:0] Data_in,
	 input [7:0] Address_in,
    input CLK,
    input Memory_write,
    output [7:0] Data_out
    );
	reg [7:0] Memory_array [255:0];
	assign Data_out = Memory_array[Address_in];
	integer i;
	always @ (posedge CLK)
	begin
		if(Memory_write == 1)
			Memory_array[Address_in] = Data_in;
	end
	initial begin
		Memory_array[0] 	= 0;
		Memory_array[1] 	= 16;
		Memory_array[2] 	= 7;
		Memory_array[3] 	= 1;
		Memory_array[4] 	= 2;
		Memory_array[5] 	= 3;
		Memory_array[6] 	= 4;
		Memory_array[7] 	= 5;
		Memory_array[8] 	= 8;
		Memory_array[9] 	= 0;
		Memory_array[10] 	= 16;
		Memory_array[11] 	= 6;
		Memory_array[12] 	= 9;
		Memory_array[13] 	= 8'bx;
		Memory_array[14] 	= 8'bx;
		Memory_array[15] 	= 8'bx;
		Memory_array[16] 	= 6;
		Memory_array[17] 	= 7;
		Memory_array[18] 	= 8;
		Memory_array[19] 	= 2;
		Memory_array[20] 	= 3;
		Memory_array[21] 	= 5;
		Memory_array[22] 	= 9;
		for(i=23;i<=255;i=i+1)
			Memory_array[i] = 8'bx;
	end

endmodule
