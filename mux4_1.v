module mux4_1(a3,a2,a1,a0,s,y);
parameter WIDTH = 8; 
input [WIDTH-1:0] a3,a2,a1,a0; 
input [1:0] s;
output [WIDTH-1:0] y; 
reg [WIDTH-1:0] y; 


always @ (a3,a2,a1,a0,s)     	 
begin 
if (s == 2'b00) 
y <= a0;
else if (s == 2'b01) 
y <= a1;
else if (s == 2'b10) 
y <= a2;
else if (s == 2'b11) 
y <= a3;
end 
endmodule 