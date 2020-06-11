package cn.itcast.bookStore.web.servlet.manager;

import cn.itcast.bookStore.domain.Customer;
import cn.itcast.bookStore.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FindConditionCust  extends HttpServlet {



    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CustomerService customerService = new CustomerService();
        Customer customer = new Customer();
        String id = req.getParameter("id");

        customer = customerService.findCustomer(id);

        req.setAttribute("customer", customer);

        req.getRequestDispatcher("/admin/customer/edit.jsp").forward(req, resp);
    }
}
