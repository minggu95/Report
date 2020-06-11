package cn.itcast.bookStore.dao;

import cn.itcast.bookStore.domain.Customer;
import cn.itcast.bookStore.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class CustomerDao {

    public void addCustomer(Customer customer) throws SQLException{
        String sql = "insert into customer(customerNo,customerName,address) values(?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, customer.getCustomerNo(),customer.getCustomerName(), customer.getAddress());
    }

    public void deleteCustomer(String[] ids) throws SQLException{

        String sql = "delete  from customer where id in (";
        for(int i=0; i<ids.length; i++){
            sql+="'"+ids[i]+"',";
        }
        sql = sql.substring(0, sql.length() -1);
        sql+=")";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql);
    }

    public void updateCustomer(Customer customer) throws SQLException{
        String sql = "update customer  set customerNo = ?,customerName = ?,address = ? where id = ?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, customer.getCustomerNo(),customer.getCustomerName(), customer.getAddress(), customer.getId());
    }

    public Customer findCustomer(String id) throws SQLException{
        String sql = "select * from customer where id = ?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanHandler<Customer>(Customer.class), id);
    }

    public List<Customer> findAllCustomer(Customer customer) throws SQLException{
        String sql = "select * from customer where 1=1 ";
        if(!"".equals(customer.getCustomerNo()) && customer.getCustomerNo() != null){
            sql+=" and customerNo='"+customer.getCustomerNo()+"'";
        }
        if(!"".equals(customer.getCustomerName()) && customer.getCustomerName() != null){
            sql+=" and customerName='"+customer.getCustomerName()+"'";
        }
        sql+="order by id desc limit 0,10";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<Customer>(Customer.class));
    }
}
