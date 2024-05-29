module test_aes128_decryption();

reg [127:0] cipherText,privateKey;
wire [127:0] plainText;
reg clk,rst;

aes128_decryption a0(plainText,cipherText,privateKey,clk,rst);

always #5 clk = ~clk;

initial begin

rst = 0;
clk = 1;

#50

rst = 1;
privateKey = 128'h4949542044656c686920526f636b7373;

#200
cipherText = 128'h4d80f1063d5e5c7b09ee407b1153b4ee; // Encrypted form of 54686520717569636b2062726f776e20

#10
cipherText = 128'h59fc458cc22dce9193006fd01153e8f7; // Encrypted form of 666f78206a756d706564206f76657220

#10

cipherText = 128'he88e2b81afffe898841d08559e62953d; // Encrypted form of 746865206c617a7920646f672e202020



end

// Correct results are displayed after 41 Clock cycles after reset. 
// Until then garbage values will be displayed
initial $monitorh ("Decrypted messgae: %p",plainText);

endmodule 
