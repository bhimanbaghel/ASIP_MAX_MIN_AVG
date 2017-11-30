`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:36:52 10/08/2017 
// Design Name: 
// Module Name:    ASIP 
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
module ASIP(
    input CLK,
    input RESET,
    output [7:0] MAX,
    output [7:0] MIN,
    output [7:0] QUOTIENT,
    output [7:0] REMAINDER
    );
 
	wire [7:0] MAX_R_out;
	wire [7:0] MIN_R_out;
	wire [7:0] R0_out;
	wire [7:0] COUNT_R_out;
	wire COUNT_R_zero_flag_out;
	wire [7:0] SUM_R_out;
	wire [7:0] PC_out;
	wire [7:0] IR_out;
	wire [7:0] TEMP_R_out;
	wire [7:0] BUS_1;
	wire [7:0] BUS_2;
	
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
	wire INC_AR;
	wire INC_TEMP_PC;
	wire Dec_COUNT;
	wire [2:0] Select_BUS_1_MUX;
	wire [1:0] Select_BUS_2_MUX;
	wire Select_MEMORY_DEMUX;
	wire Load_SIGN_DFF;
	wire Load_ZERO_DFF;
	wire [1:0] Select_ALU_OP;
	wire Write_MEMORY;
	
	wire [7:0] ALU_out;
	wire [7:0] REMAINDER_out;
	wire ALU_sign_flag_out;
	
	wire Zero_flag_out;
	wire Sign_flag_out;
	
	wire [7:0] OP_A_out;
	wire [7:0] OP_B_out;
	
	wire [7:0] Memory_out;
	
	wire [7:0] MUX_2_1_out;
	
	wire [7:0] ADDRESS_R_out;
	
	wire [7:0] TEMP_ADD_R_out;
	
	assign MAX = MAX_R_out;
	assign MIN = MIN_R_out;
	assign QUOTIENT = R0_out;
	assign REMAINDER = SUM_R_out;
	
	MaxRegister MAX_R(
		.Max_in(BUS_2),
		.CLK(CLK),
		.RESET(RESET),
		.Max_load(Load_MAX_R),
		.Max_out(MAX_R_out)
		);
	
	MinRegister MIN_R(
		.Min_in(BUS_2),
		.CLK(CLK),
		.RESET(RESET),
		.Min_load(Load_MIN_R),
		.Min_out(MIN_R_out)
		);
	
	Register R0(
		.Data_in(BUS_2),
		.CLK(CLK),
		.RESET(RESET),
		.Reg_load(Load_R0),
		.Data_out(R0_out)
		);
	
	Register SUM(
		.Data_in(BUS_2),
		.CLK(CLK),
		.RESET(RESET),
		.Reg_load(Load_SUM_R),
		.Data_out(SUM_R_out)
		);
		
	Register IR(
		.Data_in(BUS_2),
		.CLK(CLK),
		.RESET(RESET),
		.Reg_load(Load_IR),
		.Data_out(IR_out)
		);
	
	ProgramCounter PC(
		.PC_in(BUS_2),
		.CLK(CLK),
		.RESET(RESET),
		.PC_inc(INC_PC),
		.PC_load(Load_PC),
		.PC_out(PC_out)
		);
		
	ProgramCounter TEMP(
		.PC_in(BUS_2),
		.CLK(CLK),
		.RESET(RESET),
		.PC_inc(INC_TEMP_PC),
		.PC_load(Load_TEMP_R),
		.PC_out(TEMP_R_out)
		);
		
	CountRegister COUNT(
		.Count_in(BUS_2),
		.CLK(CLK),
		.RESET(RESET),
		.Count_dec(Dec_COUNT),
		.Count_load(Load_COUNT_R),
		.Count_out(COUNT_R_out),
		.zero_flag(COUNT_R_zero_flag_out)
		);
		
	Register OPERAND_A_R(
		.Data_in(BUS_1),
		.CLK(CLK),
		.RESET(RESET),
		.Reg_load(Load_OPERAND_A_R),
		.Data_out(OP_A_out)
		);
	
	Register OPERAND_B_R(
		.Data_in(BUS_1),
		.CLK(CLK),
		.RESET(RESET),
		.Reg_load(Load_OPERAND_B_R),
		.Data_out(OP_B_out)
		);
	
	AddressRegister ADDRESS_R(
		.AR_in(BUS_2),
		.CLK(CLK),
		.RESET(RESET),
		.AR_inc(INC_AR),
		.AR_load(Load_ADDRESS_R),
		.AR_out(ADDRESS_R_out)
		);
	
	AddressRegister TEMP_ADD_R(
		.AR_in(BUS_2),
		.CLK(CLK),
		.RESET(RESET),
		.AR_inc(INC_TEMP_AR),
		.AR_load(Load_TEMP_ADD_R),
		.AR_out(TEMP_ADD_R_out)
		);
		
	FlipFlop SIGN(
		.BIT_in(ALU_sign_flag_out),
		.CLK(CLK),
		.RESET(RESET),
		.FF_load(Load_SIGN_DFF),
		.BIT_out(Sign_flag_out)
		);
	
	FlipFlop ZERO(
		.BIT_in(COUNT_R_zero_flag_out),
		.CLK(CLK),
		.RESET(RESET),
		.FF_load(Load_ZERO_DFF),
		.BIT_out(Zero_flag_out)
		);
		
	MUX8_1 M1(
		.MAX_in(MAX_R_out),
		.MIN_in(MIN_R_out),
		.R0_in(R0_out),
		.COUNT_in(COUNT_R_out),
		.SUM_in(SUM_R_out),
		.PC_in(PC_out),
		.IR_in(IR_out),
		.TEMP_in(TEMP_R_out),
		.Select_line(Select_BUS_1_MUX),
		.OUT(BUS_1)
		);
		
	MUX4_1 M2(
		.ALU_OUT_in(ALU_out),
		.REMAINDER_in(REMAINDER_out),
		.BUS_1_in(BUS_1),
		.MEMORY_in(Memory_out),
		.Select_line(Select_BUS_2_MUX),
		.OUT(BUS_2)
		);
		
	MUX2_1 M3(
		.ADD_R_in(ADDRESS_R_out),
		.TEMP_ADD_R_in(TEMP_ADD_R_out),
		.Select_line(Select_MEMORY_DEMUX),
		.OUT(MUX_2_1_out)
		);
		
	Memory M(
		.Data_in(BUS_1),
		.Address_in(MUX_2_1_out),
		.CLK(CLK),
		.Memory_write(Write_MEMORY),
		.Data_out(Memory_out)
		);
	
	ALU A(
		.op_A(OP_A_out),
		.op_B(OP_B_out),
		.select_line(Select_ALU_OP),
		.CLK(CLK),
		.alu_out(ALU_out),
		.remainder(REMAINDER_out),
		.alu_sign_flag(ALU_sign_flag_out)
		);
		
	ControlUnit CU(
		.IR_value(IR_out), 
		.PC_value(PC_out), 
		.CLK(CLK), 
		.RESET(RESET), 
		.Sign_value(Sign_flag_out), 
		.Count_zero(Zero_flag_out), 
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
		.INC_AR(INC_AR),
		.INC_TEMP_PC(INC_TEMP_PC),
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

endmodule
