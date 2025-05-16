package controller.user.bill;

import dto.response.AdminOrderResponse;
import dto.response.DetailCartResponse;
import entity.Bill;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.order.OrderRepository;

import java.io.IOException;
import java.util.List;

@WebServlet("/bill")
public class BillView extends HttpServlet {
    OrderRepository orderRepository = new OrderRepository();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<DetailCartResponse> selectedProducts = (List<DetailCartResponse>) req.getSession().getAttribute("selectedProducts");

        String customerName = req.getParameter("customerName");
        String customerAddress = req.getParameter("customerAddress");
        String customerPhone = req.getParameter("customerPhone");

        System.out.println(selectedProducts);
        System.out.println(user);
        System.out.println(customerName);
        System.out.println(customerAddress);
        System.out.println(customerPhone);

        req.setAttribute("selectedProducts", selectedProducts);
        req.setAttribute("user", user);
        req.setAttribute("customerName", customerName);
        req.setAttribute("customerAddress", customerAddress);
        req.setAttribute("customerPhone", customerPhone);
//        resp.sendRedirect(req.getContextPath() + "/view/user/bill.jsp");
        req.getSession().setAttribute("bill", new Bill(selectedProducts, customerName, customerAddress, customerPhone));
        req.getRequestDispatcher("/view/user/bill.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
