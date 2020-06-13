module Link_Register #(parameter W=8) (in,clk,rst,WriteEn,out);
input clk,rst,WriteEn;
input [W-1:0] in;
output reg [W-1:0] out;

always @ (posedge clk) 
begin 
if (rst) 
out <= 0; 
else if (~rst && WriteEn)  
out <= in;
else if (~rst && ~WriteEn)
out <= out; 
end 
endmodule  