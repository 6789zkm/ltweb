package dto.response;

import entity.IOrderResponse;

public class AdminOrderResponse implements IOrderResponse {
	private long id_order_admin;
	private long productSkuId;
	private String name_customer;
	private String name_product;
	private int quantity_order;
	private double totalPrice;
	private String address;
	private String date_order;
	private String status;
	private String sign;
	private String publicKey;
	private String phone;
	private double productPrice;
	public AdminOrderResponse(long id_order_admin, long productSkuId, String name_customer, String name_product, int quantity_order,
							  double totalPrice, String address, String date_order ,String status, String sign, String phone, String publicKey, double productPrice) {
		super();
		this.id_order_admin = id_order_admin;
		this.name_customer = name_customer;
		this.name_product = name_product;
		this.quantity_order = quantity_order;
		this.totalPrice = totalPrice;
		this.address = address;
		this.date_order = date_order;
		this.status = status;
		this.sign = sign;
		this.productSkuId = productSkuId;
		this.phone = phone;
		this.publicKey = publicKey;
		this.productPrice = productPrice;
	}

	public long getId_order_admin() {
		return id_order_admin;
	}
	public String getName_customer() {
		return name_customer;
	}
	public String getName_product() {
		return name_product;
	}
	public int getQuantity_order() {
		return quantity_order;
	}
	public double getPrice() {
		return productPrice;
	}
	public String getStatus() {
		return status;
	}
	public String getPhone() {
		return phone;
	}
	public String getAddress() {return address;}
	public String getDate_order() {return date_order;}
	public String getSign() {return sign;}
	@Override
	public String toString() {
		return "AdminOrderResponse [id_order_admin=" + id_order_admin + ", name_employee=" + name_customer
				+ ", name_product=" + name_product + ", quantity_order=" + quantity_order + ", price=" + totalPrice
				+ ", address=" + address + ", date=" + date_order +", status=" + status + ",sign=" + sign + "]";
	}
	@Override
	public long getProductSkuId() {
		return productSkuId;
	}
	@Override
	public int getQuantity() {
		return quantity_order;
	}

	public String getPublicKey() {
		return publicKey;
	}
}