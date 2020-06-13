module CO_flag_Register (in,clk,rst,WriteEn,out);
input clk,rst,WriteEn;
input in;
output reg out;

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