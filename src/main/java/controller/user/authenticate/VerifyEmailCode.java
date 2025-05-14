package controller.user.authenticate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/verifyEmailCode")
public class VerifyEmailCode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String verificationCode = session.getAttribute("verificationCode").toString();
        String otp_verify = req.getParameter("otp_verify");
        String email = session.getAttribute("resetEmail").toString();
        if(verificationCode.equals(otp_verify)){
            session.removeAttribute("verificationCode");
            session.setAttribute("resetEmail", email);
            resp.sendRedirect(req.getContextPath() + "/view/user/change_new_password.jsp");
        }else{
            req.setAttribute("error", "Mã của bạn không đúng vui lòng nhập lại!");
            req.getRequestDispatcher("/view/user/verify.jsp").forward(req, resp);
        }
    }
}
