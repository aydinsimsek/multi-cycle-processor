// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Sat May 09 17:04:45 2020"

module multicycle(
	CLK,
	RESET,
	RUN,
	Result,
	CurrentState
);


input wire	CLK;
input wire	RESET;
input wire	RUN;
output wire	[3:0] CurrentState;
output wire	[7:0] Result;

wire	[15:0] A;
wire	[15:0] B;
wire	[15:0] RD;
wire	[7:0] y;
wire	SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_46;
wire	[7:0] SYNTHESIZED_WIRE_47;
wire	[7:0] SYNTHESIZED_WIRE_11;
wire	[1:0] SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	[15:0] SYNTHESIZED_WIRE_14;
wire	[15:0] SYNTHESIZED_WIRE_15;
wire	[7:0] SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_17;
wire	[2:0] SYNTHESIZED_WIRE_18;
wire	[7:0] SYNTHESIZED_WIRE_20;
wire	[7:0] SYNTHESIZED_WIRE_21;
wire	[7:0] SYNTHESIZED_WIRE_23;
wire	[2:0] SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	[7:0] SYNTHESIZED_WIRE_29;
wire	[7:0] SYNTHESIZED_WIRE_30;
wire	[2:0] SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	[3:0] SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	[2:0] SYNTHESIZED_WIRE_42;
wire	[2:0] SYNTHESIZED_WIRE_43;
wire	[7:0] SYNTHESIZED_WIRE_44;





register_WE	b2v_inst(
	.clk(CLK),
	.rst(RESET),
	.WriteEn(SYNTHESIZED_WIRE_0),
	.data(SYNTHESIZED_WIRE_45),
	.B(B));
	defparam	b2v_inst.W = 16;


mux2_1	b2v_inst1(
	.s(SYNTHESIZED_WIRE_2),
	.a0(y),
	.a1(SYNTHESIZED_WIRE_3),
	.y(SYNTHESIZED_WIRE_44));
	defparam	b2v_inst1.WIDTH = 8;


Link_Register	b2v_inst10(
	.clk(CLK),
	.rst(RESET),
	.WriteEn(SYNTHESIZED_WIRE_4),
	.in(y),
	.out(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst10.W = 8;


Two_Inputs_Simple_Register	b2v_inst11(
	.clk(CLK),
	.rst(RESET),
	.RD1(SYNTHESIZED_WIRE_5),
	.RD2(SYNTHESIZED_WIRE_6),
	.A(SYNTHESIZED_WIRE_8),
	.B(SYNTHESIZED_WIRE_46));
	defparam	b2v_inst11.W = 8;


mux2_1	b2v_inst12(
	.s(SYNTHESIZED_WIRE_7),
	.a0(SYNTHESIZED_WIRE_8),
	.a1(B[7:0]),
	.y(SYNTHESIZED_WIRE_29));
	defparam	b2v_inst12.WIDTH = 8;


mux4_1	b2v_inst13(
	.a0(SYNTHESIZED_WIRE_46),
	.a1(SYNTHESIZED_WIRE_47),
	.a2(SYNTHESIZED_WIRE_11),
	
	.s(SYNTHESIZED_WIRE_12),
	.y(SYNTHESIZED_WIRE_30));
	defparam	b2v_inst13.WIDTH = 8;


IDM	b2v_inst14(
	.clk(CLK),
	.MemWrite(SYNTHESIZED_WIRE_13),
	.A(SYNTHESIZED_WIRE_14),
	.WD(SYNTHESIZED_WIRE_15),
	.RD(RD));


Simple_Register	b2v_inst15(
	.clk(CLK),
	.rst(RESET),
	.in(SYNTHESIZED_WIRE_48),
	.out(SYNTHESIZED_WIRE_20));
	defparam	b2v_inst15.W = 8;


mux2_1	b2v_inst16(
	.s(SYNTHESIZED_WIRE_17),
	.a0(A[10:8]),
	.a1(SYNTHESIZED_WIRE_18),
	.y(SYNTHESIZED_WIRE_42));
	defparam	b2v_inst16.WIDTH = 3;


Shift_Register	b2v_inst17(
	.in(SYNTHESIZED_WIRE_46),
	.shift_amount(A[7:3]),
	.shift_type(A[2:0]),
	.out(SYNTHESIZED_WIRE_23));


mux8_1	b2v_inst18(
	.a0(SYNTHESIZED_WIRE_20),
	.a1(SYNTHESIZED_WIRE_21),
	.a2(SYNTHESIZED_WIRE_48),
	.a3(SYNTHESIZED_WIRE_23),
	.a4(SYNTHESIZED_WIRE_47),
	
	
	
	.s(SYNTHESIZED_WIRE_25),
	.y(y));
	defparam	b2v_inst18.WIDTH = 8;


constant	b2v_inst19(
	.out(SYNTHESIZED_WIRE_18));
	defparam	b2v_inst19.value = 3'b111;
	defparam	b2v_inst19.WIDTH = 3;


mux2_1	b2v_inst2(
	.s(SYNTHESIZED_WIRE_26),
	.a0(B),
	.a1(SYNTHESIZED_WIRE_45),
	.y(SYNTHESIZED_WIRE_14));
	defparam	b2v_inst2.WIDTH = 16;


Extend_8_to_16	b2v_inst20(
	.in(SYNTHESIZED_WIRE_46),
	.out(SYNTHESIZED_WIRE_15));


ALU	b2v_inst21(
	.A(SYNTHESIZED_WIRE_29),
	.B(SYNTHESIZED_WIRE_30),
	.ctrl(SYNTHESIZED_WIRE_31),
	.CO(SYNTHESIZED_WIRE_33),
	
	.Z(SYNTHESIZED_WIRE_35),
	
	.Y(SYNTHESIZED_WIRE_48));
	defparam	b2v_inst21.WIDTH = 8;


Register_with_WriteEn	b2v_inst22(
	.clk(CLK),
	.rst(RESET),
	.WriteEn(SYNTHESIZED_WIRE_32),
	.data(RD),
	.A(A));
	defparam	b2v_inst22.W = 16;


CO_flag_Register	b2v_inst23(
	.in(SYNTHESIZED_WIRE_33),
	.clk(CLK),
	.rst(RESET),
	.WriteEn(SYNTHESIZED_WIRE_34),
	.out(SYNTHESIZED_WIRE_38));


Z_flag_Register	b2v_inst24(
	.in(SYNTHESIZED_WIRE_35),
	.clk(CLK),
	.rst(RESET),
	.WriteEn(SYNTHESIZED_WIRE_36),
	.out(SYNTHESIZED_WIRE_37));


controller	b2v_inst39(
	.CLK(CLK),
	.RUN(RUN),
	.RESET(RESET),
	.Z(SYNTHESIZED_WIRE_37),
	.CO(SYNTHESIZED_WIRE_38),
	.S(A[3]),
	.cond(A[10:8]),
	.funct(A[2:0]),
	.op(A[15:14]),
	.Rd(A[13:11]),
	.PCWrite(SYNTHESIZED_WIRE_0),
	.AdrSrc(SYNTHESIZED_WIRE_26),
	.MemWrite(SYNTHESIZED_WIRE_13),
	.IRWrite(SYNTHESIZED_WIRE_32),
	.RegSrc1(SYNTHESIZED_WIRE_17),
	.RegSrc2(SYNTHESIZED_WIRE_40),
	.RegWrite(SYNTHESIZED_WIRE_41),
	.ALUSrcA(SYNTHESIZED_WIRE_7),
	.LRWrite(SYNTHESIZED_WIRE_4),
	.WriteSelect(SYNTHESIZED_WIRE_2),
	.FlagW1(SYNTHESIZED_WIRE_36),
	.FlagW2(SYNTHESIZED_WIRE_34),
	.ALUControl(SYNTHESIZED_WIRE_31),
	.ALUSrcB(SYNTHESIZED_WIRE_12),
	.ResultSrc(SYNTHESIZED_WIRE_25),
	.StateNumber(SYNTHESIZED_WIRE_39));
	defparam	b2v_inst39.S0 = 4'b0000;
	defparam	b2v_inst39.S1 = 4'b0001;
	defparam	b2v_inst39.S10 = 4'b1010;
	defparam	b2v_inst39.S11 = 4'b1011;
	defparam	b2v_inst39.S12 = 4'b1100;
	defparam	b2v_inst39.S13 = 4'b1101;
	defparam	b2v_inst39.S2 = 4'b0010;
	defparam	b2v_inst39.S3 = 4'b0011;
	defparam	b2v_inst39.S4 = 4'b0100;
	defparam	b2v_inst39.S5 = 4'b0101;
	defparam	b2v_inst39.S6 = 4'b0110;
	defparam	b2v_inst39.S7 = 4'b0111;
	defparam	b2v_inst39.S8 = 4'b1000;
	defparam	b2v_inst39.S9 = 4'b1001;


Simple_Register	b2v_inst4(
	.clk(CLK),
	.rst(RESET),
	.in(RD[7:0]),
	.out(SYNTHESIZED_WIRE_21));
	defparam	b2v_inst4.W = 8;


State_Register	b2v_inst40(
	.rst(RESET),
	.in(SYNTHESIZED_WIRE_39),
	.out(CurrentState));
	defparam	b2v_inst40.W = 4;


mux2_1	b2v_inst5(
	.s(SYNTHESIZED_WIRE_40),
	.a0(A[7:5]),
	.a1(A[13:11]),
	.y(SYNTHESIZED_WIRE_43));
	defparam	b2v_inst5.WIDTH = 3;


constant	b2v_inst6(
	.out(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst6.value = 8'b00000001;
	defparam	b2v_inst6.WIDTH = 8;


RegFile	b2v_inst7(
	.CLK(CLK),
	.RegWrite(SYNTHESIZED_WIRE_41),
	.A1(SYNTHESIZED_WIRE_42),
	.A2(SYNTHESIZED_WIRE_43),
	.A3(A[13:11]),
	.PC(y),
	.WD3(y),
	.RD1(SYNTHESIZED_WIRE_5),
	.RD2(SYNTHESIZED_WIRE_6));


Extend_8_to_16	b2v_inst8(
	.in(SYNTHESIZED_WIRE_44),
	.out(SYNTHESIZED_WIRE_45));


Immediate_Extend	b2v_inst9(
	.in(A[7:3]),
	.out(SYNTHESIZED_WIRE_47));

assign	Result = y;

endmodule
