package term.project.controller;

import term.project.domain.User;
import term.project.repository.UserRepository;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(value = "/signup")
public class SignUpController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/termproject/signup.jsp");
        req.setCharacterEncoding("UTF-8");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pwd1 = req.getParameter("pwd1");
        String pwd2 = req.getParameter("pwd2");
        String nickname = req.getParameter("nickname");
        String phoneNumber = req.getParameter("phoneNumber");
        String prf1 = req.getParameter("prf1");
        String prf2 = req.getParameter("prf2");
        String prf3 = req.getParameter("prf3");
        String prf4 = req.getParameter("prf4");
        String prf5 = req.getParameter("prf5");
        String prf6 = req.getParameter("prf6");
        String prf7 = req.getParameter("prf7");
        String prf8 = req.getParameter("prf8");

        UserRepository userRepository = new UserRepository();
        String error = null;


        if (isValidSignUpRequest(name, email, pwd1, pwd2, nickname, phoneNumber)) {

            User user = new User(name, email, nickname, pwd1, phoneNumber, prf1, prf2, prf3, prf4, prf5, prf6, prf7, prf8);

            try {
                if (userRepository.isExistsByEmail(email)) {
                    error = "???????????? ??????! ?????? ???????????? ??????????????????.";
                } else {
                    userRepository.create(user);
                    resp.sendRedirect("/home");
                }
            } catch (SQLException e) {
                System.out.println("DB ERROR ???????????? ?????? : " + e);
            }
        } else {
            error = "???????????? ??????! ?????? ????????? ?????????????????????.";
        }

        if (error != null) {
            String errorMessage = URLEncoder.encode(error, StandardCharsets.UTF_8);
            resp.sendRedirect(req.getRequestURI() + "?error=" + errorMessage);
        }
    }

    private boolean isValidSignUpRequest(
            String name, String email, String pwd1, String pwd2,
            String nickname, String phoneNumber
    ) {
        if (name.isEmpty() || name.length() > 10) return false;
        Matcher validEmail = Pattern.compile("^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$").matcher(email);
        if (!validEmail.matches()) return false;
        if (!pwd1.equals(pwd2)) return false;
        if (nickname.isEmpty() || nickname.length() > 20) return false;
        Matcher validPhoneNumber = Pattern.compile("\\d{3}-\\d{4}-\\d{4}").matcher(phoneNumber);
        Matcher validPhoneNumber2 = Pattern.compile("\\d{11}").matcher(phoneNumber);
        return validPhoneNumber.matches() || validPhoneNumber2.matches();
    }

}
