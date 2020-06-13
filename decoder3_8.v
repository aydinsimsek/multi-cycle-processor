module decoder3_8(select0, select1, select2, out0, out1, out2, out3, out4, out5, out6, out7);
	
input select0, select1, select2;
output reg out0, out1, out2, out3, out4, out5, out6, out7;
	
always @(select0,select1,select2)													
begin
	case ({select2, select1, select0})												
		3'b000: {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b00000001;
		3'b001: {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b00000010;
		3'b010: {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b00000100;
		3'b011: {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b00001000;
		3'b100: {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b00010000;
		3'b101: {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b00100000;
		3'b110: {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b01000000;
		3'b111: {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b10000000;
		default: {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b00000000;
	endcase
end
endmodule 