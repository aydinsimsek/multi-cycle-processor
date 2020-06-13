module Simple_Register #(parameter W=8) (in,clk,rst,out);
input clk,rst;
input [W-1:0] in;
output reg [W-1:0] out;

always @ (posedge clk) 
begin 
	if (rst) 
	out <= 0; 
	else 
	out <= in;
end 
endmodule  