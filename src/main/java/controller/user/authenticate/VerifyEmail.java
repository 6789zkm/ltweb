package controller.user.authenticate;

import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repository.user.UserRepository;
import service.mail.MailService;

import java.io.IOException;

@WebServlet("/verifyEmail")
public class VerifyEmail extends HttpServlet {
    UserRepository userRepository = new UserRepository();
    MailService mailService = new MailService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        User user = userRepository.getUserByEmail(email);
        HttpSession session = req.getSession();
        if(user == null) {
            req.setAttribute("error", "Email không được tìm thấy!");
            req.getRequestDispatcher("/view/user/forgot_password.jsp").forward(req, resp);
        }else{
            String verificationCode = mailService.generateVerificationCode();

            session.setAttribute("verificationCode", verificationCode);
            session.setAttribute("resetEmail", email);
            System.out.println("verificationCode: " + verificationCode);
            mailService.sendVerificationEmail(email, verificationCode);

            resp.sendRedirect(req.getContextPath()+"/view/user/verify.jsp");
        }
    }
}
