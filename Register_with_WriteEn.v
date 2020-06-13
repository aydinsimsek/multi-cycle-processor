module Register_with_WriteEn #(parameter W=16) (data,clk,rst,WriteEn,A);
input clk,rst,WriteEn;
input [W-1:0] data;
output reg [W-1:0] A;

always @ (posedge clk) 
begin 
if (rst) 
A <= 0; 
else if (~rst && WriteEn)  
A <= data;
else if (~rst && ~WriteEn)
A <= A; 
end 
endmodule  