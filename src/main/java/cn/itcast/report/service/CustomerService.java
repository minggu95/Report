package cn.itcast.report.service;

import cn.itcast.report.dao.CustomerDao;
import cn.itcast.report.domain.Customer;

import java.sql.SQLException;
import java.util.List;

public class CustomerService {

    private CustomerDao customerDao = new CustomerDao();

    public void addCustomer(Customer customer){
        try{
            customerDao.addCustomer(customer);
        }catch (SQLException e){
            throw new RuntimeException("添加客户失败!");
        }
    }

    public void deleteCustomer(String[] id){
        try{
            customerDao.deleteCustomer(id);
        }catch (SQLException e){
            throw new RuntimeException("删除客户失败!");
        }
    }

    public void updateCustomer(Customer customer){
        try{
            customerDao.updateCustomer(customer);
        }catch (SQLException e){
            throw new RuntimeException("修改客户失败!");
        }
    }

    public Customer findCustomer(String id){
        try{
            return customerDao.findCustomer(id);
        }catch (SQLException e){
            throw new RuntimeException("查询客户失败!");
        }
    }

    public List<Customer> findAllCustomer(Customer customer){
        try{
            return customerDao.findAllCustomer(customer);
        }catch (SQLException e){
            throw new RuntimeException("查询客户失败!");
        }
    }
}
