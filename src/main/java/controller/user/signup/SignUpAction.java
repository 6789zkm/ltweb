package controller.user.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repository.cart.CartRepository;
import repository.user.UserRepository;
import service.hash.HashModel;

import java.io.IOException;

@WebServlet("/signup")
public class SignUpAction extends HttpServlet {
    UserRepository userRepository = new UserRepository();
    CartRepository cartRepository = new CartRepository();
    HashModel hashModel = new HashModel();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String repassword = req.getParameter("repassword");
        HttpSession session = req.getSession();
        if(username.isEmpty() || password.isEmpty() || repassword.isEmpty()){
            req.setAttribute("error", "Hãy nhập đầy đủ tất cả các trường để tiến hành đăng kí!");
            req.getRequestDispatcher("/view/user/sign_up.jsp").forward(req, resp);
            return;
        }
        

        if (!checkUsername(username)) {
            req.setAttribute("error", "Vui lòng nhập đúng định dạng Gmail");
            req.getRequestDispatcher("/view/user/sign_up.jsp").forward(req, resp);
            return;
        }

        if(userRepository.checkUsername(username)){
            req.setAttribute("error", "Gmail của bạn đã được sử dụng!Vui lòng nhập gmail khác!");
            req.getRequestDispatcher("/view/user/sign_up.jsp").forward(req, resp);
            return;
        }

        if (!password.equals(repassword)) {
            req.setAttribute("error", "Mật khẩu nhập lại không khớp!");
            req.getRequestDispatcher("/view/user/sign_up.jsp").forward(req, resp);
            return;
        }

        if(password.equals(repassword) && checkUsername(username) && !userRepository.checkUsername(username)){
            String passwordHash = hashModel.hashPassword(password);
            userRepository.signup(username, passwordHash);
            Long id = userRepository.getUserByEmail(username).getId();
            cartRepository.addCartForNewUser(id);
            userRepository.setRoleForUser(id);
            req.setAttribute("success", "Bạn đã đăng kí thành công vui lòng đăng nhập lại!");
            req.getRequestDispatcher("/view/user/login.jsp").forward(req, resp);
        }


    }

    private boolean checkUsername(String username) {
        String regex = "^[a-zA-Z0-9._%+-]+@gmail\\.com$";
        return username != null && username.matches(regex);
    }



//    public static void main(String[] args) {
//        System.out.println(new SignUpAction().hashPassword("hello123456789"));
//    }
}
