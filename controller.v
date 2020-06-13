module controller (CLK,RUN,RESET,PCWrite,AdrSrc,MemWrite,IRWrite,RegSrc1,RegSrc2,RegWrite,ALUSrcA,ALUSrcB,ALUControl
						 ,ResultSrc,LRWrite,WriteSelect,FlagW1,FlagW2,StateNumber,Z,CO,op,funct,Rd,cond,S);    
						 
input CLK, RUN, RESET, Z, CO, S;
input [1:0] op;
input [2:0] funct, Rd, cond; 

output reg PCWrite, AdrSrc, MemWrite, IRWrite, RegSrc1, RegSrc2, RegWrite, ALUSrcA, LRWrite, WriteSelect, FlagW1, FlagW2; 
output reg [1:0] ALUSrcB; 
output reg [2:0] ALUControl, ResultSrc;
output reg [3:0] StateNumber;  

parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, S4 = 4'b0100, S5 = 4'b0101, 
			 S6 = 4'b0110, S7 = 4'b0111, S8 = 4'b1000, S9 = 4'b1001, S10 = 4'b1010, S11 = 4'b1011, S12 = 4'b1100, S13 = 4'b1101;   

reg [3:0] state, next_state; 

always @(posedge CLK) 
begin 
if (RESET == 1) 
state <= S0; 
else 
state <= next_state; 
end 


always @(state)  
begin 
if (RUN == 1) 
	begin       
		case (state)  
			S0: // Fetch state 
			begin 
			StateNumber = 4'b0000; 
			PCWrite = 1;
			AdrSrc = 0; 
			MemWrite = 0; 
			IRWrite = 1; 
			RegWrite = 0; 
			ALUSrcA = 1; 
			ALUSrcB = 2'b10; 
			ALUControl = 3'b000; 
			ResultSrc = 3'b010; 
			LRWrite = 0; 
			WriteSelect = 0; 
			FlagW1 = 0; 
			FlagW2 = 0; 
			next_state = S13; 
			end 
			
			S13: // Extra state for writing nextPC to Link Register 
			begin 
			StateNumber = 4'b1101; 
			PCWrite = 0;    
			AdrSrc = 0; 
			MemWrite = 0; 
			IRWrite = 0; 
			RegSrc1 = 0; 
			RegSrc2 = 0; 
			RegWrite = 0; 
			ALUSrcA = 0; 
			ALUSrcB = 2'b00; 
			ALUControl = 3'b000; 
			ResultSrc = 3'b000; 
			WriteSelect = 0;
			FlagW1 = 0; 
			FlagW2 = 0;
			next_state = S1; 
			if (op == 2'b00 && (funct == 3'b001 || funct == 3'b010)) // if instruction is BL or BLX then LRWrite is 1 
			LRWrite = 1; 
			else 
			LRWrite = 0; 
			end 
			
			S1: // Decode state 
			begin
			StateNumber = 4'b0001; 
			PCWrite = 0; 
			AdrSrc = 0; 
			MemWrite = 0; 
			IRWrite = 0; 
			RegWrite = 0; 
			WriteSelect = 0; 
			ALUSrcA = 1;   
			ALUSrcB = 2'b10; 
			ALUControl = 3'b000; 
			ResultSrc = 3'b010; 
			LRWrite = 0; 
			WriteSelect = 0; 
			if (op == 2'b11 && funct == 3'b010) // if LDI instruction 
			next_state = S2; 
			else if (op == 2'b11 && funct == 3'b000) // if LDD instruction   
			begin 
			RegSrc1 = 0; 
			next_state = S3;
			end 
			else if (op == 2'b11 && funct == 3'b100) // if STR instruction 
			begin 
			RegSrc1 = 0; 
			RegSrc2 = 1; 
			next_state = S3; 
			end 
			else if (op == 2'b10) // if instruction is an arithmetic or a logic instruction 
			begin 
			RegSrc1 = 0; 
			RegSrc2 = 0; 
			next_state = S4;
		   end 	
			else if (op == 2'b01) // if instruction is a shift instruction 
			begin 
			RegSrc2 = 1; 
			next_state = S5;
			end 
	 		else if (op == 2'b00 && funct == 3'b111) // if instruction is BX LR  
			next_state = S12; 
			else if (op == 2'b00 && funct == 3'b010) // if instruction is BLX 
			begin 
			RegSrc1 = 0; 
			next_state = S6;
			end 
			else if (op == 2'b00 && (funct != 3'b111 && funct != 3'b010)) // if instruction is a branch instruction other than BX LR and BLX 
			begin
		   RegSrc1 = 1; 	
			next_state = S6;
		   end 	
			else if (op == 2'b11 && funct == 3'b111) // if END instruction 
			next_state = S1; // halt the execution 
			end  
			
			S2: // LDI instruction's Execute state 
			begin 
			StateNumber = 4'b0010; 
			PCWrite = 0; 
			MemWrite = 0; 
			IRWrite = 0; 
			RegWrite = 1; 
			ResultSrc = 3'b100; 
			LRWrite = 0; 
			WriteSelect = 0; 
			FlagW1 = 0; 
			FlagW2 = 0;
			next_state = S0;
			if (Rd == 3'b111) // if write to PC takes place 		 
			PCWrite = 1; 
			else 
			PCWrite = 0; 
			end 
			
			S3: // LDD or STR instruction's Execute stage to calculate memory address 
			begin 
			StateNumber = 4'b0011; 
			PCWrite = 0; 
			MemWrite = 0; 
			IRWrite = 0; 
			RegWrite = 0; 
			ALUSrcA = 0; 
			ALUSrcB = 2'b01; 
			ALUControl = 3'b000; 
			LRWrite = 0; 
			WriteSelect = 0; 
			FlagW1 = 0; 
			FlagW2 = 0;
			if (funct == 3'b000) // if it's LDD instruction 
			next_state = S7;
			else if (funct == 3'b100) // if it's STR instruction 
			next_state = S9; 
			end 
			
			S4: // Arithmetic or Logic instruction's Execute state to calculate the result 
			begin  
			StateNumber = 4'b0100; 
			PCWrite = 0; 
			MemWrite = 0; 
			IRWrite = 0; 
			RegWrite = 0; 
			ALUSrcA = 0; 
			ALUSrcB = 2'b00; 
			LRWrite = 0; 
			WriteSelect = 0; 
			next_state = S10;
			if (funct == 3'b000) // if ADD instruction 
			ALUControl = 3'b000;
			else if (funct == 3'b001) // if SUB instruction 
			ALUControl = 3'b001;
			else if (funct == 3'b100) // if AND instruction 
			ALUControl = 3'b100; 
			else if (funct == 3'b101) // if ORR instruction 
			ALUControl = 3'b101; 
			else if (funct == 3'b110) // if XOR instruction 
			ALUControl = 3'b110; 
			else if (funct == 3'b111) // if CLR instruction 
			ALUControl = 3'b111; 	 
			if (S == 1 && (funct == 3'b000 || funct == 3'b001)) 
			begin // if S field is 1 and instruction is ADD or SUB then update Z,CO flags
			FlagW1 = 1;
			FlagW2 = 1; 
			end 
			else if (S == 1 && (funct != 3'b000 && funct != 3'b001)) 
			begin	// if S field is 1 and instruction is AND or ORR or XOR or CLR then update only Z flag 
			FlagW1 = 1; 
			FlagW2 = 0; 
			end
			else if (S == 0)  
			begin // if S field is 0 then do NOT update flags 
			FlagW1 = 0; 
			FlagW2 = 0; 
			end 
			end 
			
			S5: // Shift instruction's Execute state to get the content of the register to be shifted/rotated 
			begin
			StateNumber = 4'b0101; 
			PCWrite = 0; 
			MemWrite = 0; 
			IRWrite = 0; 
			RegWrite = 0;
			LRWrite = 0; 
			WriteSelect = 0;		
			FlagW1 = 0; 
			FlagW2 = 0;
			next_state = S11; 
			end 
			
			S6: // Execute state of branch instruction (other than BX LR) to calculate BTA 
			begin 
			StateNumber = 4'b0110; 
			MemWrite = 0; 
			IRWrite = 0; 
			RegWrite = 0; 
			ALUSrcA = 0;  
			ALUSrcB = 2'b01; 
			ALUControl = 3'b000; 
			ResultSrc = 3'b010;
			LRWrite = 0; 
			WriteSelect = 0; 
			next_state = S0; 
			if ((cond == 3'b001 && Z == 0) || (cond == 3'b010 && Z == 1) || (cond == 3'b011 && CO == 0) || (cond == 3'b100 && CO == 1)) 
			PCWrite = 0; 
			else 
			PCWrite = 1; 
			end 
			
			S7: // LDD instruction's Execute state to read data from IDM   
			begin 
			StateNumber = 4'b0111; 
			PCWrite = 0; 
			AdrSrc = 1; 
			MemWrite = 0; 
			IRWrite = 0; 
			RegWrite = 0; 
			ResultSrc = 3'b000; 
			LRWrite = 0; 
			WriteSelect = 0;
			FlagW1 = 0; 
			FlagW2 = 0;
			next_state = S8; 
			end 
			
			S8: // LDD instruction's Execute state to write data to destination register 
			begin 
			StateNumber = 4'b1000; 
			PCWrite = 0; 
			MemWrite = 0; 
			IRWrite = 0; 
			RegWrite = 1; 
			ResultSrc = 3'b001; 
			LRWrite = 0; 
			WriteSelect = 0;
			FlagW1 = 0; 
			FlagW2 = 0;
			next_state = S0; 
			if (Rd == 3'b111) // if write to PC takes place 
			PCWrite = 1; 
			else 
			PCWrite = 0; 
			end 
			
			S9: // STR instruction's Execute state to write data to IDM 
			begin 
			StateNumber = 4'b1001; 
			PCWrite = 0; 
			AdrSrc = 1; 
			MemWrite = 1; 
			IRWrite = 0; 
			RegWrite = 0; 
			ResultSrc = 3'b000; 
			LRWrite = 0; 
			WriteSelect = 0;
			FlagW1 = 0; 
			FlagW2 = 0;
			next_state = S0; 
			end 
			
			S10: // Arithmetic or Logic instruction's Execute state to write the result to destination register 
			begin 
			StateNumber = 4'b1010; 
			PCWrite = 0; 
			MemWrite = 0; 
			IRWrite = 0; 
			RegWrite = 1; 
			ResultSrc = 3'b000; 
			LRWrite = 0; 
			WriteSelect = 0;
			FlagW1 = 0; 
			FlagW2 = 0;
			next_state = S0; 
			if (Rd == 3'b111) // if write to PC takes place 
			PCWrite = 1; 
			else 
			PCWrite = 0;
			end 
			
			S11: // Shift instruction's Execute state to write the shifted/rotated result back to the register  
			begin 
			StateNumber = 4'b1011; 
			PCWrite = 0; 
			MemWrite = 0; 
			IRWrite = 0; 
			RegWrite = 1; 
			ResultSrc = 3'b011; 
			LRWrite = 0; 
			WriteSelect = 0;
			FlagW1 = 0; 
			FlagW2 = 0;
			next_state = S0; 
			if (Rd == 3'b111) // if write to PC takes place 
			PCWrite = 1; 
			else 
			PCWrite = 0;
			end 
			
			S12: // BX LR instruction's Execute state 
			begin 
			StateNumber = 4'b1100;  
			PCWrite = 1;
			MemWrite = 0; 
			IRWrite = 0; 
			RegWrite = 0;
			LRWrite = 0;
			WriteSelect = 1; // get the nextPC from LR 
			FlagW1 = 0; 
			FlagW2 = 0;		
			next_state = S0; 
			end 
			
		endcase 
	end 	
end 
endmodule 
