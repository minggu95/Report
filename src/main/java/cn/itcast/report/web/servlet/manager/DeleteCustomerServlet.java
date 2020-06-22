package cn.itcast.report.web.servlet.manager;

import cn.itcast.report.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteCustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CustomerService customerService = new CustomerService();
        String id = req.getParameter("id");
        String [] ids = id.split(",");
        if(!"".equals(ids[0])) {
            customerService.deleteCustomer(ids);
        }
    }
}
