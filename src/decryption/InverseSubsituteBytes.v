module invSubBytes(out,in, clk);
output wire [127:0] out;
input [127:0] in;
input clk;

inv_sub_box s0(out[127:120], in[127:120], clk);
inv_sub_box s1(out[119:112], in[119:112], clk);
inv_sub_box s2(out[111:104], in[111:104], clk);
inv_sub_box s3(out[103:96], in[103:96], clk);
inv_sub_box s4(out[95:88], in[95:88], clk);
inv_sub_box s5(out[87:80], in[87:80], clk);
inv_sub_box s6(out[79:72], in[79:72], clk);
inv_sub_box s7(out[71:64], in[71:64], clk);
inv_sub_box s8(out[63:56], in[63:56], clk);
inv_sub_box s9(out[55:48], in[55:48], clk);
inv_sub_box s10(out[47:40], in[47:40], clk);
inv_sub_box s11(out[39:32], in[39:32], clk);
inv_sub_box s12(out[31:24], in[31:24], clk);
inv_sub_box s13(out[23:16], in[23:16], clk);
inv_sub_box s14(out[15:8], in[15:8], clk);
inv_sub_box s15(out[7:0], in[7:0], clk);

endmodule
