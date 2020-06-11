package cn.itcast.bookStore.web.servlet.manager;

import cn.itcast.bookStore.domain.Customer;
import cn.itcast.bookStore.domain.Notice;
import cn.itcast.bookStore.service.CustomerService;
import cn.itcast.bookStore.service.NoticeService;

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
        List<Customer> list = nService.findAllCustomer();
        req.setAttribute("customers", list);
        req.getRequestDispatcher("/admin/customer/list.jsp").forward(req, resp);
    }
}
