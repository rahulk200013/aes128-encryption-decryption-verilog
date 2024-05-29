module aes128(out,in,privateKey,clk,rst);
output reg [127:0] out;
input [127:0] in,privateKey;
input clk,rst;

reg [127:0] plainText;
wire [127:0] cipherText;

//Reg to store for all round keys
reg [127:0] rk0_reg, rk1_reg, rk2_reg, rk3_reg, rk4_reg, rk5_reg, rk6_reg, rk7_reg, rk8_reg, rk9_reg, rk10_reg;

//Input wire to round key registers
wire [127:0] rk1, rk2, rk3, rk4, rk5, rk6, rk7, rk8, rk9, rk10;

//Wire for all intermediate connection
wire [127:0] temp[38:0];

//Generate all round keys 
//keyExpansion k0(rk0, rk1, rk2, rk3, rk4, rk5, rk6, rk7, rk8, rk9, rk10, key);

///////////////////////////////////////////////////////////////////////////////////
////                       Round Key expansion                                 ////
///////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////
////                         Substitute Bytes                                  ////
///////////////////////////////////////////////////////////////////////////////////

//reg [127:0] prev_state_matrix_reg, new_state_matrix_reg;
//wire [127:0] prev_state_matrix, new_state_matrix;

//sub_box s0(new_state_matrix[127:120], prev_state_matrix_reg[127:120]);
//sub_box s1(new_state_matrix[119:112], prev_state_matrix_reg[119:112]);
//sub_box s2(new_state_matrix[111:104], prev_state_matrix_reg[111:104]);
//sub_box s3(new_state_matrix[103:96], prev_state_matrix_reg[103:96]);
//sub_box s4(new_state_matrix[95:88], prev_state_matrix_reg[95:88]);
//sub_box s5(new_state_matrix[87:80], prev_state_matrix_reg[87:80]);
//sub_box s6(new_state_matrix[79:72], prev_state_matrix_reg[79:72]);
//sub_box s7(new_state_matrix[71:64], prev_state_matrix_reg[71:64]);
//sub_box s8(new_state_matrix[63:56], prev_state_matrix_reg[63:56]);
//sub_box s9(new_state_matrix[55:48], prev_state_matrix_reg[55:48]);
//sub_box s10(new_state_matrix[47:40], prev_state_matrix_reg[47:40]);
//sub_box s11(new_state_matrix[39:32], prev_state_matrix_reg[39:32]);
//sub_box s12(new_state_matrix[31:24], prev_state_matrix_reg[31:24]);
//sub_box s13(new_state_matrix[23:16], prev_state_matrix_reg[23:16]);
//sub_box s14(new_state_matrix[15:8], prev_state_matrix_reg[15:8]);
//sub_box s15(new_state_matrix[7:0], prev_state_matrix_reg[7:0]);

///////////////////////////////////////////////////////////////////////////////////

wire [127:0] state_matrix[10:0];

reg [3:0] round_count;
reg encryption_completed;
reg [127:0] r0_state_matrix_reg, r1_state_matrix_reg, r2_state_matrix_reg, r3_state_matrix_reg, r4_state_matrix_reg, r5_state_matrix_reg, r6_state_matrix_reg, r7_state_matrix_reg, r8_state_matrix_reg, r9_state_matrix_reg, r10_state_matrix_reg;

//Pre-round
addRoundKey a0(state_matrix[0],plainText,rk0_reg);

//Round 1
getNextRoundKey r1(rk1, rk0_reg, 32'h01000000, clk);
subBytes x29(temp[28], r0_state_matrix_reg, clk);
shiftRows x0(temp[0], temp[28]);
mixColumn x1(temp[1], temp[0]);
addRoundKey x2(state_matrix[1],temp[1],rk1_reg);

//Round 2
getNextRoundKey r2(rk2, rk1_reg, 32'h02000000, clk);
subBytes x30(temp[19], r1_state_matrix_reg, clk);
shiftRows x3(temp[2], temp[19]);
mixColumn x4(temp[3], temp[2]);
addRoundKey x5(state_matrix[2],temp[3],rk2_reg);

//Round 3
getNextRoundKey r3(rk3, rk2_reg, 32'h04000000, clk);
subBytes x31(temp[20], r2_state_matrix_reg, clk);
shiftRows x6(temp[4], temp[20]);
mixColumn x7(temp[5], temp[4]);
addRoundKey x8(state_matrix[3],temp[5],rk3_reg);

//Round 4
getNextRoundKey r4(rk4, rk3_reg, 32'h08000000, clk);
subBytes x32(temp[21], r3_state_matrix_reg, clk);
shiftRows x9(temp[6], temp[21]);
mixColumn x10(temp[7], temp[6]);
addRoundKey x11(state_matrix[4],temp[7],rk4_reg);

//Round 5
getNextRoundKey r5(rk5, rk4_reg, 32'h10000000, clk);
subBytes x33(temp[22], r4_state_matrix_reg, clk);
shiftRows x12(temp[8], temp[22]);
mixColumn x13(temp[9], temp[8]);
addRoundKey x14(state_matrix[5],temp[9],rk5_reg);

//Round 6
getNextRoundKey r6(rk6, rk5_reg, 32'h20000000, clk);
subBytes x34(temp[23], r5_state_matrix_reg, clk);
shiftRows x15(temp[10], temp[23]);
mixColumn x16(temp[11], temp[10]);
addRoundKey x17(state_matrix[6],temp[11],rk6_reg);

//Round 7
getNextRoundKey r7(rk7, rk6_reg, 32'h40000000, clk);
subBytes x35(temp[24], r6_state_matrix_reg, clk);
shiftRows x18(temp[12], temp[24]);
mixColumn x19(temp[13], temp[12]);
addRoundKey x20(state_matrix[7],temp[13],rk7_reg);

//Round 8
getNextRoundKey r8(rk8, rk7_reg, 32'h80000000, clk);
subBytes x36(temp[25], r7_state_matrix_reg, clk);
shiftRows x21(temp[14], temp[25]);
mixColumn x22(temp[15], temp[14]);
addRoundKey x23(state_matrix[8],temp[15],rk8_reg);

//Round 9
getNextRoundKey r9(rk9, rk8_reg, 32'h1b000000, clk);
subBytes x37(temp[26], r8_state_matrix_reg, clk);
shiftRows x24(temp[16], temp[26]);
mixColumn x25(temp[17], temp[16]);
addRoundKey x26(state_matrix[9],temp[17],rk9_reg);

//Round 10
getNextRoundKey r10(rk10, rk9_reg, 32'h36000000, clk);
subBytes x38(temp[27], r9_state_matrix_reg, clk);
shiftRows x27(temp[18], temp[27]);
addRoundKey x28(state_matrix[10],temp[18],rk10_reg);


always @ (posedge clk)
begin

if(!rst) begin
out <= 128'bx;
plainText <= 128'bx;
rk0_reg <= 128'bx;
rk1_reg <= 128'bx;
rk2_reg <= 128'bx;
rk3_reg <= 128'bx;
rk4_reg <= 128'bx;
rk5_reg <= 128'bx;
rk6_reg <= 128'bx;
rk7_reg <= 128'bx;
rk8_reg <= 128'bx;
rk9_reg <= 128'bx;
rk10_reg <= 128'bx;
r0_state_matrix_reg <= 128'bx;
r1_state_matrix_reg <= 128'bx;
r2_state_matrix_reg <= 128'bx;
r3_state_matrix_reg <= 128'bx;
r4_state_matrix_reg <= 128'bx;
r5_state_matrix_reg <= 128'bx;
r6_state_matrix_reg <= 128'bx;
r7_state_matrix_reg <= 128'bx;
r8_state_matrix_reg <= 128'bx;
r9_state_matrix_reg <= 128'bx;
//key_expansion_round <= 0;
//key_expansion_completed <= 0;
//prev_round_key_reg <= 0;
//roundConstant_reg <= 0;
round_count <= 0;
//prev_state_matrix_reg <= 0;
//new_state_matrix_reg <= 0;
//encryption_completed <= x;
end
else begin

///////////////////////////////////////////////////////////////////////////////////
////                       Round Key expansion                                 ////
///////////////////////////////////////////////////////////////////////////////////

if(round_count == 0) begin
rk0_reg <= privateKey;
plainText <= in;
round_count <= 1;
end
else begin
rk0_reg <= privateKey;
plainText <= in;
rk1_reg <= rk1;
rk2_reg <= rk2;
rk3_reg <= rk3;
rk4_reg <= rk4;
rk5_reg <= rk5;
rk6_reg <= rk6;
rk7_reg <= rk7;
rk8_reg <= rk8;
rk9_reg <= rk9;
rk10_reg <= rk10;

r0_state_matrix_reg <= state_matrix[0];
r1_state_matrix_reg <= state_matrix[1];
r2_state_matrix_reg <= state_matrix[2];
r3_state_matrix_reg <= state_matrix[3];
r4_state_matrix_reg <= state_matrix[4];
r5_state_matrix_reg <= state_matrix[5];
r6_state_matrix_reg <= state_matrix[6];
r7_state_matrix_reg <= state_matrix[7];
r8_state_matrix_reg <= state_matrix[8];
r9_state_matrix_reg <= state_matrix[9];
out <= state_matrix[10];
end

///////////////////////////////////////////////////////////////////////////////////////

end

end

endmodule

