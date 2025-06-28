package controller.user.report_lost_key;

import java.io.IOException;

import entity.PublicKeyStorage;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.sign.PublicKeyStorageRepository;

@WebServlet("/report_lost_key_view")
public class ReportLostKeyView extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy user từ session (hoặc từ đâu bạn đang lưu)
        User user = (User) req.getSession().getAttribute("user");

        // Gọi repository để lấy public key của user đó
        PublicKeyStorageRepository pkRepo = new PublicKeyStorageRepository();
        PublicKeyStorage publicKeyStorage = pkRepo.getByUserId(user.getId());

        // Gửi object sang JSP
        req.setAttribute("publickeystorage", publicKeyStorage);
        req.setAttribute("user", user); // nếu cần
        req.getRequestDispatcher("view/user/report_lost_key.jsp").forward(req, resp);;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
