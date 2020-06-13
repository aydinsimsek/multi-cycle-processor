module RegFile(
	CLK,
	RegWrite,
	A1,
	A2,
	A3,
	PC,
	WD3,
	RD1,
	RD2
);


input wire	CLK;
input wire	RegWrite;
input wire	[2:0] A1;
input wire	[2:0] A2;
input wire	[2:0] A3;
input wire	[7:0] PC;
input wire	[7:0] WD3;
output wire	[7:0] RD1;
output wire	[7:0] RD2;

wire	[7:0] SYNTHESIZED_WIRE_40;
wire	[7:0] SYNTHESIZED_WIRE_41;
wire	[7:0] SYNTHESIZED_WIRE_42;
wire	[7:0] SYNTHESIZED_WIRE_43;
wire	[7:0] SYNTHESIZED_WIRE_44;
wire	[7:0] SYNTHESIZED_WIRE_45;
wire	[7:0] SYNTHESIZED_WIRE_46;
wire	[7:0] SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;

assign	SYNTHESIZED_WIRE_48 = 0;
assign	SYNTHESIZED_WIRE_23 = 1;




decoder3_8	b2v_inst(
	.select0(A3[0]),
	.select1(A3[1]),
	.select2(A3[2]),
	.out0(SYNTHESIZED_WIRE_32),
	.out1(SYNTHESIZED_WIRE_33),
	.out2(SYNTHESIZED_WIRE_34),
	.out3(SYNTHESIZED_WIRE_35),
	.out4(SYNTHESIZED_WIRE_36),
	.out5(SYNTHESIZED_WIRE_37),
	.out6(SYNTHESIZED_WIRE_38),
	.out7(SYNTHESIZED_WIRE_39));


mux8_1	b2v_inst1(
	.a0(SYNTHESIZED_WIRE_40),
	.a1(SYNTHESIZED_WIRE_41),
	.a2(SYNTHESIZED_WIRE_42),
	.a3(SYNTHESIZED_WIRE_43),
	.a4(SYNTHESIZED_WIRE_44),
	.a5(SYNTHESIZED_WIRE_45),
	.a6(SYNTHESIZED_WIRE_46),
	.a7(SYNTHESIZED_WIRE_47),
	.s(A1),
	.y(RD1));
	defparam	b2v_inst1.WIDTH = 8;


Register_with_WriteEn	b2v_inst10(
	.clk(CLK),
	.rst(SYNTHESIZED_WIRE_48),
	.WriteEn(SYNTHESIZED_WIRE_9),
	.data(WD3),
	.A(SYNTHESIZED_WIRE_46));
	defparam	b2v_inst10.W = 8;


Register_with_WriteEn	b2v_inst11(
	.clk(CLK),
	.rst(SYNTHESIZED_WIRE_48),
	.WriteEn(SYNTHESIZED_WIRE_11),
	.data(WD3),
	.A(SYNTHESIZED_WIRE_45));
	defparam	b2v_inst11.W = 8;


Register_with_WriteEn	b2v_inst12(
	.clk(CLK),
	.rst(SYNTHESIZED_WIRE_48),
	.WriteEn(SYNTHESIZED_WIRE_13),
	.data(WD3),
	.A(SYNTHESIZED_WIRE_44));
	defparam	b2v_inst12.W = 8;


Register_with_WriteEn	b2v_inst13(
	.clk(CLK),
	.rst(SYNTHESIZED_WIRE_48),
	.WriteEn(SYNTHESIZED_WIRE_15),
	.data(WD3),
	.A(SYNTHESIZED_WIRE_43));
	defparam	b2v_inst13.W = 8;


Register_with_WriteEn	b2v_inst14(
	.clk(CLK),
	.rst(SYNTHESIZED_WIRE_48),
	.WriteEn(SYNTHESIZED_WIRE_17),
	.data(WD3),
	.A(SYNTHESIZED_WIRE_42));
	defparam	b2v_inst14.W = 8;


Register_with_WriteEn	b2v_inst15(
	.clk(CLK),
	.rst(SYNTHESIZED_WIRE_48),
	.WriteEn(SYNTHESIZED_WIRE_19),
	.data(WD3),
	.A(SYNTHESIZED_WIRE_41));
	defparam	b2v_inst15.W = 8;


Register_with_WriteEn	b2v_inst16(
	.clk(CLK),
	.rst(SYNTHESIZED_WIRE_48),
	.WriteEn(SYNTHESIZED_WIRE_21),
	.data(WD3),
	.A(SYNTHESIZED_WIRE_40));
	defparam	b2v_inst16.W = 8;


Register_with_WriteEn	b2v_inst17(
	.clk(CLK),
	.rst(SYNTHESIZED_WIRE_48),
	.WriteEn(SYNTHESIZED_WIRE_23),
	.data(PC),
	.A(SYNTHESIZED_WIRE_47));
	defparam	b2v_inst17.W = 8;


mux8_1	b2v_inst18(
	.a0(SYNTHESIZED_WIRE_40),
	.a1(SYNTHESIZED_WIRE_41),
	.a2(SYNTHESIZED_WIRE_42),
	.a3(SYNTHESIZED_WIRE_43),
	.a4(SYNTHESIZED_WIRE_44),
	.a5(SYNTHESIZED_WIRE_45),
	.a6(SYNTHESIZED_WIRE_46),
	.a7(SYNTHESIZED_WIRE_47),
	.s(A2),
	.y(RD2));
	defparam	b2v_inst18.WIDTH = 8;

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_32 & RegWrite;

assign	SYNTHESIZED_WIRE_19 = SYNTHESIZED_WIRE_33 & RegWrite;



assign	SYNTHESIZED_WIRE_17 = SYNTHESIZED_WIRE_34 & RegWrite;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_35 & RegWrite;

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_36 & RegWrite;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_37 & RegWrite;

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_38 & RegWrite;



endmodule
