package term.project.controller;

import term.project.domain.User;
import term.project.repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        String pwd = req.getParameter("pwd");

        UserRepository userRepository = new UserRepository();
        try {
            User user = userRepository.getOneByEmailAndPassword(id, pwd);

            if (user != null) {
                if (user.getPassword().equals(pwd)) {
                    req.getSession().setAttribute("user", user);
                    System.out.println("유저 로그인 : " + user);
                }
            }
            resp.sendRedirect("/home");
        } catch (SQLException e) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getSession().removeAttribute("user");

        resp.sendRedirect("/home");
    }
}
