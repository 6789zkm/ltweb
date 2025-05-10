package controller.user.cart;

import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/processCheckout")
public class CheckoutOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        // Thiết lập phản hồi JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        JSONObject jsonResponse = new JSONObject();

        if (user == null) {
            // Lưu URL hiện tại để chuyển hướng sau khi đăng nhập
            String requestedURL = req.getRequestURI();
            String queryString = req.getQueryString();
            if (queryString != null) {
                requestedURL += "?" + queryString;
            }
            session.setAttribute("redirectAfterLogin", requestedURL);

            // Trả về trạng thái chưa đăng nhập và URL chuyển hướng
            jsonResponse.put("status", "not_logged_in");
            jsonResponse.put("redirect", req.getContextPath() + "/view/user/login.jsp");
        } else {
            // Trả về trạng thái đã đăng nhập
            jsonResponse.put("status", "logged_in");
            jsonResponse.put("selectedCartIds", req.getParameter("selectedCartIds"));
        }

        out.print(jsonResponse.toString());
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}