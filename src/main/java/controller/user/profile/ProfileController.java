package controller.user.profile;

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
import service.user.UserService;

@WebServlet("/edit_profile")
public class ProfileController extends HttpServlet {
	UserRepository userRepo = new UserRepository();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String name = req.getParameter("username");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
//		Long idUser = (Long) session.getAttribute("userId");
		String idUser = req.getParameter("userId");
		try {
			long idUser_convert = Long.parseLong(idUser);

			if (phone != null && !phone.startsWith("84")) {
				phone = "84" + phone; // Thêm mã vùng 84
				session.setAttribute("userId", idUser);
				session.setAttribute("name", name);
				session.setAttribute("phone", phone);
				session.setAttribute("email", email);
				session.setAttribute("address", address);
			} else {
				session.setAttribute("userId", idUser);
				session.setAttribute("name", name);
				session.setAttribute("phone", phone);
				session.setAttribute("email", email);
				session.setAttribute("address", address);
			}


			UserService userService = new UserService();
			userService.changeUserInfo(name, phone, email, address, idUser_convert);
			User user = userRepo.getUserById(idUser_convert);
			session.setAttribute("user", user);

			String publicKey = req.getParameter("publicKey");
			if (publicKey != null && !publicKey.isEmpty()) {
				PublicKeyStorageDB.addNewPublicKey(user, publicKey);
				user.setKey(publicKey);
			}
			resp.sendRedirect(req.getContextPath()+"/profile");

//			req.getRequestDispatcher(req.getContextPath() + "/profile").forward(req, resp);
		} catch (NumberFormatException nfe) {
			nfe.printStackTrace();
		}
	}
}