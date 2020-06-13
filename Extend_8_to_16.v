module Extend_8_to_16(in,out);

input [7:0] in; 
output reg [15:0] out; 

always @(in) 
out = {8'b0, in}; //zero extend the 8 bit input to 16 bits 

endmodule 

