package controller.user.bill;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import com.google.gson.Gson;
import dto.request.OrderRequest;
import dto.response.DetailCartResponse;
import entity.Bill;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.order.OrderService;

@WebServlet("/completeOrder")
public class CompleteOrder extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        Bill bill = (Bill) req.getSession().getAttribute("bill");
        OrderService orderService = new OrderService();
        List<DetailCartResponse> selectedProducts = (List<DetailCartResponse>) req.getSession().getAttribute("selectedProducts");
        
        String customerName = user.getName();
        String customerAddress = user.getAddress();
        String customerPhone = user.getPhone();
        String customerEmail = user.getEmail();
        double totalPrice = 0;

        String encodedCartIds = (String) getServletContext().getAttribute("selectedCartIds");
        // Giải mã URL
        String decodedCartIds = URLDecoder.decode(encodedCartIds, "UTF-8");
        String[] selectedCartIds = new Gson().fromJson(decodedCartIds, String[].class);

        String sign = (String) req.getParameter("signatureInput");
        if (sign == null || sign.isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập chữ ký.");
            req.getRequestDispatcher("/view/user/bill.jsp").forward(req, resp);
            return;
        }

        if (!bill.verify(user.getKey(), sign)) {
            req.setAttribute("error", "Chữ ký không hợp lệ.");
            req.getRequestDispatcher("/view/user/bill.jsp").forward(req, resp);
            return;
        }


        for (DetailCartResponse product : selectedProducts) {
            totalPrice += product.getPrice() * product.getQuantity();
        }

        orderService.processOrderItems(user, new OrderRequest(
            totalPrice,
            customerName,
            customerEmail,
            customerPhone,
            customerAddress,
                selectedCartIds
        ), req, resp, sign);
        getServletContext().removeAttribute("selectedCartIds");
        getServletContext().removeAttribute("outOfStockProducts");
        req.getSession().removeAttribute("selectedProducts");
        resp.sendRedirect(req.getContextPath() + "/successOrder");
    }
}
