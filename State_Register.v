module State_Register #(parameter W=4) (in,rst,out); 

input rst; 
input [W-1:0] in; 
output reg [W-1:0] out; 

always @(in) 
begin 
	if (rst)
	out = 0; 
	else 
	out = in;  
end 

endmodule 