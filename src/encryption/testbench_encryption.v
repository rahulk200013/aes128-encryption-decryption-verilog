module test_aes128_encryption();

reg [127:0] plainText,privateKey;
wire [127:0] cipherText;
reg clk,rst;

aes128 a0(cipherText,plainText,privateKey,clk,rst);

always #5 clk = ~clk;

initial begin

rst = 0;
clk = 0;

#50

rst = 1;
privateKey = 128'h4949542044656c686920526f636b7373; // "IIT Delhi Rockss"
plainText = 128'h54686520717569636b2062726f776e20;  // "The quick brown "

#10

plainText = 128'h666f78206a756d706564206f76657220; // "fox jumped over "

#10

plainText = 128'h746865206c617a7920646f672e202020; // "the lazy dog.   "


end

// Correct results are displayed after 21 Clock cycles after reset. 
// Until then garbage values will be displayed
initial #10 $monitorh ("Encrypted messgae: %p",cipherText);  

endmodule 
