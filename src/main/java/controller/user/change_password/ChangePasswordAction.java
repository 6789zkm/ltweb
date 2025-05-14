package controller.user.change_password;

import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.user.UserRepository;
import service.hash.HashModel;

import java.io.IOException;

@WebServlet("/changePassword")
public class ChangePasswordAction extends HttpServlet {
    UserRepository userRepository = new UserRepository();
    HashModel hashModel = new HashModel();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getSession().getAttribute("resetEmail").toString();
//        System.out.println(email);
        String newPassword = req.getParameter("newPassword");
        String reNewPassword = req.getParameter("reNewPassword");
        User user = userRepository.getUserByEmail(email);
        if(!newPassword.equals(reNewPassword)) {
            req.setAttribute("error", "Mật khẩu cũ và mật khẩu mới không khớp!");
            req.getRequestDispatcher("/view/user/changePassword.jsp").forward(req, resp);
        }else{
            String hashedPassword = hashModel.hashPassword(newPassword);
            if(userRepository.changePasswordUser(user.getId(), hashedPassword)){
                req.setAttribute("success", "Đã tạo lại password thành công! Vui lòng đăng nhập lại");
                resp.sendRedirect(req.getContextPath() + "/view/user/login.jsp");
            }
        }


    }
}
