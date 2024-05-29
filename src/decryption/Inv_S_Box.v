module inv_sub_box(inv_sbyte,addr, clk);
input [7:0] addr;
output [7:0] inv_sbyte;
input clk;

wire [7:0] temp[7:0];

// The single LUT has been divided into 8 LUTs as during synthesis in
// Genus, it was not implementing the LUTs as ROM but as encoder
// decoder circuit. By dividing the LUT into smaller LUTs, we can
// reduce the time required to find the correct byte.
invSbox_1 s1(temp[0], addr, clk);
invSbox_2 s2(temp[1], addr, clk);
invSbox_3 s3(temp[2], addr, clk);
invSbox_4 s4(temp[3], addr, clk);
invSbox_5 s5(temp[4], addr, clk);
invSbox_6 s6(temp[5], addr, clk);
invSbox_7 s7(temp[6], addr, clk);
invSbox_8 s8(temp[7], addr, clk);

// Outputs of all the 8 LUTs are XORed to get the final substitute byte
// as only one of the LUT will give a non zero output.
assign inv_sbyte = temp[0]^temp[1]^temp[2]^temp[3]^temp[4]^temp[5]^temp[6]^temp[7];

endmodule

module invSbox_1(inv_sbyte, addr, clk);
output reg [7:0] inv_sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'h00: inv_sbyte <= 	8'h52	;
8'h01: inv_sbyte <= 	8'h09	;
8'h02: inv_sbyte <= 	8'h6A	;
8'h03: inv_sbyte <= 	8'hD5	;
8'h04: inv_sbyte <= 	8'h30	;
8'h05: inv_sbyte <= 	8'h36	;
8'h06: inv_sbyte <= 	8'hA5	;
8'h07: inv_sbyte <= 	8'h38	;
8'h08: inv_sbyte <= 	8'hBF	;
8'h09: inv_sbyte <= 	8'h40	;
8'h0A: inv_sbyte <= 	8'hA3	;
8'h0B: inv_sbyte <= 	8'h9E	;
8'h0C: inv_sbyte <= 	8'h81	;
8'h0D: inv_sbyte <= 	8'hF3	;
8'h0E: inv_sbyte <= 	8'hD7	;
8'h0F: inv_sbyte <= 	8'hFB	;
8'h10: inv_sbyte <= 	8'h7C	;
8'h11: inv_sbyte <= 	8'hE3	;
8'h12: inv_sbyte <= 	8'h39	;
8'h13: inv_sbyte <= 	8'h82	;
8'h14: inv_sbyte <= 	8'h9B	;
8'h15: inv_sbyte <= 	8'h2F	;
8'h16: inv_sbyte <= 	8'hFF	;
8'h17: inv_sbyte <= 	8'h87	;
8'h18: inv_sbyte <= 	8'h34	;
8'h19: inv_sbyte <= 	8'h8E	;
8'h1A: inv_sbyte <= 	8'h43	;
8'h1B: inv_sbyte <= 	8'h44	;
8'h1C: inv_sbyte <= 	8'hC4	;
8'h1D: inv_sbyte <= 	8'hDE	;
8'h1E: inv_sbyte <= 	8'hE9	;
8'h1F: inv_sbyte <= 	8'hCB	;

   default: inv_sbyte <= 8'h00;

endcase
end
endmodule

module invSbox_2(inv_sbyte, addr, clk);
output reg [7:0] inv_sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

   8'h20: inv_sbyte <= 	8'h54	;
8'h21: inv_sbyte <= 	8'h7B	;
8'h22: inv_sbyte <= 	8'h94	;
8'h23: inv_sbyte <= 	8'h32	;
8'h24: inv_sbyte <= 	8'hA6	;
8'h25: inv_sbyte <= 	8'hC2	;
8'h26: inv_sbyte <= 	8'h23	;
8'h27: inv_sbyte <= 	8'h3D	;
8'h28: inv_sbyte <= 	8'hEE	;
8'h29: inv_sbyte <= 	8'h4C	;
8'h2A: inv_sbyte <= 	8'h95	;
8'h2B: inv_sbyte <= 	8'h0B	;
8'h2C: inv_sbyte <= 	8'h42	;
8'h2D: inv_sbyte <= 	8'hFA	;
8'h2E: inv_sbyte <= 	8'hC3	;
8'h2F: inv_sbyte <= 	8'h4E	;
8'h30: inv_sbyte <= 	8'h08	;
8'h31: inv_sbyte <= 	8'h2E	;
8'h32: inv_sbyte <= 	8'hA1	;
8'h33: inv_sbyte <= 	8'h66	;
8'h34: inv_sbyte <= 	8'h28	;
8'h35: inv_sbyte <= 	8'hD9	;
8'h36: inv_sbyte <= 	8'h24	;
8'h37: inv_sbyte <= 	8'hB2	;
8'h38: inv_sbyte <= 	8'h76	;
8'h39: inv_sbyte <= 	8'h5B	;
8'h3A: inv_sbyte <= 	8'hA2	;
8'h3B: inv_sbyte <= 	8'h49	;
8'h3C: inv_sbyte <= 	8'h6D	;
8'h3D: inv_sbyte <= 	8'h8B	;
8'h3E: inv_sbyte <= 	8'hD1	;
8'h3F: inv_sbyte <= 	8'h25	;

   default: inv_sbyte <= 8'h00;

endcase
end
endmodule

module invSbox_3(inv_sbyte, addr, clk);
output reg [7:0] inv_sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

   8'h40: inv_sbyte <= 	8'h72	;
8'h41: inv_sbyte <= 	8'hF8	;
8'h42: inv_sbyte <= 	8'hF6	;
8'h43: inv_sbyte <= 	8'h64	;
8'h44: inv_sbyte <= 	8'h86	;
8'h45: inv_sbyte <= 	8'h68	;
8'h46: inv_sbyte <= 	8'h98	;
8'h47: inv_sbyte <= 	8'h16	;
8'h48: inv_sbyte <= 	8'hD4	;
8'h49: inv_sbyte <= 	8'hA4	;
8'h4A: inv_sbyte <= 	8'h5C	;
8'h4B: inv_sbyte <= 	8'hCC	;
8'h4C: inv_sbyte <= 	8'h5D	;
8'h4D: inv_sbyte <= 	8'h65	;
8'h4E: inv_sbyte <= 	8'hB6	;
8'h4F: inv_sbyte <= 	8'h92	;
8'h50: inv_sbyte <= 	8'h6C	;
8'h51: inv_sbyte <= 	8'h70	;
8'h52: inv_sbyte <= 	8'h48	;
8'h53: inv_sbyte <= 	8'h50	;
8'h54: inv_sbyte <= 	8'hFD	;
8'h55: inv_sbyte <= 	8'hED	;
8'h56: inv_sbyte <= 	8'hB9	;
8'h57: inv_sbyte <= 	8'hDA	;
8'h58: inv_sbyte <= 	8'h5E	;
8'h59: inv_sbyte <= 	8'h15	;
8'h5A: inv_sbyte <= 	8'h46	;
8'h5B: inv_sbyte <= 	8'h57	;
8'h5C: inv_sbyte <= 	8'hA7	;
8'h5D: inv_sbyte <= 	8'h8D	;
8'h5E: inv_sbyte <= 	8'h9D	;
8'h5F: inv_sbyte <= 	8'h84	;

   default: inv_sbyte <= 8'h00;

endcase
end
endmodule

module invSbox_4(inv_sbyte, addr, clk);
output reg [7:0] inv_sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'h60: inv_sbyte <= 	8'h90	;
8'h61: inv_sbyte <= 	8'hD8	;
8'h62: inv_sbyte <= 	8'hAB	;
8'h63: inv_sbyte <= 	8'h00	;
8'h64: inv_sbyte <= 	8'h8C	;
8'h65: inv_sbyte <= 	8'hBC	;
8'h66: inv_sbyte <= 	8'hD3	;
8'h67: inv_sbyte <= 	8'h0A	;
8'h68: inv_sbyte <= 	8'hF7	;
8'h69: inv_sbyte <= 	8'hE4	;
8'h6A: inv_sbyte <= 	8'h58	;
8'h6B: inv_sbyte <= 	8'h05	;
8'h6C: inv_sbyte <= 	8'hB8	;
8'h6D: inv_sbyte <= 	8'hB3	;
8'h6E: inv_sbyte <= 	8'h45	;
8'h6F: inv_sbyte <= 	8'h06	;
8'h70: inv_sbyte <= 	8'hD0	;
8'h71: inv_sbyte <= 	8'h2C	;
8'h72: inv_sbyte <= 	8'h1E	;
8'h73: inv_sbyte <= 	8'h8F	;
8'h74: inv_sbyte <= 	8'hCA	;
8'h75: inv_sbyte <= 	8'h3F	;
8'h76: inv_sbyte <= 	8'h0F	;
8'h77: inv_sbyte <= 	8'h02	;
8'h78: inv_sbyte <= 	8'hC1	;
8'h79: inv_sbyte <= 	8'hAF	;
8'h7A: inv_sbyte <= 	8'hBD	;
8'h7B: inv_sbyte <= 	8'h03	;
8'h7C: inv_sbyte <= 	8'h01	;
8'h7D: inv_sbyte <= 	8'h13	;
8'h7E: inv_sbyte <= 	8'h8A	;
8'h7F: inv_sbyte <= 	8'h6B	;

   default: inv_sbyte <= 8'h00;

endcase
end
endmodule

module invSbox_5(inv_sbyte, addr, clk);
output reg [7:0] inv_sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'h80: inv_sbyte <= 	8'h3A	;
8'h81: inv_sbyte <= 	8'h91	;
8'h82: inv_sbyte <= 	8'h11	;
8'h83: inv_sbyte <= 	8'h41	;
8'h84: inv_sbyte <= 	8'h4F	;
8'h85: inv_sbyte <= 	8'h67	;
8'h86: inv_sbyte <= 	8'hDC	;
8'h87: inv_sbyte <= 	8'hEA	;
8'h88: inv_sbyte <= 	8'h97	;
8'h89: inv_sbyte <= 	8'hF2	;
8'h8A: inv_sbyte <= 	8'hCF	;
8'h8B: inv_sbyte <= 	8'hCE	;
8'h8C: inv_sbyte <= 	8'hF0	;
8'h8D: inv_sbyte <= 	8'hB4	;
8'h8E: inv_sbyte <= 	8'hE6	;
8'h8F: inv_sbyte <= 	8'h73	;
8'h90: inv_sbyte <= 	8'h96	;
8'h91: inv_sbyte <= 	8'hAC	;
8'h92: inv_sbyte <= 	8'h74	;
8'h93: inv_sbyte <= 	8'h22	;
8'h94: inv_sbyte <= 	8'hE7	;
8'h95: inv_sbyte <= 	8'hAD	;
8'h96: inv_sbyte <= 	8'h35	;
8'h97: inv_sbyte <= 	8'h85	;
8'h98: inv_sbyte <= 	8'hE2	;
8'h99: inv_sbyte <= 	8'hF9	;
8'h9A: inv_sbyte <= 	8'h37	;
8'h9B: inv_sbyte <= 	8'hE8	;
8'h9C: inv_sbyte <= 	8'h1C	;
8'h9D: inv_sbyte <= 	8'h75	;
8'h9E: inv_sbyte <= 	8'hDF	;
8'h9F: inv_sbyte <= 	8'h6E	;

   default: inv_sbyte <= 8'h00;

endcase
end
endmodule

module invSbox_6(inv_sbyte, addr, clk);
output reg [7:0] inv_sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'hA0: inv_sbyte <= 	8'h47	;
8'hA1: inv_sbyte <= 	8'hF1	;
8'hA2: inv_sbyte <= 	8'h1A	;
8'hA3: inv_sbyte <= 	8'h71	;
8'hA4: inv_sbyte <= 	8'h1D	;
8'hA5: inv_sbyte <= 	8'h29	;
8'hA6: inv_sbyte <= 	8'hC5	;
8'hA7: inv_sbyte <= 	8'h89	;
8'hA8: inv_sbyte <= 	8'h6F	;
8'hA9: inv_sbyte <= 	8'hB7	;
8'hAA: inv_sbyte <= 	8'h62	;
8'hAB: inv_sbyte <= 	8'h0E	;
8'hAC: inv_sbyte <= 	8'hAA	;
8'hAD: inv_sbyte <= 	8'h18	;
8'hAE: inv_sbyte <= 	8'hBE	;
8'hAF: inv_sbyte <= 	8'h1B	;
8'hB0: inv_sbyte <= 	8'hFC	;
8'hB1: inv_sbyte <= 	8'h56	;
8'hB2: inv_sbyte <= 	8'h3E	;
8'hB3: inv_sbyte <= 	8'h4B	;
8'hB4: inv_sbyte <= 	8'hC6	;
8'hB5: inv_sbyte <= 	8'hD2	;
8'hB6: inv_sbyte <= 	8'h79	;
8'hB7: inv_sbyte <= 	8'h20	;
8'hB8: inv_sbyte <= 	8'h9A	;
8'hB9: inv_sbyte <= 	8'hDB	;
8'hBA: inv_sbyte <= 	8'hC0	;
8'hBB: inv_sbyte <= 	8'hFE	;
8'hBC: inv_sbyte <= 	8'h78	;
8'hBD: inv_sbyte <= 	8'hCD	;
8'hBE: inv_sbyte <= 	8'h5A	;
8'hBF: inv_sbyte <= 	8'hF4	;

   default: inv_sbyte <= 8'h00;

endcase
end
endmodule

module invSbox_7(inv_sbyte, addr, clk);
output reg [7:0] inv_sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'hC0: inv_sbyte <= 	8'h1F	;
8'hC1: inv_sbyte <= 	8'hDD	;
8'hC2: inv_sbyte <= 	8'hA8	;
8'hC3: inv_sbyte <= 	8'h33	;
8'hC4: inv_sbyte <= 	8'h88	;
8'hC5: inv_sbyte <= 	8'h07	;
8'hC6: inv_sbyte <= 	8'hC7	;
8'hC7: inv_sbyte <= 	8'h31	;
8'hC8: inv_sbyte <= 	8'hB1	;
8'hC9: inv_sbyte <= 	8'h12	;
8'hCA: inv_sbyte <= 	8'h10	;
8'hCB: inv_sbyte <= 	8'h59	;
8'hCC: inv_sbyte <= 	8'h27	;
8'hCD: inv_sbyte <= 	8'h80	;
8'hCE: inv_sbyte <= 	8'hEC	;
8'hCF: inv_sbyte <= 	8'h5F	;
8'hD0: inv_sbyte <= 	8'h60	;
8'hD1: inv_sbyte <= 	8'h51	;
8'hD2: inv_sbyte <= 	8'h7F	;
8'hD3: inv_sbyte <= 	8'hA9	;
8'hD4: inv_sbyte <= 	8'h19	;
8'hD5: inv_sbyte <= 	8'hB5	;
8'hD6: inv_sbyte <= 	8'h4A	;
8'hD7: inv_sbyte <= 	8'h0D	;
8'hD8: inv_sbyte <= 	8'h2D	;
8'hD9: inv_sbyte <= 	8'hE5	;
8'hDA: inv_sbyte <= 	8'h7A	;
8'hDB: inv_sbyte <= 	8'h9F	;
8'hDC: inv_sbyte <= 	8'h93	;
8'hDD: inv_sbyte <= 	8'hC9	;
8'hDE: inv_sbyte <= 	8'h9C	;
8'hDF: inv_sbyte <= 	8'hEF	;

   default: inv_sbyte <= 8'h00;

endcase
end
endmodule

module invSbox_8(inv_sbyte, addr, clk);
output reg [7:0] inv_sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'hE0: inv_sbyte <= 	8'hA0	;
8'hE1: inv_sbyte <= 	8'hE0	;
8'hE2: inv_sbyte <= 	8'h3B	;
8'hE3: inv_sbyte <= 	8'h4D	;
8'hE4: inv_sbyte <= 	8'hAE	;
8'hE5: inv_sbyte <= 	8'h2A	;
8'hE6: inv_sbyte <= 	8'hF5	;
8'hE7: inv_sbyte <= 	8'hB0	;
8'hE8: inv_sbyte <= 	8'hC8	;
8'hE9: inv_sbyte <= 	8'hEB	;
8'hEA: inv_sbyte <= 	8'hBB	;
8'hEB: inv_sbyte <= 	8'h3C	;
8'hEC: inv_sbyte <= 	8'h83	;
8'hED: inv_sbyte <= 	8'h53	;
8'hEE: inv_sbyte <= 	8'h99	;
8'hEF: inv_sbyte <= 	8'h61	;
8'hF0: inv_sbyte <= 	8'h17	;
8'hF1: inv_sbyte <= 	8'h2B	;
8'hF2: inv_sbyte <= 	8'h04	;
8'hF3: inv_sbyte <= 	8'h7E	;
8'hF4: inv_sbyte <= 	8'hBA	;
8'hF5: inv_sbyte <= 	8'h77	;
8'hF6: inv_sbyte <= 	8'hD6	;
8'hF7: inv_sbyte <= 	8'h26	;
8'hF8: inv_sbyte <= 	8'hE1	;
8'hF9: inv_sbyte <= 	8'h69	;
8'hFA: inv_sbyte <= 	8'h14	;
8'hFB: inv_sbyte <= 	8'h63	;
8'hFC: inv_sbyte <= 	8'h55	;
8'hFD: inv_sbyte <= 	8'h21	;
8'hFE: inv_sbyte <= 	8'h0C	;
8'hFF: inv_sbyte <= 	8'h7D	;

   default: inv_sbyte <= 8'h00;

endcase
end
endmodule
