module constant (out);
parameter WIDTH = 8; 
parameter value = 8'b0; 
output [WIDTH-1:0] out;
wire [WIDTH-1:0] out;
assign out = value;
endmodule 
