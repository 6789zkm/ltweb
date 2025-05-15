package entity;

import java.time.LocalDate;

public class User {
	private Long id;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String password;
	private LocalDate createAt;
	private LocalDate updateAt;
	private String key;

	public User() {
	}

	public User(Long id, String name, String email, String phone, String address, String password, LocalDate createAt,
			LocalDate updateAt) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.password = password;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}

	public User(Long id, String name, String phone, String email, String address, String password, LocalDate createAt, LocalDate updateAt, String key) {
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.password = password;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.key = key;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public LocalDate getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDate createAt) {
		this.createAt = createAt;
	}

	public LocalDate getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(LocalDate updateAt) {
		this.updateAt = updateAt;
	}

	public String getKey() {
		return key;
	}

	public String getPassword() {
		return password;
	}

	public void setKey(String key) {
		this.key = key;
	}

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", name='" + name + '\'' +
				", email='" + email + '\'' +
				", phone='" + phone + '\'' +
				", address='" + address + '\'' +
				", password='" + password + '\'' +
				", createAt=" + createAt +
				", updateAt=" + updateAt +
				", key='" + key + '\'' +
				'}';
	}
}
