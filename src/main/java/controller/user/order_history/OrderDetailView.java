package controller.user.order_history;

import dto.response.AdminOrderResponse;
import dto.response.DetailCartResponse;
import entity.Bill;
import entity.IOrderResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.order.OrderRepository;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/orderDetail")
public class OrderDetailView extends HttpServlet {
    OrderRepository orderRepository = new OrderRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderID = req.getParameter("orderID");
        List<AdminOrderResponse> order = orderRepository.getAllOrderWithResponseId(Long.parseLong(orderID));
        ArrayList<IOrderResponse> iOrderResponse = new ArrayList<>(order);


        Bill bill = new Bill(iOrderResponse, order.get(0).getName_customer(), order.get(0).getAddress(), order.get(0).getPhone());
        req.getSession().setAttribute("order", order);
        req.getSession().setAttribute("bill", bill);
        req.setAttribute("orderID", orderID);
        req.setAttribute("customerName", order.get(0).getName_customer());
        req.setAttribute("customerAddress", order.get(0).getAddress());
        req.setAttribute("customerPhone", order.get(0).getPhone());

        req.getRequestDispatcher("/view/user/order_detail.jsp").forward(req, resp);
    }
}
