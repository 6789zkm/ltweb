package controller.user.bill;

import dto.response.AdminOrderResponse;
import dto.response.DetailCartResponse;
import entity.Bill;
import entity.IOrderResponse;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.order.OrderRepository;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/bill")
public class BillView extends HttpServlet {
    OrderRepository orderRepository = new OrderRepository();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<DetailCartResponse> selectedProducts = (List<DetailCartResponse>) req.getSession().getAttribute("selectedProducts");

        String customerName = user.getName();
        String customerAddress = user.getAddress();
        String customerPhone = user.getPhone();

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
        List<IOrderResponse> orderResponses = new ArrayList<>();
        for (DetailCartResponse detailCartResponse : selectedProducts) {
            orderResponses.add(detailCartResponse);
        }
//        resp.sendRedirect(req.getContextPath() + "/view/user/bill.jsp");
        req.getSession().setAttribute("bill", new Bill(orderResponses, customerName, customerAddress, customerPhone));
        req.getRequestDispatcher("/view/user/bill.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
