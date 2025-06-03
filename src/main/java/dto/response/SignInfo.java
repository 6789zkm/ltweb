package dto.response;

import java.util.Date;

public class SignInfo {
    private long id;
    private String name;
    private String email;
    private String phone;
    private Date create_date;
    private String publickey;
    private boolean isDelete;

    public SignInfo(long id, String name, String email, String phone, Date create_date, String publickey, boolean isDelete) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.create_date = create_date;
        this.publickey = publickey;
        this.isDelete = isDelete;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public String getPublickey() {
        return publickey;
    }

    public boolean getIsDelete() {
        return isDelete;
    }

    @Override
    public String toString() {
        return "SignInfo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", create_date=" + create_date +
                ", publickey='" + publickey + '\'' +
                ", isDelete=" + isDelete +
                '}';
    }
}
