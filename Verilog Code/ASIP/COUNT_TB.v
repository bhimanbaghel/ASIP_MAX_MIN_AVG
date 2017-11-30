`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:07:50 10/14/2017
// Design Name:   CountRegister
// Module Name:   /home/bhinu/ASIP/COUNT_TB.v
// Project Name:  ASIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CountRegister
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module COUNT_TB;

	// Inputs
	reg [7:0] Count_in;
	reg CLK;
	reg RESET;
	reg Count_load;
	reg Count_dec;

	// Outputs
	wire [7:0] Count_out;
	wire zero_flag;

	// Instantiate the Unit Under Test (UUT)
	CountRegister uut (
		.Count_in(Count_in), 
		.CLK(CLK), 
		.RESET(RESET), 
		.Count_load(Count_load), 
		.Count_dec(Count_dec), 
		.Count_out(Count_out), 
		.zero_flag(zero_flag)
	);

	initial begin
		// Initialize Inputs
		Count_in = 5;
		CLK = 0;
		RESET = 0;
		Count_load = 1;
		Count_dec = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		RESET =1;
		CLK=1;
		Count_load = 0;
		
		#50 CLK=0;
		#50 CLK=1; Count_dec=1;

		#50 CLK=0;
		#50 CLK=1; Count_dec=1;

		#50 CLK=0;
		#50 CLK=1; Count_dec=1;

		#50 CLK=0;
		#50 CLK=1; Count_dec=1;
		
		#50 CLK=0;
		#50 CLK=1; Count_dec=1;
		
		#50 CLK=0;
		#50 CLK=1; Count_dec=1;
		
		#50 CLK=0;
		#50 CLK=1; Count_load=1; Count_in=0;
		
		#50 CLK=0;
		#50 CLK=1; Count_dec=1;

	end
      
endmodule

