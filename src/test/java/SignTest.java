import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class SignTest {
    public static PublicKey loadPublicKey(String pem) throws Exception {
        String publicKeyPEM = pem
                .replace("-----BEGIN PUBLIC KEY-----", "")
                .replace("-----END PUBLIC KEY-----", "")
                .replaceAll("\\s", "");

        byte[] encoded = Base64.getDecoder().decode(publicKeyPEM);
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(encoded);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA"); // Hoặc "EC", "DSA", tùy loại key
        return keyFactory.generatePublic(keySpec);
    }

    public static PrivateKey loadPrivateKey(String pem) throws Exception {
        String privateKeyPEM = pem
                .replace("-----BEGIN PRIVATE KEY-----", "")
                .replace("-----END PRIVATE KEY-----", "")
                .replaceAll("\\s", "");

        byte[] encoded = Base64.getDecoder().decode(privateKeyPEM);
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(encoded);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        return keyFactory.generatePrivate(keySpec);
    }

    public static byte[] decodeSign(String sign) {
        return Base64.getDecoder().decode(sign.getBytes(StandardCharsets.UTF_8));
    }

    public static String encodeSign(byte[] sign) {
        return new String(Base64.getEncoder().encode(sign), StandardCharsets.ISO_8859_1);
    }

    public static void toReadable(String en) {
        byte[] text = Base64.getDecoder().decode(en);
        System.out.println(new String(text));
    }
    public static void main(String[] args) throws Exception {
//        PublicKey kp = loadPublicKey("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwnxPy5LV2pAfDk78vxd5W/nqM2bP/MR93bFbd2P3lBzGim225CG0MQ7xBM2yxmy2B8fo0wIYrOh2NUcgjvxNfh4sYR+FvtwDzplNIfUqzYsCKGvEBDL56aZ9/922UQrvieoGX788f+fVVqvPJ5M6ePwsM/8agDGYEGJM9GY02sNaAHUFtri+pqbGD0ZUMB87F+R6kmTeQHbkRdqHFT1GCaDJsT9QLxjsxFZdGwr8vkiPLtmcXVZ7ebJWGMKmoyh4jv7dXi63DxZnxSqRQLqpgG6WK4Jy6nm196xAHuEPdbpImwjaqFqxDeXBSFSsynnHjHBRCELWPJBnu8n1QjXhQwIDAQAB");

        PrivateKey kpr = loadPrivateKey("MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDCfE/LktXakB8OTvy/F3lb+eozZs/8xH3dsVt3Y/eUHMaKbbbkIbQxDvEEzbLGbLYHx+jTAhis6HY1RyCO/E1+HixhH4W+3APOmU0h9SrNiwIoa8QEMvnppn3/3bZRCu+J6gZfvzx/59VWq88nkzp4/Cwz/xqAMZgQYkz0ZjTaw1oAdQW2uL6mpsYPRlQwHzsX5HqSZN5AduRF2ocVPUYJoMmxP1AvGOzEVl0bCvy+SI8u2ZxdVnt5slYYwqajKHiO/t1eLrcPFmfFKpFAuqmAbpYrgnLqebX3rEAe4Q91ukibCNqoWrEN5cFIVKzKeceMcFEIQtY8kGe7yfVCNeFDAgMBAAECggEAXKmP90VxoN4T/eRCZeWQS/NJ083DgQI5mfvbwYmetzHyopfdkNpCGTGuQgSjjgjTvedQleCk0xU65O2LpLSvU0ybBndXaPU41yGRb4F5ME9v6sRVs056ZgmOdO80424bbRFUkh/yelqB+faID6oFLQmxIeEExllaw0uisLtVqXifbv6BI9wdaTMaKTJRmWatTIVEkzaJNh7ZDm8D8vPwy3JQvuJrnIFdgfJsosbtRfTnVYNWND9vgFJ8dgtFUseQNlrQu5R09Xw3B7zeUkb8c7ZMCeIAiQDEL+Qv+0tI1V/nWubH0V8kqV8P3oilUIkOU7XyM5e7nBvV3fP6+Dw+wQKBgQDiJfA62HWNHnOGybNYNFB5rzJP8b6oS1UhyGuHpXYpFTQ3epNS3gbhgHl/1KXHcQbJiLAGf5xzmVdU+7aFduISNHA1yE32Tbv2wQliPFqoix1s3ZNByeRY9VCr0ERcrzd7LYx1c9x+8VNWW6w4VLeLccvESfr1V3Zzfi7lQy5QIwKBgQDcKGwD60NniIpSMyXndwWCCFE3v95TkLtZnrHOAf3l36oZiY7Su+Xcoye4ems1il4WZsYdV67mMMRdpXDYip/8TEAi5ZD+Mh1mIxR7zbiM5uXYIQfPCihtcSIy2uU89wYjK3hSrNC44BO5LtlWAlHqaEfoIusq42JdKuPAZQasYQKBgCPzB/cyxa0DNDYvBhV1a32MfiD7OuWh5AyUwZM0mE37kutmztiTduCN/cJ2WUwVCZEr6199Fa/CpoFZ6i/ZMCLYtyW1i78lqEWXdhhpo7e7NZhCuM/yehwyEvrdBqD9MYKhQPzCyEBduHO36u6hePPvyQaRBBXQK4I8gtPrFAelAoGBAMvwcebLd5wfwqpUkScyfRqwY7P1+5iDeNmTBPhlpfHcV/DiGTijMFJLnQ7p8AgfzfqIZ7tkrzKzOCPbjoY5G+yWIc9xwveGKu+jTWVF81Aqz/1+04H50etXoqtjVHk+ByRrL0G+rnajtAGWIWPoMEOpJ/sk5Z3MFyFhCqr9qsnhAoGBANrTTPru72/s5CfsjwvkUbYDEtKF2Uetl4VobIBkLrmH3RJaY+KxbJH+yzA5frjefackM+8dSWKSiRq0z4NKvDoRUBSMFT3Nv4a3WlfjY3pvcN0+v+jsb+5UrS6T7/51oRg9zwa3Y2bX1PbmgkMRYzpBawV6WmMYVsHVt2VGQCEn");

        PublicKey kp = loadPublicKey("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwnxPy5LV2pAfDk78vxd5W/nqM2bP/MR93bFbd2P3lBzGim225CG0MQ7xBM2yxmy2B8fo0wIYrOh2NUcgjvxNfh4sYR+FvtwDzplNIfUqzYsCKGvEBDL56aZ9/922UQrvieoGX788f+fVVqvPJ5M6ePwsM/8agDGYEGJM9GY02sNaAHUFtri+pqbGD0ZUMB87F+R6kmTeQHbkRdqHFT1GCaDJsT9QLxjsxFZdGwr8vkiPLtmcXVZ7ebJWGMKmoyh4jv7dXi63DxZnxSqRQLqpgG6WK4Jy6nm196xAHuEPdbpImwjaqFqxDeXBSFSsynnHjHBRCELWPJBnu8n1QjXhQwIDAQAB");
        Signature signature = Signature.getInstance("SHA256withRSA");

        signature.initSign(kpr);

        String code = "MTE2LDEsMzkyMDAwLjA7MTI1LDEsNDIyMDAwLjA7MTM2LDEsMjM1MDAwMC4wOzE3MCwxLDU4OTAwMC4wO0toYWNoIEhhbmcgNCxUaGFuaCBTYW8gVnVvbmcsODQwMDkzMjE0MTs=";
        toReadable("MTE2LDEsMzc1MzAwMC4wOzEyNSwxLDM3NTMwMDAuMDsxMzYsMSwzNzUzMDAwLjA7MTcwLDEsMzc1MzAwMC4wO0toYWNoIEhhbmcgNCxUaGFuaCBTYW8gVnVvbmcsODQwMDkzMjE0MTs=");
        toReadable(code);
        signature.update(code.getBytes(StandardCharsets.UTF_8));
//        byte[] s = signature.sign();
        System.out.println(encodeSign(signature.sign()));
        byte[] s = decodeSign("TLhfTKAeJgKA3rtVt7/zr0Fi/YOO+Rzkxf6kgAW54SyU9133/kI/GQKITH4yuliSsvHEghvKP0MDBmP8KwvGkINjIebEz+OP2wtxa4kh7fDSiW1ih1tFbH3B9uXFy72CHIhiRAyusa2yp4OuOXNEwGTG5dJKThLlc7vMhqy1g0PBgGFUJj1pXHW5MYsGSfMAh9zLanJ0HUK2YJzYAl3JuEKhmroiE8UiYf4qv2HtrQAlWvJP7Q3zCprONd0c7Hh9pHvU1+ss4gMPIT+ZkRjhSK8RUQoV9lVUvuUiyR1M/rluztynZm6IjXxT6QKCIN87Ogq0HmJIOrWp8JHssA6anQ==");
        signature = Signature.getInstance("SHA256withRSA");
        signature.initVerify(kp);
        signature.update(code.getBytes(StandardCharsets.UTF_8));
        System.out.println(signature.verify(s));

    }
}