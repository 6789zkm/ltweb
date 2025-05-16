package controller.user.order_history;

import dto.response.AdminOrderResponse;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.order.OrderRepository;

import java.io.IOException;
import java.util.List;

@WebServlet("/historyOrder")
public class OrderHistoryView extends HttpServlet {
    OrderRepository orderRepository = new OrderRepository();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<AdminOrderResponse> list_pending = orderRepository.getAllOrderWithPending(user.getId());
        List<AdminOrderResponse> list_success = orderRepository.getAllOrderWithSuccess(user.getId());
        List<AdminOrderResponse> list_cancle = orderRepository.getAllOrderWithCancle(user.getId());
        req.setAttribute("list_pending", list_pending);
        req.setAttribute("list_success", list_success);
        req.setAttribute("list_cancle", list_cancle);
        req.getRequestDispatcher("/view/user/order_history.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
