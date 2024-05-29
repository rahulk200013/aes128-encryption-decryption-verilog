from Crypto.Cipher import AES
import binascii


key = b'IIT Delhi Rockss'      # Change you private key here
msg = (b'The quick brown ')    # Change your message that you need to encrypt/decrypt here
cipher = AES.new(key, AES.MODE_ECB)


msg_en = cipher.encrypt(msg)

print('Key: ', key.decode())
print('Key in Hex: ', binascii.hexlify(key).decode())
print('Message: ', "'" + msg.decode() + "'" + "                             //Actual msg is without quotes. Quotes are used so that space at the end/start is visible.")
print('Message in Hex: ', binascii.hexlify(msg).decode())
print('Encrypted: ', binascii.hexlify(msg_en).decode())
decipher = AES.new(key, AES.MODE_ECB)
msg_dec = decipher.decrypt(msg_en)
print('Decrypted: ', binascii.hexlify(msg_dec).decode())
print("       ")
