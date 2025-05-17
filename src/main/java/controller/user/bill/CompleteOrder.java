package controller.user.bill;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import com.google.gson.Gson;
import dto.request.OrderRequest;
import dto.response.DetailCartResponse;
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
        System.out.println(decodedCartIds);
        String[] selectedCartIds = new Gson().fromJson(decodedCartIds, String[].class);


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
        ), req, resp);
        getServletContext().removeAttribute("selectedCartIds");
        getServletContext().removeAttribute("outOfStockProducts");
        req.getSession().removeAttribute("selectedProducts");
        resp.sendRedirect(req.getContextPath() + "/view/user/successOrder.jsp");
    }
}
