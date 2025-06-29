package controller.admin.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import dto.response.AdminOrderResponse;
import entity.Bill;
import entity.IOrderResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.order.OrderRepository;

@WebServlet("/order")
public class OrderController extends HttpServlet {
	OrderRepository orderRepo = new OrderRepository();
	private class User {
		private String name;
		private String address;
		private String phone;

		public User(String name, String address, String phone) {
			this.name = name;
			this.address = address;
			this.phone = phone;
		}

		public String getName() {
			return name;
		}

		public String getAddress() {
			return address;
		}

		public String getPhone() {
			return phone;
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Lấy danh sách đơn hàng từ repository
		List<AdminOrderResponse> list = orderRepo.getAllOrderWithResponse();

		// Sắp xếp danh sách đơn hàng theo id_order_admin
		List<AdminOrderResponse> sortedListOrder = list.stream()
				.sorted(Comparator.comparingLong(AdminOrderResponse::getId_order_admin))
				.collect(Collectors.toList());

		Map<Long, List<IOrderResponse>> groupedOrders = groupByOrderId(list);
        Map<Long, Bill> orderBillMap = new HashMap<>();
		Map<Long, User> groupUserByOrderId = groupUserByOrderId(list);
        for (Map.Entry<Long, List<IOrderResponse>> entry : groupedOrders.entrySet()) {
            Long orderId = entry.getKey();
            List<IOrderResponse> orderResponses = getOrdersById(orderId, list);

            String customerName = groupUserByOrderId.get(orderId).getName();
            String customerAddress = groupUserByOrderId.get(orderId).getAddress();
            String customerPhone = groupUserByOrderId.get(orderId).getPhone();

            Bill bill = new Bill(orderResponses, customerName, customerAddress, customerPhone);
            orderBillMap.put(orderId, bill);
        }
		// Đặt danh sách đã sắp xếp vào request attribute
		req.setAttribute("list_order", sortedListOrder);
		req.setAttribute("orderBillMap", orderBillMap);
		// Forward request đến trang JSP
		req.getRequestDispatcher("view/admin/admin_order.jsp").forward(req, resp);
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

	private Map<Long, User> groupUserByOrderId(List<AdminOrderResponse> list) {
        Map<Long, User> groupedOrders = new HashMap<>();
        for (AdminOrderResponse order : list) {
            Long orderId = order.getId_order_admin();
            if (!groupedOrders.containsKey(orderId)) {
                groupedOrders.put(orderId, new User(order.getName_customer(), order.getAddress(), order.getPhone()));
            }
        }
        return groupedOrders;
    }

	private List<IOrderResponse> getOrdersById(Long id, List<AdminOrderResponse> list) {
		List<IOrderResponse> f = new ArrayList<>();
		for (AdminOrderResponse o : list) {
			if (o.getId_order_admin() == id) {
				f.add(o);
			}
		}

		return f;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}