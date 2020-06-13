module IDM(clk, MemWrite, A, WD, RD);
input clk, MemWrite; 
input [15:0] A, WD;				  
output reg [15:0] RD; 
integer i;  							
reg [15:0] memory [63:0]; // IDM has 64 memory slots and each slot is 16 bits 

initial begin 
// Instruction format for Memory operations:                                    op(15:14)|Rd(13:11)|Rn(10:8)  |imm(7:3)   |funct(2:0)
// Instruction format for Arithmetic and Logic operations:                      op(15:14)|Rd(13:11)|Rn(10:8)  |Rm(7:5)|0|S|funct(2:0)
// Instruction format for Shift operations:                                     op(15:14)|Rd(13:11)|000       |imm(7:3)   |funct(2:0)
// Instruction format for Branch operations except Branch Indirect with Link:   op(15:14)|000      |cond(10:8)|offset(7:3)|funct(2:0)
// Instruction format for Branch Indirect with Link operation:                  op(15:14)|000      |Rn(10:8)  |offset(7:3)|funct(2:0) 

		
		memory[0] = 16'b11_000_000_11110_010;    // LDI  R0,#30          	-- use R0 as pointer  
		memory[1] = 16'b00_000_000_00111_001;    // BL   2's_complement   -- branch with link to address PC+8 (to LDD R1,#3 instruction at memory[9])
		memory[2] = 16'b00_000_000_01100_001;    // BL   sum_of_array     -- branch with link to address PC+13 (to LDI R1,#0 instruction at memory[15])
		memory[3] = 16'b11_100_000_01110_000;    // LDD  R4,[R0,#14]      -- this instruction is used to verify that sum of array is stored in [R0,#14] location 
		memory[4] = 16'b11_001_000_10000_000;    // LDD  R1,[R0,#16]      -- load the ODD number 8'b01010101
		memory[5] = 16'b00_000_000_10110_001;    // BL   even_odd         -- branch with link to address PC+23 (to LDI R2,#1 instruction at memory[28])
		memory[6] = 16'b11_001_000_10001_000;    // LDD  R1,[R0,#17]    	-- load the EVEN number 8'b10101010
		memory[7] = 16'b00_000_000_10100_001;    // BL   even_odd       	-- branch with link to address PC+21 (to LDI R2,#1 instruction at memory[28])
		memory[8] = 16'b1111111111111111;        // END                 	-- end instruction 

// 2's_complement subroutine 		
		memory[9] = 16'b11_001_000_00011_010;    // LDI  R1,#3          	-- load 8'b00000011 with immediate addressing, its 2's complement will be taken   
		memory[10] = 16'b11_010_000_01111_000;   // LDD  R2,[R0,#15]      -- load with direct addressing, get 8'b11111111 from memory  
		memory[11] = 16'b11_011_000_00001_010;   // LDI  R3,#1          	-- load with immediate addressing 
		memory[12] = 16'b10_001_010_001_00_001;  // SUB  R1,R2,R1 	    	-- first take its 1's complement by subtracting it from 8'b11111111
		memory[13] = 16'b10_001_001_011_00_000;  // ADD  R1,R1,R3 	    	-- then add 1 to the result to get its 2's complement 
		memory[14] = 16'b00_000_000_00000_111;   // BX   LR             	-- return from subroutine
		
// sum_of_array subroutine 
		memory[15] = 16'b11_001_000_00000_010;   // LDI  R1,#0            -- R1 will hold the sum, initialize it to 0 
		memory[16] = 16'b11_010_000_01001_000;   // LDD  R2,[R0,#9]    	-- get the first number in the array 
		memory[17] = 16'b11_011_000_01010_000;   // LDD  R3,[R0,#10]      -- get the second number in the array
		memory[18] = 16'b11_100_000_01011_000;   // LDD  R4,[R0,#11]      -- get the third number in the array
		memory[19] = 16'b11_101_000_01100_000;   // LDD  R5,[R0,#12]      -- get the fourth number in the array
		memory[20] = 16'b11_110_000_01101_000;   // LDD  R6,[R0,#13]      -- get the fifth number in the array
		memory[21] = 16'b10_001_001_010_00_000;  // ADD  R1,R1,R2 	      -- sum = sum + R2 
		memory[22] = 16'b10_001_001_011_00_000;  // ADD  R1,R1,R3 	      -- sum = sum + R3 
		memory[23] = 16'b10_001_001_100_00_000;  // ADD  R1,R1,R4 	      -- sum = sum + R4
		memory[24] = 16'b10_001_001_101_00_000;  // ADD  R1,R1,R5 	      -- sum = sum + R5 
		memory[25] = 16'b10_001_001_110_00_000;  // ADD  R1,R1,R6 	      -- compute the overall sum, sum = sum + R6  
		memory[26] = 16'b11_001_000_01110_100;   // STR  R1,[R0,#14]    	-- store the sum into memory   
		memory[27] = 16'b00_000_000_00000_111;   // BX   LR             	-- return from subroutine 

// even_odd subroutine 
		memory[28] = 16'b11_010_000_00001_010;   // LDI  R2,#1
		memory[29] = 16'b10_011_010_001_0_1_100; // ANDS R3,R2,R1 	    	-- logical AND instruction that updates flags 
		memory[30] = 16'b00_000_010_00001_000;   // BNE  label_1        	-- branch if "not zero" to address PC+2 (to LSR R1,#1 instruction at memory[32])
		memory[31] = 16'b00_000_001_00011_000;   // BEQ  label_2        	-- branch if "zero" to address PC+4 (to LSR R1,#1 instruction at memory[35])
		memory[32] = 16'b01_001_000_00001_100;   // LSR  R1,#1         	-- get 0n7n6n5n4n3n2n1
		memory[33] = 16'b01_001_000_00100_000;   // ROL  R1,#4         	-- get n4n3n2n10n7n6n5
		memory[34] = 16'b00_000_000_00000_111;   // BX   LR             	-- return from subroutine
		memory[35] = 16'b01_001_000_00001_100;   // LSR  R1,#1          	-- get 0n7n6n5n4n3n2n1  
		memory[36] = 16'b01_001_000_00100_011;   // LSL  R1,#4          	-- get n4n3n2n10000
		memory[37] = 16'b01_001_000_00001_100;   // LSR  R1,#1          	-- get 0n4n3n2n1000  
		memory[38] = 16'b00_000_000_00000_111;   // BX   LR             	-- return from subroutine
	
			
      // memory locations starting from memory[39] contains data  
		memory[39] = 16'b0000_0000_0000_0001;  
		memory[40] = 16'b0000_0000_0000_0010;
		memory[41] = 16'b0000_0000_0000_0011; 
		memory[42] = 16'b0000_0000_0000_0100;
		memory[43] = 16'b0000_0000_0000_0101; 
		memory[44] = 16'b0000_0000_0000_0000; 
		memory[45] = 16'b0000_0000_1111_1111; 
		memory[46] = 16'b0000_0000_0101_0101;
		memory[47] = 16'b0000_0000_1010_1010; 
		

		for (i=48; i<64; i=i+1)   
			begin 
			memory[i] = i;
			end 
end 

// data is written sequentially 
always @(posedge clk) 
begin 
		if (MemWrite) 
		memory[A] <= WD;
end 

// data is read combinationally 
always @(A)
begin 
		RD = memory[A]; 
end  
endmodule 