module keyExpansion(rk0,rk1,rk2,rk3,rk4,rk5,rk6,rk7,rk8,rk9,rk10,privateKey);
input [127:0] privateKey;
output [127:0] rk0, rk1, rk2, rk3, rk4, rk5, rk6, rk7, rk8, rk9, rk10;

assign rk0 = privateKey;

wire [31:0] temp_word0,temp_word1,temp_word2,temp_word3,temp_word4,temp_word5,temp_word6,temp_word7,temp_word8,temp_word9;

wordMixer w3(.new_word(temp_word0), .word(rk0[31:0]), .round(4'b0001));
wordMixer w7(.new_word(temp_word1), .word(rk1[31:0]), .round(4'b0010));
wordMixer w11(.new_word(temp_word2), .word(rk2[31:0]), .round(4'b0011));
wordMixer w15(.new_word(temp_word3), .word(rk3[31:0]), .round(4'b0100));
wordMixer w19(.new_word(temp_word4), .word(rk4[31:0]), .round(4'b0101));
wordMixer w23(.new_word(temp_word5), .word(rk5[31:0]), .round(4'b0110));
wordMixer w27(.new_word(temp_word6), .word(rk6[31:0]), .round(4'b0111));
wordMixer w31(.new_word(temp_word7), .word(rk7[31:0]), .round(4'b1000));
wordMixer w35(.new_word(temp_word8), .word(rk8[31:0]), .round(4'b1001));
wordMixer w39(.new_word(temp_word9), .word(rk9[31:0]), .round(4'b1010));

assign rk1[127:96] = temp_word0 ^ rk0[127:96];
assign rk1[95:64] = rk1[127:96] ^ rk0[95:64];
assign rk1[63:32] = rk1[95:64] ^ rk0[63:32];
assign rk1[31:0] = rk1[63:32] ^ rk0[31:0];

assign rk2[127:96] = temp_word1 ^ rk1[127:96];
assign rk2[95:64] = rk2[127:96] ^ rk1[95:64];
assign rk2[63:32] = rk2[95:64] ^ rk1[63:32];
assign rk2[31:0] = rk2[63:32] ^ rk1[31:0];

assign rk3[127:96] = temp_word2 ^ rk2[127:96];
assign rk3[95:64] = rk3[127:96] ^ rk2[95:64];
assign rk3[63:32] = rk3[95:64] ^ rk2[63:32];
assign rk3[31:0] = rk3[63:32] ^ rk2[31:0];

assign rk4[127:96] = temp_word3 ^ rk3[127:96];
assign rk4[95:64] = rk4[127:96] ^ rk3[95:64];
assign rk4[63:32] = rk4[95:64] ^ rk3[63:32];
assign rk4[31:0] = rk4[63:32] ^ rk3[31:0];

assign rk5[127:96] = temp_word4 ^ rk4[127:96];
assign rk5[95:64] = rk5[127:96] ^ rk4[95:64];
assign rk5[63:32] = rk5[95:64] ^ rk4[63:32];
assign rk5[31:0] = rk5[63:32] ^ rk4[31:0];

assign rk6[127:96] = temp_word5 ^ rk5[127:96];
assign rk6[95:64] = rk6[127:96] ^ rk5[95:64];
assign rk6[63:32] = rk6[95:64] ^ rk5[63:32];
assign rk6[31:0] = rk6[63:32] ^ rk5[31:0];

assign rk7[127:96] = temp_word6 ^ rk6[127:96];
assign rk7[95:64] = rk7[127:96] ^ rk6[95:64];
assign rk7[63:32] = rk7[95:64] ^ rk6[63:32];
assign rk7[31:0] = rk7[63:32] ^ rk6[31:0];

assign rk8[127:96] = temp_word7 ^ rk7[127:96];
assign rk8[95:64] = rk8[127:96] ^ rk7[95:64];
assign rk8[63:32] = rk8[95:64] ^ rk7[63:32];
assign rk8[31:0] = rk8[63:32] ^ rk7[31:0];

assign rk9[127:96] = temp_word8 ^ rk8[127:96];
assign rk9[95:64] = rk9[127:96] ^ rk8[95:64];
assign rk9[63:32] = rk9[95:64] ^ rk8[63:32];
assign rk9[31:0] = rk9[63:32] ^ rk8[31:0];

assign rk10[127:96] = temp_word9 ^ rk9[127:96];
assign rk10[95:64] = rk10[127:96] ^ rk9[95:64];
assign rk10[63:32] = rk10[95:64] ^ rk9[63:32];
assign rk10[31:0] = rk10[63:32] ^ rk9[31:0];

endmodule

module wordMixer(new_word, word, round);
output reg [31:0] new_word;
input [31:0] word;
input [3:0] round;

wire [31:0] temp_word;

sub_box s0(temp_word[31:24],word[23:16]);
sub_box s1(temp_word[23:16],word[15:8]);
sub_box s2(temp_word[15:8],word[7:0]);
sub_box s3(temp_word[7:0],word[31:24]);

//assign temp_word[7:0] = word[15:8];
//assign temp_word[15:8] = word[23:16];
//assign temp_word[23:16] = word[31:24];
//assign temp_word[31:24] = word[7:0];

always @ (temp_word)
begin
case (round)
  4'b0001: new_word <= temp_word ^ 32'h01000000;
  4'b0010: new_word <= temp_word ^ 32'h02000000;
  4'b0011: new_word <= temp_word ^ 32'h04000000;
  4'b0100: new_word <= temp_word ^ 32'h08000000;
  4'b0101: new_word <= temp_word ^ 32'h10000000;
  4'b0110: new_word <= temp_word ^ 32'h20000000;
  4'b0111: new_word <= temp_word ^ 32'h40000000;
  4'b1000: new_word <= temp_word ^ 32'h80000000;
  4'b1001: new_word <= temp_word ^ 32'h1b000000;
  4'b1010: new_word <= temp_word ^ 32'h36000000;  
  default: new_word <= 0;
endcase

end


endmodule

