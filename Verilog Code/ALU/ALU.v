`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:50:40 10/05/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [7:0] op_A,
    input [7:0] op_B,
    input [1:0] select_line,
	 input CLK,
    output reg [7:0] alu_out,
	 output reg [7:0] remainder,
	 output reg alu_sign_flag
    );
	 reg [7:0] temp;
	 reg [7:0] count;
	 always @ (posedge CLK) begin
		case(select_line)
			2'b00 : begin
						alu_out = op_A + op_B;
						remainder =0;
						alu_sign_flag = alu_out[7];
						end
			2'b01 : begin
						alu_out = op_A - op_B;
						remainder = 0;
						alu_sign_flag = alu_out[7];
					  end
			2'b10 : begin
						count = 0;
						temp = op_A;
						while(temp >= op_B)
						begin
							temp = temp - op_B;
							count = count +1;
						end
						alu_out = count;
						remainder = temp;
						alu_sign_flag = alu_out[7];
					  end
		endcase
	 end
endmodule
