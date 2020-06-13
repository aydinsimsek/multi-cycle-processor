module ALU (A,B,ctrl,Y,CO,OVF,Z,N);
parameter WIDTH = 8; // data width of the inputs and output 
input [WIDTH-1:0] A,B;
input [2:0] ctrl;
output [WIDTH-1:0] Y;
reg [WIDTH-1:0] Y; 
output CO,OVF,Z,N;
reg CO,OVF,Z,N;

always @(*) 
begin 
	case (ctrl)
		3'b000: 
			begin 
			Y = A+B;
			if (Y == 0)
			Z = 1; 
			else Z = 0;
			if (Y[WIDTH-1] == 1)
			N = 1;  
			else N=0;
			if ((A+B) >= 2**WIDTH ) // if result is greater than or equal to 2 to the power WIDTH 
			CO = 1;
			else CO = 0;
			if ((((A[WIDTH-1] == 0) && (B[WIDTH-1] == 0)) && Y[WIDTH-1] == 1) || (((A[WIDTH-1] == 1) && (B[WIDTH-1] == 1)) && Y[WIDTH-1] == 0)) // if adding two positive numbers results a negative number or adding two negative numbers results a positive number then set the OVF flag 
			OVF = 1; 
			else OVF = 0;
			end 
		3'b001: 
			begin 
			Y = A-B;
			if (Y == 0)
			Z = 1; 
			else Z = 0;
			if (Y[WIDTH-1] == 1)
			N = 1;  
			else N = 0; 
			if (Y[WIDTH-1] == 0)
			CO = 1;
			else CO = 0;
			if ((((A[WIDTH-1] == 0) && (B[WIDTH-1] == 1)) && Y[WIDTH-1] == 1) || (((A[WIDTH-1] == 1) && (B[WIDTH-1] == 0)) && Y[WIDTH-1] == 0)) // if subtracting a negative number from a positive number results a negative number or subtracting a positive number from a negative number results a positive number then set the OVF flag 
			OVF = 1; 
			else OVF = 0; 
			end 
		3'b010: 
			begin 
			Y = B-A;
			if (Y == 0)
			Z = 1; 
			else Z = 0; 
			if (Y[WIDTH-1] == 1)
			N = 1;  
			else N = 0; 
			if (Y[WIDTH-1] == 0)
			CO = 1;
			else CO = 0; 
			if ((((B[WIDTH-1] == 0) && (A[WIDTH-1] == 1)) && Y[WIDTH-1] == 1) || (((B[WIDTH-1] == 1) && (A[WIDTH-1] == 0)) && Y[WIDTH-1] == 0))  
			OVF = 1; 
			else OVF = 0; 
			end 
		3'b011: 
			begin 
			Y = A&~B;
			if (Y == 0)
			Z = 1; 
			else Z = 0; 
			if (Y[WIDTH-1] == 1)
			N = 1;  
			else N = 0; 
			end 
		3'b100: 
			begin 
			Y = A&B;
			if (Y == 0)
			Z = 1; 
			else Z = 0; 
			if (Y[WIDTH-1] == 1)
			N = 1;  
			else N = 0; 
			end 
		3'b101: 
			begin 
			Y = A|B;
			if (Y == 0)
			Z = 1; 
			else Z = 0; 
			if (Y[WIDTH-1] == 1)
			N = 1; 
			else N = 0; 	
			end 
		3'b110: 
			begin 
			Y = A^B;
			if (Y == 0)
			Z = 1; 
			else Z = 0; 
			if (Y[WIDTH-1] == 1)
			N = 1;  
			else N = 0; 
			end 
		3'b111: 
			begin 
			Y = 0; // clear operation   
			Z = 1; 
			N = 0; 
			end 
		default: 
			begin 
			// maintain result and flags 
			Y = Y; 
			CO = CO;
			OVF = OVF;
			N = N; 
			Z = Z;   
			end 
	endcase 
end
endmodule 