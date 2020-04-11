package member.seed;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

public class KISA_SEED {
	 
    static String charset = "utf-8";
 
    public static byte pbUserKey[] = { (byte) 0x12, (byte) 0x25, (byte) 0x54, (byte) 0x47, 
            (byte) 0x45, (byte) 0x4E, (byte) 0x12, (byte) 0x32, (byte) 0x19, (byte) 0x5E, 
            (byte) 0x2A, (byte) 0x2A, (byte) 0x65, (byte) 0x26,
            (byte) 0x38, (byte) 0x54 };
    
    public static byte bszIV[] = { (byte) 0x22, (byte) 0x25, (byte) 0x28, (byte) 0x5E, 
            (byte) 0x1A, (byte) 0x2A, (byte) 0x25, (byte) 0x21, (byte) 0x21, (byte) 0x42, 
            (byte) 0x45, (byte) 0x78, (byte) 0x41, (byte) 0x55, (byte) 0x4A, (byte) 0x21 };
    
    public static void main(String[] args) {
        
        String encryptData;
        
        try {
            encryptData = encrypt("TEST");
            decrypt(encryptData);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
 
    public static String encrypt(String str) throws UnsupportedEncodingException {
        byte[] msg = null;
 
        try {
            msg = KISA_SEED_CBC.SEED_CBC_Encrypt(pbUserKey, bszIV, str.getBytes(charset), 0,
                    str.getBytes(charset).length);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
 
        Encoder encoder = Base64.getEncoder();
        byte[] encArray = encoder.encode(msg);
        try {
            System.out.println(new String(encArray, "utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return new String(encArray, "utf-8");
    }
 
    public static String decrypt(String str) {
 
        Decoder decoder = Base64.getDecoder();
        byte[] msg = decoder.decode(str);
 
        String result = "";
        byte[] dec = null;
 
        try {
            dec = KISA_SEED_CBC.SEED_CBC_Decrypt(pbUserKey, bszIV, msg, 0, msg.length);
            result = new String(dec, charset);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
 
        System.out.println("decrypt Result = " + result);
        return result;
    }
 
}