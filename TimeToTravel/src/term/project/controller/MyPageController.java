package term.project.controller;

import term.project.domain.entity.User;
import term.project.repository.CommentRepository;
import term.project.repository.ReviewRepository;
import term.project.repository.TravelRootRepository;
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
        String prf1 = req.getParameter("prf1");
        String prf2 = req.getParameter("prf2");
        String prf3 = req.getParameter("prf3");
        String prf4 = req.getParameter("prf4");
        String prf5 = req.getParameter("prf5");
        String prf6 = req.getParameter("prf6");
        String prf7 = req.getParameter("prf7");
        String prf8 = req.getParameter("prf8");
        try {
            if (!before.getPassword().equals(pwd)) {
                resp.sendRedirect("mypage?error=update");
            } else {
                userRepository.update(before.getUserId(), nickname, newPwd, phoneNumber, prf1, prf2, prf3, prf4, prf5, prf6, prf7, prf8);

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
        TravelRootRepository travelRootRepository = new TravelRootRepository();
        CommentRepository commentRepository = new CommentRepository();
        try {
            userRepository.delete(userId);
            reviewRepository.deleteByUserId(userId);
            travelRootRepository.deleteByUserId(userId);
            commentRepository.deleteByUserId(userId);
        } catch (SQLException err){
        }
    }
}
