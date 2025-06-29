    package controller.user.report_lost_key;

    import entity.User;
    import jakarta.servlet.ServletException;
    import jakarta.servlet.annotation.WebServlet;
    import jakarta.servlet.http.HttpServlet;
    import jakarta.servlet.http.HttpServletRequest;
    import jakarta.servlet.http.HttpServletResponse;
    import jakarta.servlet.http.HttpSession;
    import repository.sign.LostKeyRepository;

    import java.io.IOException;

    @WebServlet("/report_lost_key_submit")
    public class ReportLostKeySubmit extends HttpServlet {
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");
            String publicKey = req.getParameter("publicKey");

            try {
                LostKeyRepository repo = new LostKeyRepository();
                repo.reportLostKey(user.getId(), publicKey);
                resp.sendRedirect(req.getContextPath() + "/profile"); // hoặc trang cảm ơn
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("error", "Có lỗi xảy ra khi báo mất khóa");
                req.getRequestDispatcher("view/user/report_lost_key.jsp").forward(req, resp);
            }
        }
    }

