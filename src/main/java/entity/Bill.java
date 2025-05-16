package entity;

import dto.response.DetailCartResponse;

import java.util.List;

public class Bill {
    private List<DetailCartResponse> detailCartResponses;
    String customerName;
    String customerAddress;
    String customerPhone;

    public Bill(List<DetailCartResponse> detailCartResponses, String customerName, String customerAddress, String customerPhone) {
        this.detailCartResponses = detailCartResponses;
        this.customerName = customerName;
        this.customerAddress = customerAddress;
        this.customerPhone = customerPhone;
    }

    public List<DetailCartResponse> getDetailCartResponses() {
        return detailCartResponses;
    }

    public void setDetailCartResponses(List<DetailCartResponse> detailCartResponses) {
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
}
