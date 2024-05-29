module aes128_decryption(out,in,privateKey,clk,rst);
output reg [127:0] out;
input [127:0] in,privateKey;
input clk,rst;

reg [127:0] cipherText;
wire [127:0] plainText;

reg [4:0] keysGenerated;

//Reg to store for all round keys
reg [127:0] rk0_reg, rk1_reg, rk2_reg, rk3_reg, rk4_reg, rk5_reg, rk6_reg, rk7_reg, rk8_reg, rk9_reg, rk10_reg;

//Register to store state matrices of each round
reg [127:0] r0_state_matrix_reg, r1_state_matrix_reg, r2_state_matrix_reg, r3_state_matrix_reg, r4_state_matrix_reg, r5_state_matrix_reg, r6_state_matrix_reg, r7_state_matrix_reg, r8_state_matrix_reg, r9_state_matrix_reg, r10_state_matrix_reg;

//Wire for all 10 state matrices
wire [127:0] state_matrix[9:0];

//Input wire to round key registers
wire [127:0] rk1, rk2, rk3, rk4, rk5, rk6, rk7, rk8, rk9, rk10;

//Generate all round keys
getNextRoundKey r1(rk1, rk0_reg, 32'h01000000, clk);
getNextRoundKey r2(rk2, rk1_reg, 32'h02000000, clk);
getNextRoundKey r3(rk3, rk2_reg, 32'h04000000, clk);
getNextRoundKey r4(rk4, rk3_reg, 32'h08000000, clk);
getNextRoundKey r5(rk5, rk4_reg, 32'h10000000, clk);
getNextRoundKey r6(rk6, rk5_reg, 32'h20000000, clk);
getNextRoundKey r7(rk7, rk6_reg, 32'h40000000, clk);
getNextRoundKey r8(rk8, rk7_reg, 32'h80000000, clk);
getNextRoundKey r9(rk9, rk8_reg, 32'h1b000000, clk);
getNextRoundKey r10(rk10, rk9_reg, 32'h36000000, clk);

//Wire for all intermediate connection
wire [127:0] temp[38:0];

//Pre-Round
addRoundKey a0(state_matrix[0],cipherText,rk10_reg);

//Round 1
inverseShiftRows x0(temp[0], r0_state_matrix_reg);
invSubBytes x1(temp[1], temp[0], clk);
addRoundKey x2(temp[2],temp[1],rk9_reg);
invMixColumn x3(state_matrix[1], temp[2], clk);

//Round 2
inverseShiftRows x4(temp[3], r1_state_matrix_reg);
invSubBytes x5(temp[4], temp[3], clk);
addRoundKey x6(temp[5],temp[4],rk8_reg);
invMixColumn x7(state_matrix[2], temp[5], clk);

//Round 3
inverseShiftRows x8(temp[6], r2_state_matrix_reg);
invSubBytes x9(temp[7], temp[6], clk);
addRoundKey x10(temp[8],temp[7],rk7_reg);
invMixColumn x11(state_matrix[3], temp[8], clk);

//Round 4
inverseShiftRows x12(temp[9], r3_state_matrix_reg);
invSubBytes x13(temp[10], temp[9], clk);
addRoundKey x14(temp[11],temp[10],rk6_reg);
invMixColumn x15(state_matrix[4], temp[11], clk);

//Round 5
inverseShiftRows x16(temp[12], r4_state_matrix_reg);
invSubBytes x17(temp[13], temp[12], clk);
addRoundKey x18(temp[14],temp[13],rk5_reg);
invMixColumn x19(state_matrix[5], temp[14], clk);

//Round 6
inverseShiftRows x20(temp[15], r5_state_matrix_reg);
invSubBytes x21(temp[16], temp[15], clk);
addRoundKey x22(temp[17],temp[16],rk4_reg);
invMixColumn x23(state_matrix[6], temp[17], clk);

//Round 7
inverseShiftRows x24(temp[18], r6_state_matrix_reg);
invSubBytes x25(temp[19], temp[18], clk);
addRoundKey x26(temp[20],temp[19],rk3_reg);
invMixColumn x27(state_matrix[7], temp[20], clk);

//Round 8
inverseShiftRows x28(temp[21], r7_state_matrix_reg);
invSubBytes x29(temp[22], temp[21], clk);
addRoundKey x30(temp[23],temp[22],rk2_reg);
invMixColumn x31(state_matrix[8], temp[23], clk);

//Round 9
inverseShiftRows x32(temp[24], r8_state_matrix_reg);
invSubBytes x33(temp[25], temp[24], clk);
addRoundKey x34(temp[26],temp[25],rk1_reg);
invMixColumn x35(state_matrix[9], temp[26], clk);
 
//Round 10
inverseShiftRows x36(temp[27], r9_state_matrix_reg);
invSubBytes x37(temp[28], temp[27], clk);
addRoundKey x38(plainText,temp[28],rk0_reg);

always @ (posedge clk)
begin

if(!rst) begin
out <= 0;
cipherText <= 0;
rk0_reg <= 0;
rk1_reg <= 0;
rk2_reg <= 0;
rk3_reg <= 0;
rk4_reg <= 0;
rk5_reg <= 0;
rk6_reg <= 0;
rk7_reg <= 0;
rk8_reg <= 0;
rk9_reg <= 0;
rk10_reg <= 0;
r0_state_matrix_reg <= 0;
r1_state_matrix_reg <= 0;
r2_state_matrix_reg <= 0;
r3_state_matrix_reg <= 0;
r4_state_matrix_reg <= 0;
r5_state_matrix_reg <= 0;
r6_state_matrix_reg <= 0;
r7_state_matrix_reg <= 0;
r8_state_matrix_reg <= 0;
r9_state_matrix_reg <= 0;

keysGenerated <= 0;

end

else begin
if (keysGenerated == 21) begin

cipherText <= in;
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
out <= plainText;

end
else begin
keysGenerated <= keysGenerated + 1;
rk0_reg <= privateKey;
cipherText <= in;
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

end
end

end

endmodule
