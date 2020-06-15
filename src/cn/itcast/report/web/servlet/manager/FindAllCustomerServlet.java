package cn.itcast.report.web.servlet.manager;

import cn.itcast.report.domain.Customer;
import cn.itcast.report.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class FindAllCustomerServlet extends HttpServlet{


    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CustomerService nService = new CustomerService();
        Customer customer = new Customer();
        String customerNo = req.getParameter("customerNo");
        String customerName = req.getParameter("customerName");
        customer.setCustomerNo(customerNo);
        customer.setCustomerName(customerName);
        List<Customer> list = nService.findAllCustomer(customer);
        req.setAttribute("customers", list);
        req.setAttribute("customerNo", customerNo);
        req.setAttribute("customerName", customerName);
        req.getRequestDispatcher("/admin/customer/list.jsp").forward(req, resp);
    }
}
