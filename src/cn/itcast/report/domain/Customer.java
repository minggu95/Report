package cn.itcast.report.domain;

import java.io.Serializable;

public class Customer implements Serializable {

    public static final long serialVersionUID = 1L;
    /**
     * ID
     */
    private int id;
    /**
     * 客户编号
     */
    private String customerNo;
    /**
     * 客户名称
     */
    private String customerName;
    /**
     * 地址
     */
    private String address;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerNo() {
        return customerNo;
    }

    public void setCustomerNo(String customerNo) {
        this.customerNo = customerNo;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
