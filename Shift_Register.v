module Shift_Register(in,shift_amount,shift_type,out);

input [7:0] in;
input [4:0] shift_amount; 
input [2:0] shift_type; 
output reg [7:0] out;  

always @(in,shift_type,shift_amount) 
begin 
	if (shift_type == 3'b000) 
		out = ((in << shift_amount) | (in >> (5'b01000-shift_amount))); // rotate left 			
	else if (shift_type == 3'b001) 
		out = ((in >> shift_amount) | (in << (5'b01000-shift_amount))); // rotate right 				
	else if (shift_type == 3'b010) 
		out = $signed(in) >>> shift_amount; // arithmetic shift right 	 
	else if (shift_type == 3'b011)  
		out = in << shift_amount; // logical shift left	
	else if (shift_type == 3'b100) 
		out = in >> shift_amount; // logical shift right  
	else 
		out = in; 
end 
endmodule 