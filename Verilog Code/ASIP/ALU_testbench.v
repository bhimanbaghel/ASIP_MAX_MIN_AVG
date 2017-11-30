`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:27:09 10/09/2017
// Design Name:   ALU
// Module Name:   /home/bhinu/ASIP/ALU_testbench.v
// Project Name:  ASIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_testbench;

	// Inputs
	reg [7:0] op_A;
	reg [7:0] op_B;
	reg [1:0] select_line;
	reg CLK;

	// Outputs
	wire [7:0] alu_out;
	wire [7:0] remainder;
	wire alu_sign_flag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.op_A(op_A), 
		.op_B(op_B), 
		.select_line(select_line), 
		.CLK(CLK), 
		.alu_out(alu_out), 
		.remainder(remainder), 
		.alu_sign_flag(alu_sign_flag)
	);

	initial begin
		// Initialize Inputs
		op_A = 0;
		op_B = 0;
		select_line = 0;
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		CLK = 1; op_A = 15; op_B = 6; select_line = 0;
		#50 CLK = 0;
		#50 CLK = 1; op_A = 15; op_B = 6; select_line = 1;
		#50 CLK = 0;
		#50 CLK = 1; op_A = 15; op_B = 6; select_line = 2;
		#50 CLK = 0;

	end
      
endmodule

