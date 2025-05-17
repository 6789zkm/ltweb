package entity;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import dto.response.AdminOrderResponse;
import dto.response.DetailCartResponse;

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
}
