package entity;

import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import java.util.List;

public class Bill {
    private List<IOrderResponse> detailCartResponses;
    String customerName;
    String customerAddress;
    String customerPhone;

    public Bill(List<IOrderResponse> detailCartResponses, String customerName, String customerAddress, String customerPhone) {
        this.detailCartResponses = detailCartResponses;
        this.customerName = customerName;
        this.customerAddress = customerAddress;
        this.customerPhone = customerPhone;
    }

    public List<IOrderResponse> getDetailCartResponses() {
        return detailCartResponses;
    }

    public void setDetailCartResponses(List<IOrderResponse> detailCartResponses) {
        this.detailCartResponses = detailCartResponses;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String toString() {
        return "Bill{" +
                "detailCartResponses=" + detailCartResponses +
                ", customerName='" + customerName + '\'' +
                ", customerAddress='" + customerAddress + '\'' +
                ", customerPhone='" + customerPhone + '\'' +
                '}';
    }


    public String encode() {
        StringBuilder encodedString = new StringBuilder();
        for (IOrderResponse product : detailCartResponses) {
            encodedString.append(product.getProductSkuId()).append(",")
                    .append(product.getQuantity()).append(",")
                    .append(product.getPrice()).append(";");

                
        }
        encodedString.append(customerName).append(",")
                .append(customerAddress).append(",")
                .append(customerPhone).append(";");

        byte[] bytes = encodedString.toString().getBytes();

        return Base64.getEncoder().encodeToString(bytes);
    }

    public String encodeDisplay() {
        String encode = encode();

        StringBuilder displayString = new StringBuilder();
        // cắt nhỏ và thêm "..." vao giữa
        int maxLength = 6; // độ dài tối đa của chuỗi hiển thị
        if (encode.length() > maxLength) {
            displayString.append(encode, 0, maxLength / 2)
                    .append("...")
                    .append(encode, encode.length() - maxLength / 2, encode.length());
        }
        else {
            displayString.append(encode);
        }
        return displayString.toString();

    }

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

    public static String decode(String code) {
        byte[] text = Base64.getDecoder().decode(code);
        return new String(text);
    }

    public static byte[] decodeSign(String sign) {
        return Base64.getDecoder().decode(sign.getBytes(StandardCharsets.UTF_8));
    }

    public boolean verify(String publicKey, String sign) {
        if (publicKey == null || sign == null) {
            return false;
        }

        if (publicKey.isEmpty() || sign.isEmpty()) {
            return false;
        }
        try {
            PublicKey key = loadPublicKey(publicKey);
            Signature signature = Signature.getInstance("SHA256withRSA");
            signature.initVerify(key);
            signature.update(encode().getBytes(StandardCharsets.UTF_8));
            return signature.verify(decodeSign(sign.trim()));

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
