package term.project.controller;

import term.project.domain.User;
import term.project.repository.CommentRepository;
import term.project.repository.ReviewRepository;
import term.project.repository.TravelRouteRepository;
import term.project.repository.UserRepository;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/mypage")
public class MyPageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/termproject/mypage.jsp");

        String delete = req.getParameter("delete");
        if (delete != null) {
            String deletePwd = req.getParameter("deletePwd");
            User user = (User) req.getSession().getAttribute("user");

            if (user.getPassword().equals(deletePwd)) {
                deleteUser(user.getUserId());
                req.getSession().removeAttribute("user");
                resp.sendRedirect("/home");
            } else {
                resp.sendRedirect("mypage?error=delete");
            }
        } else {
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        UserRepository userRepository = new UserRepository();

        User before = (User) req.getSession().getAttribute("user");

        String nickname = req.getParameter("nickname");
        String pwd = req.getParameter("pwd");
        String newPwd = req.getParameter("pwd2");
        String phoneNumber = req.getParameter("phoneNumber");
        try {
            if (!before.getPassword().equals(pwd)) {
                resp.sendRedirect("mypage?error=update");
            } else {
                userRepository.update(before.getUserId(), nickname, newPwd, phoneNumber);

                before.setNickname(nickname);
                before.setPassword(newPwd);
                before.setPhoneNumber(phoneNumber);

                req.getSession().setAttribute("user", before);

                resp.sendRedirect("mypage");
            }
        } catch (SQLException e) {
        }
    }

    private void deleteUser(String userId) {
        UserRepository userRepository = new UserRepository();
        ReviewRepository reviewRepository = new ReviewRepository();
        TravelRouteRepository travelRouteRepository = new TravelRouteRepository();
        CommentRepository commentRepository = new CommentRepository();
        try {
            userRepository.delete(userId);
            reviewRepository.deleteByUserId(userId);
            travelRouteRepository.deleteByUserId(userId);
            commentRepository.deleteByUserId(userId);
        } catch (SQLException err){
        }
    }
}
