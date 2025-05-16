package utils;

import java.security.MessageDigest;
import java.util.Base64;

public class HashUtils {
    public static String hashPass(String password) {
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes("UTF-8"));
            Base64.Encoder encoder = Base64.getEncoder();
            return encoder.encodeToString(hash);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
