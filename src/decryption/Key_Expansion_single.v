module getNextRoundKey(nextKey, prevKey, roundConstant, clk);
output wire [127:0] nextKey;
input wire [127:0] prevKey;
input wire [31:0] roundConstant;
input clk;

wire [31:0] new_word;
wire [31:0] temp_word;

//reg [31:0] roundConstant_reg;
//reg [127:0] prev_round_key_reg;

//wire [127:0] new_round_key;

//reg [3:0] key_expansion_round;
//reg key_expansion_completed;

sub_box sub0(temp_word[31:24],prevKey[23:16], clk);
sub_box sub1(temp_word[23:16],prevKey[15:8], clk);
sub_box sub2(temp_word[15:8],prevKey[7:0], clk);
sub_box sub3(temp_word[7:0],prevKey[31:24], clk);

assign new_word = temp_word ^ roundConstant;

assign nextKey[127:96] = new_word ^ prevKey[127:96];
assign nextKey[95:64] = nextKey[127:96] ^ prevKey[95:64];
assign nextKey[63:32] = nextKey[95:64] ^ prevKey[63:32];
assign nextKey[31:0] = nextKey[63:32] ^ prevKey[31:0];

endmodule


