package cn.itcast.bookStore.web.servlet.manager;


import cn.itcast.bookStore.domain.Customer;
import cn.itcast.bookStore.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddCustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CustomerService customerService = new CustomerService();
        Customer customer = new Customer();
        String customerNo = req.getParameter("customerNo");
        String customerName = req.getParameter("customerName");
        String address = req.getParameter("address");
        customer.setCustomerNo(customerNo);
        customer.setCustomerName(customerName);
        customer.setAddress(address);

        customerService.addCustomer(customer);

        req.getRequestDispatcher(req.getContextPath()+"/listCustomer").forward(req, resp);
    }
}
