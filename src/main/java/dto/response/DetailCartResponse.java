package dto.response;

import entity.IOrderResponse;

public class DetailCartResponse implements IOrderResponse {
	private Long cartId;
	private Long productSkuId;
	private String name;
	private String image;
	private String color;
	private String size;
	private int quantity;
	private double price;


	public DetailCartResponse() {
		super();
	}


	public DetailCartResponse(Long cartId, Long productSkuId, String name, String image, String color, String size, int quantity,
			double price) {
		super();
		this.cartId = cartId;
		this.name = name;
		this.image = image;
		this.color = color;
		this.size = size;
		this.quantity = quantity;
		this.price = price;
		this.productSkuId = productSkuId;
	}


	public Long getCartId() {
		return cartId;
	}


	public void setCartId(Long cartId) {
		this.cartId = cartId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getSize() {
		return size;
	}


	public void setSize(String size) {
		this.size = size;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}

	public long getProductSkuId() {
		return productSkuId;
	}

	public void setProductSkuId(Long productSkuId) {
		this.productSkuId = productSkuId;
	}


	@Override
	public String toString() {
		return "DetailCartResponse [cartId=" + cartId + ", name=" + name + ", image=" + image + ", color=" + color
				+ ", size=" + size + ", quantity=" + quantity + ", price=" + price + "]";
	}

}
