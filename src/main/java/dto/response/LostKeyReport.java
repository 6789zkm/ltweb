package dto.response;


import java.sql.Timestamp;

public class LostKeyReport {
    private Long id;
    private Long userID;
    private String name;
    private String email;
    private String phone;
    private String publicKey;
    private Timestamp reportTime;
    private boolean isHandled;

    public LostKeyReport() {
    }

    public LostKeyReport(Long id, Long userID, String name, String email, String phone, String publicKey, Timestamp reportTime, boolean isHandled) {
        this.id = id;
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.publicKey = publicKey;
        this.reportTime = reportTime;
        this.isHandled = isHandled;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserID() {
        return userID;
    }

    public void setUserID(Long userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public Timestamp getReportTime() {
        return reportTime;
    }

    public void setReportTime(Timestamp reportTime) {
        this.reportTime = reportTime;
    }

    public boolean isHandled() {
        return isHandled;
    }

    public void setHandled(boolean handled) {
        isHandled = handled;
    }

    @Override
    public String toString() {
        return "LostKeyReport{" +
                "id=" + id +
                ", userID=" + userID +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", publicKey='" + publicKey + '\'' +
                ", reportTime=" + reportTime +
                ", isHandled=" + isHandled +
                '}';
    }
}

