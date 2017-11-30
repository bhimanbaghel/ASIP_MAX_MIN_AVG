`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:09:55 10/10/2017
// Design Name:   Memory
// Module Name:   /home/bhinu/ASIP/Memory_testbench.v
// Project Name:  ASIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Memory_testbench;

	// Inputs
	reg [7:0] Data_in;
	reg [7:0] Address_in;
	reg CLK;
	reg Memory_write;

	// Outputs
	wire [7:0] Data_out;

	// Instantiate the Unit Under Test (UUT)
	Memory uut (
		.Data_in(Data_in), 
		.Address_in(Address_in), 
		.CLK(CLK), 
		.Memory_write(Memory_write), 
		.Data_out(Data_out)
	);

	initial begin
		// Initialize Inputs
		Data_in = 0;
		Address_in = 0;
		CLK = 0;
		Memory_write = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		CLK = 1; Address_in = 0;
		#50 CLK = 0;
		#50 CLK = 1; Address_in = 1;
		#50 CLK = 0;
		#50 CLK = 1; Address_in = 2;
		#50 CLK = 0;
		#50 CLK = 1; Address_in = 3;
		#50 CLK = 0;
		#50 CLK = 1; Address_in = 4;
		#50 CLK = 0;
		#50 CLK = 1; Address_in = 5;
		#50 CLK = 0;
		#50 CLK = 1; Address_in = 6;
		#50 CLK = 0;
		#50 CLK = 1; Address_in = 7;
		#50 CLK = 0;

	end
      
endmodule

