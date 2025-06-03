package controller.admin.historyOfSign;

import dto.response.SignInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.sign.SignRepository;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/historySign")
public class historySignView extends HttpServlet {
    SignRepository signRepository = new SignRepository();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<SignInfo> list_sign = signRepository.getAllSignInfo();
            System.out.println(list_sign);
            req.getSession().setAttribute("list_sign", list_sign);
            resp.sendRedirect(req.getContextPath() + "/view/admin/admin_history_sign.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
