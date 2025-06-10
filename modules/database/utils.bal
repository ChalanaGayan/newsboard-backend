import ballerina/crypto;
import ballerina/random;


public isolated function hash(string value) returns string {
    return crypto:hashSha256(value.toBytes()).toBase16();
}

public isolated function encrypt(string value) returns string|error {
    byte[16] iv = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    foreach var i in 0 ... 15 {
        iv[i] = <byte>(check random:createIntInRange(0, 255));
    }
    string cipherText = toHexString(check crypto:encryptAesCbc(value.toBytes(), encryptionKey.toBytes(), iv));
    return string `${iv.toBase16()}:{cipherText}`;
}

public isolated function toHexString(byte[] bytes) returns string {
    string hexString = "";
    foreach byte b in bytes {
        int high = (b & 0xF0) / 16;
        int low = (b & 0xF0) % 16;
        hexString += HEX_DIGITS.substring(high, high + 1);
        hexString += HEX_DIGITS.substring(low, low + 1);
    }
    return hexString;
}
