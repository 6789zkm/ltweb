package controller.user.login;

import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repository.user.UserRepository;
import service.cartdetail.CartDetailService;
import service.hash.HashModel;

import java.io.IOException;

@WebServlet("/login")
public class LoginAction extends HttpServlet {
    UserRepository userRepository = new UserRepository();
    CartDetailService cartDetailService = new CartDetailService();
    HashModel hashModel = new HashModel();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/user/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        String passwordHash = hashModel.hashPassword(password);

        if (username.isEmpty() || passwordHash.isEmpty()) {
            req.setAttribute("error", "Mật khẩu hoặc email chưa được nhập!");
            req.getRequestDispatcher("/view/user/login.jsp").forward(req, resp);
            return;
        }

        if (userRepository.login(username, passwordHash)) {
            User user = userRepository.getUserByEmail(username);
            session.setAttribute("user", user);

            cartDetailService.mergeCartAfterLogin(req, user, resp);

            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            req.setAttribute("error", "Mật khẩu hoặc email không hợp lệ!");
            req.getRequestDispatcher("/view/user/login.jsp").forward(req, resp);
        }
    }


}