package controller.user.order_history;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        List<AdminOrderResponse> list = new ArrayList<>();


        for (AdminOrderResponse detailCartResponse : list_pending) {
            list.add(detailCartResponse);
        }

        for (AdminOrderResponse detailCartResponse : list_success) {
            list.add(detailCartResponse);
        }

        for (AdminOrderResponse detailCartResponse : list_cancle) {
            list.add(detailCartResponse);
        }

        Map<Long, List<IOrderResponse>> groupedOrders = groupByOrderId(list);
        Map<Long, Bill> orderBillMap = new HashMap<>();

        for (Map.Entry<Long, List<IOrderResponse>> entry : groupedOrders.entrySet()) {
            Long orderId = entry.getKey();
            List<IOrderResponse> orderResponses = entry.getValue();

            String customerName = user.getName();
            String customerAddress = user.getAddress();
            String customerPhone = user.getPhone();

            Bill bill = new Bill(orderResponses, customerName, customerAddress, customerPhone);
            orderBillMap.put(orderId, bill);
        }

        req.setAttribute("orderBillMap", orderBillMap);
        req.getRequestDispatcher("/view/user/order_history.jsp").forward(req, resp);
    }

    private Map<Long, List<IOrderResponse>> groupByOrderId(List<AdminOrderResponse> list) {
        Map<Long, List<IOrderResponse>> groupedOrders = new HashMap<>();
        for (AdminOrderResponse order : list) {
            Long orderId = order.getId_order_admin();
            if (!groupedOrders.containsKey(orderId)) {
                groupedOrders.put(orderId, new ArrayList<>());
            }
            groupedOrders.get(orderId).add(order);
        }
        return groupedOrders;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
