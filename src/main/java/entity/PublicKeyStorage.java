package entity;

import java.sql.Timestamp;

public class PublicKeyStorage {
    private Long userID;
    private String publicKey;
    private Timestamp updateAt;

    public PublicKeyStorage() {
    }

    public PublicKeyStorage(Long userID, String publicKey, Timestamp updateAt) {
        this.userID = userID;
        this.publicKey = publicKey;
        this.updateAt = updateAt;
    }

    public Long getUserID() {
        return userID;
    }

    public void setUserID(Long userID) {
        this.userID = userID;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    @Override
    public String toString() {
        return "PublicKeyStorage{" +
                "userID=" + userID +
                ", publicKey='" + publicKey + '\'' +
                ", updateAt=" + updateAt +
                '}';
    }
}

