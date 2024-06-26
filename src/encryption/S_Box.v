module sub_box(sbyte,addr, clk);
input [7:0] addr; input clk;
output [7:0] sbyte;

wire [7:0] temp[7:0];

// The single LUT has been divided into 8 LUTs as during synthesis in
// Genus, it was not implementing the LUTs as ROM but as encoder
// decoder circuit. By dividing the LUT into smaller LUTs, we can
// reduce the time required to find the correct byte.
sbox_1 s1(temp[0], addr, clk);
sbox_2 s2(temp[1], addr, clk);
sbox_3 s3(temp[2], addr, clk);
sbox_4 s4(temp[3], addr, clk);
sbox_5 s5(temp[4], addr, clk);
sbox_6 s6(temp[5], addr, clk);
sbox_7 s7(temp[6], addr, clk);
sbox_8 s8(temp[7], addr, clk);

// Outputs of all the 8 LUTs are XORed to get the final substitute byte
// as only one of the LUT will give a non zero output.
assign sbyte = temp[0]^temp[1]^temp[2]^temp[3]^temp[4]^temp[5]^temp[6]^temp[7];

endmodule

module sbox_1(sbyte, addr, clk);
output reg [7:0] sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'h40:  sbyte <= 8'h09;
8'h41:  sbyte <= 8'h83;
8'h42:  sbyte <= 8'h2c;
8'h43:  sbyte <= 8'h1a;
8'h44:  sbyte <= 8'h1b;
8'h45:  sbyte <= 8'h6e;
8'h46:  sbyte <= 8'h5a;
8'h47:  sbyte <= 8'ha0;

8'h50:  sbyte <= 8'h53;
8'h51:  sbyte <= 8'hd1;
8'h52:  sbyte <= 8'h00;
8'h53:  sbyte <= 8'hed;
8'h54:  sbyte <= 8'h20;
8'h55:  sbyte <= 8'hfc;
8'h56:  sbyte <= 8'hb1;
8'h57:  sbyte <= 8'h5b;

8'h60:  sbyte <= 8'hd0;
8'h61:  sbyte <= 8'hef;
8'h62:  sbyte <= 8'haa;
8'h63:  sbyte <= 8'hfb;
8'h64:  sbyte <= 8'h43;
8'h65:  sbyte <= 8'h4d;
8'h66:  sbyte <= 8'h33;
8'h67:  sbyte <= 8'h85;

8'h70:  sbyte <= 8'h51;
8'h71:  sbyte <= 8'ha3;
8'h72:  sbyte <= 8'h40;
8'h73:  sbyte <= 8'h8f;
8'h74:  sbyte <= 8'h92;
8'h75:  sbyte <= 8'h9d;
8'h76:  sbyte <= 8'h38;
8'h77:  sbyte <= 8'hf5;

default: sbyte <= 8'h00;
endcase
end
endmodule 

module sbox_2(sbyte, addr, clk);
output reg [7:0] sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'h48:  sbyte <= 8'h52;
8'h49:  sbyte <= 8'h3b;
8'h4A:  sbyte <= 8'hd6;
8'h4B:  sbyte <= 8'hb3;
8'h4C:  sbyte <= 8'h29;
8'h4D:  sbyte <= 8'he3;
8'h4E:  sbyte <= 8'h2f;
8'h4F:  sbyte <= 8'h84;

8'h58:  sbyte <= 8'h6a;
8'h59:  sbyte <= 8'hcb;
8'h5A:  sbyte <= 8'hbe;
8'h5B:  sbyte <= 8'h39;
8'h5C:  sbyte <= 8'h4a;
8'h5D:  sbyte <= 8'h4c;
8'h5E:  sbyte <= 8'h58;
8'h5F:  sbyte <= 8'hcf;

8'h68:  sbyte <= 8'h45;
8'h69:  sbyte <= 8'hf9;
8'h6A:  sbyte <= 8'h02;
8'h6B:  sbyte <= 8'h7f;
8'h6C:  sbyte <= 8'h50;
8'h6D:  sbyte <= 8'h3c;
8'h6E:  sbyte <= 8'h9f;
8'h6F:  sbyte <= 8'ha8;

8'h78:  sbyte <= 8'hbc;
8'h79:  sbyte <= 8'hb6;
8'h7A:  sbyte <= 8'hda;
8'h7B:  sbyte <= 8'h21;
8'h7C:  sbyte <= 8'h10;
8'h7D:  sbyte <= 8'hff;
8'h7E:  sbyte <= 8'hf3;
8'h7F:  sbyte <= 8'hd2;

default: sbyte <= 8'h00;
endcase
end
endmodule

module sbox_3(sbyte, addr, clk);
output reg [7:0] sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'hC0:  sbyte <= 8'hba;
8'hC1:  sbyte <= 8'h78;
8'hC2:  sbyte <= 8'h25;
8'hC3:  sbyte <= 8'h2e;
8'hC4:  sbyte <= 8'h1c;
8'hC5:  sbyte <= 8'ha6;
8'hC6:  sbyte <= 8'hb4;
8'hC7:  sbyte <= 8'hc6;

8'hD0:  sbyte <= 8'h70;
8'hD1:  sbyte <= 8'h3e;
8'hD2:  sbyte <= 8'hb5;
8'hD3:  sbyte <= 8'h66;
8'hD4:  sbyte <= 8'h48;
8'hD5:  sbyte <= 8'h03;
8'hD6:  sbyte <= 8'hf6;
8'hD7:  sbyte <= 8'h0e;

8'hE0:  sbyte <= 8'he1;
8'hE1:  sbyte <= 8'hf8;
8'hE2:  sbyte <= 8'h98;
8'hE3:  sbyte <= 8'h11;
8'hE4:  sbyte <= 8'h69;
8'hE5:  sbyte <= 8'hd9;
8'hE6:  sbyte <= 8'h8e;
8'hE7:  sbyte <= 8'h94;

8'hF0:  sbyte <= 8'h8c;
8'hF1:  sbyte <= 8'ha1;
8'hF2:  sbyte <= 8'h89;
8'hF3:  sbyte <= 8'h0d;
8'hF4:  sbyte <= 8'hbf;
8'hF5:  sbyte <= 8'he6;
8'hF6:  sbyte <= 8'h42;
8'hF7:  sbyte <= 8'h68;

default: sbyte <= 8'h00;
endcase
end
endmodule

module sbox_4(sbyte, addr, clk);
output reg [7:0] sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'hC8:  sbyte <= 8'he8;
8'hC9:  sbyte <= 8'hdd;
8'hCA:  sbyte <= 8'h74;
8'hCB:  sbyte <= 8'h1f;
8'hCC:  sbyte <= 8'h4b;
8'hCD:  sbyte <= 8'hbd;
8'hCE:  sbyte <= 8'h8b;
8'hCF:  sbyte <= 8'h8a;

8'hD8:  sbyte <= 8'h61;
8'hD9:  sbyte <= 8'h35;
8'hDA:  sbyte <= 8'h57;
8'hDB:  sbyte <= 8'hb9;
8'hDC:  sbyte <= 8'h86;
8'hDD:  sbyte <= 8'hc1;
8'hDE:  sbyte <= 8'h1d;
8'hDF:  sbyte <= 8'h9e;

8'hE8:  sbyte <= 8'h9b;
8'hE9:  sbyte <= 8'h1e;
8'hEA:  sbyte <= 8'h87;
8'hEB:  sbyte <= 8'he9;
8'hEC:  sbyte <= 8'hce;
8'hED:  sbyte <= 8'h55;
8'hEE:  sbyte <= 8'h28;
8'hEF:  sbyte <= 8'hdf;

8'hF8:  sbyte <= 8'h41;
8'hF9:  sbyte <= 8'h99;
8'hFA:  sbyte <= 8'h2d;
8'hFB:  sbyte <= 8'h0f;
8'hFC:  sbyte <= 8'hb0;
8'hFD:  sbyte <= 8'h54;
8'hFE:  sbyte <= 8'hbb;
8'hFF:  sbyte <= 8'h16;

default: sbyte <= 8'h00;
endcase
end
endmodule

module sbox_5(sbyte, addr, clk);
output reg [7:0] sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'h00: sbyte <= 8'h63;
8'h01: sbyte <= 8'h7c;
8'h02: sbyte <= 8'h77;
8'h03: sbyte <= 8'h7b;
8'h04: sbyte <= 8'hf2;
8'h05: sbyte <= 8'h6b;
8'h06: sbyte <= 8'h6f;
8'h07: sbyte <= 8'hc5;

8'h10: sbyte <= 8'hca;
8'h11: sbyte <= 8'h82;
8'h12: sbyte <= 8'hc9;
8'h13: sbyte <= 8'h7d;
8'h14: sbyte <= 8'hfa;
8'h15: sbyte <= 8'h59;
8'h16: sbyte <= 8'h47;
8'h17: sbyte <= 8'hf0;

8'h20:  sbyte <= 8'hb7;
8'h21:  sbyte <= 8'hfd;
8'h22:  sbyte <= 8'h93;
8'h23:  sbyte <= 8'h26;
8'h24:  sbyte <= 8'h36;
8'h25:  sbyte <= 8'h3f;
8'h26:  sbyte <= 8'hf7;
8'h27:  sbyte <= 8'hcc;

8'h30:  sbyte <= 8'h04;
8'h31:  sbyte <= 8'hc7;
8'h32:  sbyte <= 8'h23;
8'h33:  sbyte <= 8'hc3;
8'h34:  sbyte <= 8'h18;
8'h35:  sbyte <= 8'h96;
8'h36:  sbyte <= 8'h05;
8'h37:  sbyte <= 8'h9a;

default: sbyte <= 8'h00;
endcase
end
endmodule

module sbox_6(sbyte, addr, clk);
output reg [7:0] sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'h08: sbyte <= 8'h30;
8'h09: sbyte <= 8'h01;
8'h0A: sbyte <= 8'h67;
8'h0B: sbyte <= 8'h2b;
8'h0C: sbyte <= 8'hfe;
8'h0D: sbyte <= 8'hd7;
8'h0E: sbyte <= 8'hab;
8'h0F: sbyte <= 8'h76;

8'h18: sbyte <= 8'had;
8'h19: sbyte <= 8'hd4;
8'h1A: sbyte <= 8'ha2;
8'h1B: sbyte <= 8'haf;
8'h1C: sbyte <= 8'h9c;
8'h1D: sbyte <= 8'ha4;
8'h1E: sbyte <= 8'h72;
8'h1F: sbyte <= 8'hc0;

8'h28:  sbyte <= 8'h34;
8'h29:  sbyte <= 8'ha5;
8'h2A:  sbyte <= 8'he5;
8'h2B:  sbyte <= 8'hf1;
8'h2C:  sbyte <= 8'h71;
8'h2D:  sbyte <= 8'hd8;
8'h2E:  sbyte <= 8'h31;
8'h2F:  sbyte <= 8'h15;

8'h38:  sbyte <= 8'h07;
8'h39:  sbyte <= 8'h12;
8'h3A:  sbyte <= 8'h80;
8'h3B:  sbyte <= 8'he2;
8'h3C:  sbyte <= 8'heb;
8'h3D:  sbyte <= 8'h27;
8'h3E:  sbyte <= 8'hb2;
8'h3F:  sbyte <= 8'h75;

default: sbyte <= 8'h00;
endcase
end
endmodule

module sbox_7(sbyte, addr, clk);
output reg [7:0] sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'h80:  sbyte <= 8'hcd;
8'h81:  sbyte <= 8'h0c;
8'h82:  sbyte <= 8'h13;
8'h83:  sbyte <= 8'hec;
8'h84:  sbyte <= 8'h5f;
8'h85:  sbyte <= 8'h97;
8'h86:  sbyte <= 8'h44;
8'h87:  sbyte <= 8'h17;

8'h90:  sbyte <= 8'h60;
8'h91:  sbyte <= 8'h81;
8'h92:  sbyte <= 8'h4f;
8'h93:  sbyte <= 8'hdc;
8'h94:  sbyte <= 8'h22;
8'h95:  sbyte <= 8'h2a;
8'h96:  sbyte <= 8'h90;
8'h97:  sbyte <= 8'h88;

8'hA0:  sbyte <= 8'he0;
8'hA1:  sbyte <= 8'h32;
8'hA2:  sbyte <= 8'h3a;
8'hA3:  sbyte <= 8'h0a;
8'hA4:  sbyte <= 8'h49;
8'hA5:  sbyte <= 8'h06;
8'hA6:  sbyte <= 8'h24;
8'hA7:  sbyte <= 8'h5c;

8'hB0:  sbyte <= 8'he7;
8'hB1:  sbyte <= 8'hc8;
8'hB2:  sbyte <= 8'h37;
8'hB3:  sbyte <= 8'h6d;
8'hB4:  sbyte <= 8'h8d;
8'hB5:  sbyte <= 8'hd5;
8'hB6:  sbyte <= 8'h4e;
8'hB7:  sbyte <= 8'ha9;

default: sbyte <= 8'h00;
endcase
end
endmodule

module sbox_8(sbyte, addr, clk);
output reg [7:0] sbyte;
input [7:0] addr; input clk;

always @ (posedge clk) begin

(* synthesis, full_case, parallel_case *) case (addr)

8'h88:  sbyte <= 8'hc4;
8'h89:  sbyte <= 8'ha7;
8'h8A:  sbyte <= 8'h7e;
8'h8B:  sbyte <= 8'h3d;
8'h8C:  sbyte <= 8'h64;
8'h8D:  sbyte <= 8'h5d;
8'h8E:  sbyte <= 8'h19;
8'h8F:  sbyte <= 8'h73;

8'h98:  sbyte <= 8'h46;
8'h99:  sbyte <= 8'hee;
8'h9A:  sbyte <= 8'hb8;
8'h9B:  sbyte <= 8'h14;
8'h9C:  sbyte <= 8'hde;
8'h9D:  sbyte <= 8'h5e;
8'h9E:  sbyte <= 8'h0b;
8'h9F:  sbyte <= 8'hdb;

8'hA8:  sbyte <= 8'hc2;
8'hA9:  sbyte <= 8'hd3;
8'hAA:  sbyte <= 8'hac;
8'hAB:  sbyte <= 8'h62;
8'hAC:  sbyte <= 8'h91;
8'hAD:  sbyte <= 8'h95;
8'hAE:  sbyte <= 8'he4;
8'hAF:  sbyte <= 8'h79;

8'hB8:  sbyte <= 8'h6c;
8'hB9:  sbyte <= 8'h56;
8'hBA:  sbyte <= 8'hf4;
8'hBB:  sbyte <= 8'hea;
8'hBC:  sbyte <= 8'h65;
8'hBD:  sbyte <= 8'h7a;
8'hBE:  sbyte <= 8'hae;
8'hBF:  sbyte <= 8'h08;

default: sbyte <= 8'h00;
endcase
end
endmodule