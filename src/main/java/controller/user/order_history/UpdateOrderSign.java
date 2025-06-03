package controller.user.order_history;

import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.order.OrderRepository;

import java.io.IOException;

@WebServlet("/updateOrder")
public class UpdateOrderSign extends HttpServlet {
    OrderRepository orderRepository = new OrderRepository();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderID  = req.getParameter("orderId");
        String billindetify = req.getParameter("billindetify");
        String signatureInput = req.getParameter("signatureInput");
        User user = (User) req.getSession().getAttribute("user");

        orderRepository.updateSignOrderById(Long.parseLong(orderID), signatureInput, user.getKey());
        resp.sendRedirect(req.getContextPath() + "/historyOrder");

    }
}
