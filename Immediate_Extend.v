module Immediate_Extend(in,out);

input [4:0] in; 
output reg [7:0] out; 

always @(in) 
out = {3'b0, in}; //zero extend the 5 bit immediate to 8 bits 

endmodule 