package controller.admin.order;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import dto.response.AdminOrderResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.order.OrderRepository;

@WebServlet("/order")
public class OrderController extends HttpServlet {
	OrderRepository orderRepo = new OrderRepository();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Lấy danh sách đơn hàng từ repository
		List<AdminOrderResponse> list = orderRepo.getAllOrderWithResponse();

		// Sắp xếp danh sách đơn hàng theo id_order_admin
		List<AdminOrderResponse> sortedListOrder = list.stream()
				.sorted(Comparator.comparingLong(AdminOrderResponse::getId_order_admin))
				.collect(Collectors.toList());

		// Đặt danh sách đã sắp xếp vào request attribute
		req.setAttribute("list_order", sortedListOrder);

		// Forward request đến trang JSP
		req.getRequestDispatcher("view/admin/admin_order.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}