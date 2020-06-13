module mux2_1(a1,a0,s,y);
parameter WIDTH = 3; 
input [WIDTH-1:0] a1,a0; 
input s;
output [WIDTH-1:0] y;  
wire [WIDTH-1:0] y; 

assign y = s ? a1 : a0;  
endmodule 