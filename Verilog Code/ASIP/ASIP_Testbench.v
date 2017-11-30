`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:40:50 10/09/2017
// Design Name:   ASIP
// Module Name:   /home/bhinu/ASIP/ASIP_Testbench.v
// Project Name:  ASIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ASIP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ASIP_Testbench;

	// Inputs
	reg CLK;
	reg RESET;

	// Outputs
	wire [7:0] MAX;
	wire [7:0] MIN;
	wire [7:0] QUOTIENT;
	wire [7:0] REMAINDER;

	// Instantiate the Unit Under Test (UUT)
	ASIP uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.MAX(MAX), 
		.MIN(MIN), 
		.QUOTIENT(QUOTIENT), 
		.REMAINDER(REMAINDER)
	);
	reg [9:0] i = 0;
	initial begin
		// Initialize Inputs
		CLK = 0;
		RESET = 0;
		

		// Wait 100 ns for global reset to finish
		#5;
		RESET = 1;
      CLK =1;
		
		//#50 CLK = 0;
		// Add stimulus here
		/*for(i=0; i<1000; i=i+1) begin
		CLK = ~CLK;
		#50;
		end*/
		
	end
	always #2 CLK = ~CLK;
	
	/*always @ (*)
	begin
		#50 CLK = ~CLK;
	end*/
			

endmodule

