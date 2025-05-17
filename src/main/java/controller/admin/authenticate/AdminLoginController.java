package controller.admin.authenticate;

import java.io.IOException;

import dao.PublicKeyStorageDB;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repository.user.UserRepository;
import service.hash.HashModel;

@WebServlet("/adminLogin")
public class AdminLoginController extends HttpServlet {
	HashModel hashModel = new HashModel();
	private UserRepository userRepository = new UserRepository();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/adminController");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String phone = req.getParameter("phone");
		String password = req.getParameter("password");

//		User user = userRepository.loginForAdmin(phone, password);
//		System.out.println(phone);
//		System.out.println(password);
//		System.out.println(user);
//		// Tai khoan khong ton tai
//		if (user == null) {
//			String error = "Tài khoản không tồn tại";
//			req.setAttribute("message", error);
//			req.getRequestDispatcher( "/view/admin/admin_login.jsp").forward(req, resp);
//			return;
//		}

//		req.getSession().setAttribute("user", user);
		String passwordHash = hashModel.hashPassword(password);
		System.out.println(userRepository.login(phone, passwordHash));
		HttpSession session = req.getSession();
		if (userRepository.login(phone, passwordHash)) {
			User user = userRepository.getUserByEmail(phone);
			String publicKey = PublicKeyStorageDB.getPublicKey(user);
			user.setKey(publicKey);
			session.setAttribute("user", user);
			resp.sendRedirect(req.getContextPath() + "/adminController");
		} else {
			req.setAttribute("error", "Mật khẩu hoặc email không hợp lệ!");
			req.getRequestDispatcher( "/view/admin/admin_login.jsp").forward(req, resp);
		}
		// Forward đến trang admin

	}

}
