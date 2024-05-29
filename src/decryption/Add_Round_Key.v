module addRoundKey(out, in, roundKey);
input [127:0] in, roundKey;
output [127:0] out;

assign out = in ^ roundKey;

endmodule
