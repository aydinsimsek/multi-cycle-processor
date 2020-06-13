module register_WE #(parameter W=16) (data,clk,rst,WriteEn,B);
input clk,rst,WriteEn;
input [W-1:0] data;
output reg [W-1:0] B;

always @ (posedge clk) 
begin 
if (rst) 
B <= 0; 
else if (~rst && WriteEn)  
B <= data;
else if (~rst && ~WriteEn)
B <= B; 
end 
endmodule  