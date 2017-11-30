`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:42:19 10/09/2017
// Design Name:   ControlUnit
// Module Name:   /home/bhinu/ASIP/CU_testbench.v
// Project Name:  ASIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CU_testbench;

	// Inputs
	reg [7:0] IR_value;
	reg [7:0] PC_value;
	reg CLK;
	reg RESET;
	reg Sign_value;
	reg Count_zero;

	// Outputs
	wire Load_MAX_R;
	wire Load_MIN_R;
	wire Load_R0;
	wire Load_COUNT_R;
	wire Load_SUM_R;
	wire Load_PC;
	wire Load_IR;
	wire Load_TEMP_R;
	wire Load_ADDRESS_R;
	wire Load_TEMP_ADD_R;
	wire Load_OPERAND_A_R;
	wire Load_OPERAND_B_R;
	wire INC_PC;
	wire INC_TEMP_AR;
	wire Dec_COUNT;
	wire [2:0] Select_BUS_1_MUX;
	wire [1:0] Select_BUS_2_MUX;
	wire Select_MEMORY_DEMUX;
	wire Load_SIGN_DFF;
	wire Load_ZERO_DFF;
	wire [1:0] Select_ALU_OP;
	wire Write_MEMORY;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.IR_value(IR_value), 
		.PC_value(PC_value), 
		.CLK(CLK), 
		.RESET(RESET), 
		.Sign_value(Sign_value), 
		.Count_zero(Count_zero), 
		.Load_MAX_R(Load_MAX_R), 
		.Load_MIN_R(Load_MIN_R), 
		.Load_R0(Load_R0), 
		.Load_COUNT_R(Load_COUNT_R), 
		.Load_SUM_R(Load_SUM_R), 
		.Load_PC(Load_PC), 
		.Load_IR(Load_IR), 
		.Load_TEMP_R(Load_TEMP_R), 
		.Load_ADDRESS_R(Load_ADDRESS_R), 
		.Load_TEMP_ADD_R(Load_TEMP_ADD_R), 
		.Load_OPERAND_A_R(Load_OPERAND_A_R), 
		.Load_OPERAND_B_R(Load_OPERAND_B_R), 
		.INC_PC(INC_PC), 
		.INC_TEMP_AR(INC_TEMP_AR), 
		.Dec_COUNT(Dec_COUNT), 
		.Select_BUS_1_MUX(Select_BUS_1_MUX), 
		.Select_BUS_2_MUX(Select_BUS_2_MUX), 
		.Select_MEMORY_DEMUX(Select_MEMORY_DEMUX), 
		.Load_SIGN_DFF(Load_SIGN_DFF), 
		.Load_ZERO_DFF(Load_ZERO_DFF), 
		.Select_ALU_OP(Select_ALU_OP), 
		.Write_MEMORY(Write_MEMORY)
	);

	initial begin
		// Initialize Inputs
		IR_value = 0;
		PC_value = 0;
		CLK = 0;
		RESET = 0;
		Sign_value = 0;
		Count_zero = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

