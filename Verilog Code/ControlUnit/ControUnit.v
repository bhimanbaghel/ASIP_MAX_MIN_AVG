`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:40:44 10/08/2017 
// Design Name: 
// Module Name:    ControUnit 
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
module ControlUnit(
    input [7:0] IR_value,
    input [7:0] PC_value,
    input CLK,
    input RESET,
    input Sign_value,
	 input Count_zero,
    output reg Load_MAX_R,
    output reg Load_MIN_R,
    output reg Load_R0,
    output reg Load_COUNT_R,
    output reg Load_SUM_R,
    output reg Load_PC,
    output reg Load_IR,
    output reg Load_TEMP_R,
    output reg Load_ADDRESS_R,
	 output reg Load_TEMP_ADD_R,
    output reg Load_OPERAND_A_R,
    output reg Load_OPERAND_B_R,
    output reg INC_PC,
	 output reg INC_AR,
	 output reg INC_TEMP_PC,
    output reg INC_TEMP_AR,
    output reg Dec_COUNT,
    output [2:0] Select_BUS_1_MUX,
    output [1:0] Select_BUS_2_MUX,
	 output reg Select_MEMORY_DEMUX,
    output reg Load_SIGN_DFF,
	 output reg Load_ZERO_DFF,
    output [1:0] Select_ALU_OP,
    output reg Write_MEMORY
    );
	
	parameter LDA 			= 	8'b00000000,
				 INC_ADD		= 	8'b00000001,
				 MOV 			= 	8'b00000010,
				 MAX 			= 	8'b00000011,
				 MIN 			= 	8'b00000100,
				 SUM 			= 	8'b00000101,
				 DIV 			= 	8'b00000110,
				 LOOP 		= 	8'b00000111,
				 LOOPEND 	= 	8'b00001000,
				 END 			= 	8'b00001001,
				 DEC_COUNT	=	8'b00001010;
	
	parameter S_ideal 		= 	4'b0000,
				 S_fetch_1 		= 	4'b0001,
				 S_fetch_2		=	4'b0010,
				 S_decode_1		=	4'b0011,
				 S_decode_2 	= 	4'b0100,
				 S_decode_3		=	4'b0101,
				 S_execute_1 	= 	4'b0110,
				 S_execute_2 	= 	4'b0111,
				 S_execute_3	=	4'b1000,
				 S_halt			=	4'b1001,
				 S_execute_2_1 =	4'b1010,
				 S_execute_2_2	=	4'b1011;
	
	parameter MAX_R 		= 	3'b000,
				 MIN_R 		= 	3'b001,
				 R0 			= 	3'b010,
				 COUNT_R 	= 	3'b011,
				 SUM_R 		= 	3'b100,
				 PC 			= 	3'b101,
				 IR 			= 	3'b110,
				 TEMP 		= 	3'b111;
				 
	parameter ALU_OUT		=	2'b00,
				 REMAINDER	=	2'b01,
				 BUS_1		=	2'b10,
				 MEMORY		=	2'b11;
				 
	parameter ADD_OP	=	2'b00,
				 CMP_OP	=	2'b01,
				 DIV_OP	=	2'b10;
	
	reg [3:0] Current_State;
	reg [3:0] Next_State;
	
	reg Select_MAX_R,
		 Select_MIN_R,
		 Select_R0,
		 Select_COUNT_R,
		 Select_SUM_R,
		 Select_PC,
		 Select_IR,
		 Select_TEMP_R,
		 Select_ALU_OUT,
		 Select_REMAINDER,
		 Select_BUS_1,
		 Select_MEMORY,
		 Select_ADD_OP,
		 Select_CMP_OP,
		 Select_DIV_OP;
	
	wire [7:0] opcode = IR_value;
	wire sign 			= Sign_value;
	wire zero 			= Count_zero;
	
	assign Select_BUS_1_MUX = Select_MAX_R 	?	MAX_R		:
									  Select_MIN_R  	?	MIN_R		:
									  Select_R0			?	R0			:
									  Select_COUNT_R	?	COUNT_R	:
									  Select_SUM_R		?	SUM_R		:
									  Select_PC			?	PC			:
									  Select_IR			?	IR			:
									  Select_TEMP_R	?	TEMP		:	3'bx;
	
	assign Select_BUS_2_MUX = Select_ALU_OUT		?	ALU_OUT		:
									  Select_REMAINDER	?	REMAINDER	:
									  Select_BUS_1			?	BUS_1			:
									  Select_MEMORY		?	MEMORY		:	2'bx;
	
	assign Select_ALU_OP = Select_ADD_OP	?	ADD_OP	:
								  Select_CMP_OP	?	CMP_OP	:
								  Select_DIV_OP	?	DIV_OP	:	2'bx;
	
	always @ (posedge CLK or negedge RESET)
	begin
		if(RESET == 0)
			Current_State = S_ideal;
		else
			Current_State = Next_State;
	end
	
	always @ (Current_State or opcode)
	begin
		Load_MAX_R 				= 		1'b0;
		Load_MIN_R 				= 		1'b0;
		Load_R0 					= 		1'b0;
		Load_COUNT_R 			= 		1'b0;
		Load_SUM_R 				= 		1'b0;
		Load_PC 					= 		1'b0;
		Load_IR 					= 		1'b0;
		Load_TEMP_R 			= 		1'b0;
		Load_ADDRESS_R 		= 		1'b0;
		Load_TEMP_ADD_R 		= 		1'b0;
		Load_OPERAND_A_R 		= 		1'b0;
		Load_OPERAND_B_R 		=		1'b0;
		INC_PC 					= 		1'b0;
		INC_AR					=		1'b0;
		INC_TEMP_PC				=		1'b0;
		INC_TEMP_AR				= 		1'b0;
		Dec_COUNT 				= 		1'b0;
		Select_MEMORY_DEMUX 	=		1'b0;
		Load_SIGN_DFF 			= 		1'b0;
		Load_ZERO_DFF 			= 		1'b0;
		Write_MEMORY 			= 		1'b0;
		
		Select_MAX_R 			= 		1'b0;
		Select_MIN_R 			= 		1'b0;
		Select_R0 				= 		1'b0;
		Select_COUNT_R 		= 		1'b0;
		Select_SUM_R 			= 		1'b0;
		Select_PC 				= 		1'b0;
		Select_IR 				= 		1'b0;
		Select_TEMP_R 			= 		1'b0;
		Select_ALU_OUT 		= 		1'b0;
		Select_REMAINDER 		= 		1'b0;
		Select_BUS_1 			= 		1'b0;
		Select_MEMORY 			= 		1'b0;
		Select_ADD_OP 			= 		1'b0;
		Select_CMP_OP			=	 	1'b0;
		Select_DIV_OP 			= 		1'b0;
		
		Next_State 				= 		Current_State;
		
		case(Current_State)
			S_ideal 		:	Next_State = S_fetch_1;
			
			S_fetch_1 	:	begin
								Next_State 		= S_fetch_2;
								Select_PC 		= 1'b1;
								Select_BUS_1 	= 1'b1;
								Load_ADDRESS_R = 1'b1;
								end
			
			S_fetch_2 	:	begin
								Next_State 		= S_decode_1;
								Select_MEMORY 	= 1'b1;
								Load_IR 			= 1'b1;
								INC_PC			= 1'b1;
								end
			
			S_decode_1	:	begin
								case(opcode)
									LDA	:	begin
												Next_State 		= S_decode_2;
												Select_PC 		= 1'b1;
												Select_BUS_1 	= 1'b1;
												Load_ADDRESS_R = 1'b1;
												end
									LOOP	:	begin
												Next_State		= S_fetch_1;
												Select_PC 		= 1'b1;
												Select_BUS_1 	= 1'b1;
												Load_TEMP_R 	= 1'b1;
												end
									INC_ADD:	begin
												Next_State	= S_fetch_1;
												INC_TEMP_AR = 1'b1;
												end
									MOV	:	begin
												Next_State 				= S_fetch_1;
												Select_MEMORY_DEMUX 	= 1'b1;
												Select_MEMORY 			= 1'b1;
												Load_R0 					= 1'b1;
												end
									MAX	:	begin
												Next_State 			= S_decode_2;
												Select_MAX_R 		= 1'b1;
												Load_OPERAND_A_R 	= 1'b1;
												end
									MIN	:	begin
												Next_State 			= S_decode_2;
												Select_MIN_R 		= 1'b1;
												Load_OPERAND_A_R 	= 1'b1;
												end
									SUM	:	begin
												Next_State 			= S_decode_2;
												Select_SUM_R 		= 1'b1;
												Load_OPERAND_A_R 	= 1'b1;
												end
									LOOPEND:	begin
												Next_State 		= S_decode_2;
												Dec_COUNT 		= 1'b1;
												end
									DIV	:	begin
												Next_State 			= S_decode_2;
												Select_SUM_R 		= 1'b1;
												Load_OPERAND_A_R 	= 1'b1;
												end
									END	:	begin
												Next_State = S_halt;
												end
								endcase
								end
			S_decode_2	:	begin
								case(opcode)
									LDA	:	begin
												Next_State 			= S_decode_3;
												Select_MEMORY 		= 1'b1;
												Load_TEMP_ADD_R 	= 1'b1;
												end
									
									MAX	:	begin
												Next_State			= S_execute_1;
												Select_R0			= 1'b1;
												Load_OPERAND_B_R 	= 1'b1;
												end
									MIN	:	begin
												Next_State 			= S_execute_1;
												Select_R0 			= 1'b1;
												Load_OPERAND_B_R 	= 1'b1;
												end
									SUM	:	begin
												Next_State 			= S_execute_1;
												Select_R0 			= 1'b1;
												Load_OPERAND_B_R 	= 1'b1;
												end
									DIV	:	begin
												Next_State 			= S_execute_1;
												Select_COUNT_R 	= 1'b1;
												Load_OPERAND_B_R 	= 1'b1;
												end
									LOOPEND:	begin
												Next_State 		= S_decode_3;
												Load_ZERO_DFF	= 1'b1;
												end
								endcase
								end
			S_decode_3	:	begin
								case(opcode)
									LDA	:	begin
												Next_State 				= S_fetch_1;
												Select_MEMORY_DEMUX 	= 1'b1;
												Select_MEMORY 			= 1'b1;
												Load_COUNT_R 			= 1'b1;
												INC_PC 					= 1'b1;
												end
									LOOPEND:	begin
												Next_State = S_execute_1;
												end
								endcase
								end
			S_execute_1	:	begin
								case(opcode)
									LOOPEND: begin
												Next_State = S_fetch_1;
												if(zero == 1)
													begin
													Select_TEMP_R 	= 1'b1;
													Select_BUS_1 	= 1'b1;
													Load_PC 			= 1'b1;
													end
												end
									MAX	:	begin
												Next_State		=	S_execute_2_1;
												Select_CMP_OP 	= 1'b1;
												end
									MIN	:	begin
												Next_State 		= S_execute_2_1;
												Select_CMP_OP 	= 1'b1;
												end
									SUM	:	begin
												Next_State 		= S_execute_2;
												Select_ADD_OP 	= 1'b1;
												end
									DIV	:	begin
												Next_State 		= S_execute_2;
												Select_DIV_OP 	= 1'b1;
												end
									END	:	begin
												Next_State 		= S_execute_2;
												INC_TEMP_AR 	= 1'b1;
												Select_R0 		= 1'b1;
												Write_MEMORY 	= 1'b1;
												end
								endcase
								end
			S_execute_2_1:	begin
								case(opcode)
									MAX	:	begin
												Next_State		=	S_execute_2;
												Load_SIGN_DFF 	= 1'b1;
												end
									MIN	:	begin
												Next_State		=	S_execute_2;
												Load_SIGN_DFF 	= 1'b1;
												end
									LOOPEND:	begin
												Next_State 				= S_fetch_1;
												Select_MEMORY_DEMUX 	= 1'b1;
												Select_MEMORY 			= 1'b1;
												Load_TEMP_R 			= 1'b1;
												end
								endcase
								end
			S_execute_2	:	begin
								case(opcode)
									MAX	:	begin
												Next_State	=	S_execute_2_2;
												end
									MIN	:	begin
												Next_State = S_execute_2_2;
												end
									SUM	:	begin
												Next_State 		= S_fetch_1;
												Select_ALU_OUT = 1'b1;
												Load_SUM_R 		= 1'b1;
												end
									DIV	:	begin
												Next_State 		= S_execute_3;
												Select_ALU_OUT = 1'b1;
												Load_R0 			= 1'b1;
												end
									LOOPEND:	begin
												Next_State 	= S_execute_2_1;
												INC_TEMP_AR = 1'b1;
												end			
								endcase
								end
			S_execute_2_2:	begin
								case(opcode)
									MAX	:	begin
												Next_State	=	S_fetch_1;
												if(sign == 1)
													begin
													Select_R0 		= 1'b1;
													Select_BUS_1 	= 1'b1;
													Load_MAX_R 		= 1'b1;
													end
												end
									MIN	:	begin
												Next_State = S_fetch_1;
												if(sign==0)
													begin
													Select_R0 		= 1'b1;
													Select_BUS_1 	= 1'b1;
													Load_MIN_R 		= 1'b1;
													end
												end
								endcase
								end
			S_execute_3	:	begin
								case(opcode)
									DIV	:	begin
												Next_State 			= S_fetch_1;
												Select_REMAINDER 	= 1'b1;
												Load_SUM_R 			= 1'b1;
												end
								endcase
								end
			S_halt		:	Next_State = S_halt;
			default		:	Next_State = S_ideal;
		endcase
	end

endmodule
