module Two_Inputs_Simple_Register #(parameter W=8) (RD1,RD2,clk,rst,A,B);
input clk,rst;
input [W-1:0] RD1,RD2;
output reg [W-1:0] A,B;

always @ (posedge clk) 
begin 
	if (rst) 
		begin
		A <= 0; 
		B <= 0;
		end 
	else 
		begin 
		A <= RD1;
		B <= RD2;
		end 
end 
endmodule  