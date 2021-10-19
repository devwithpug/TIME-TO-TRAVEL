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
import java.sql.SQLException;

@WebServlet("/mypref")
public class MyPrefController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/termproject/mypref.jsp");

        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        UserRepository userRepository = new UserRepository();

        User before = (User) req.getSession().getAttribute("user");

        String prf1 = req.getParameter("prf1");
        String prf2 = req.getParameter("prf2");
        String prf3 = req.getParameter("prf3");
        String prf4 = req.getParameter("prf4");
        String prf5 = req.getParameter("prf5");
        String prf6 = req.getParameter("prf6");
        String prf7 = req.getParameter("prf7");
        String prf8 = req.getParameter("prf8");

        try {
            userRepository.updatePref(before.getUserId(), prf1, prf2, prf3, prf4, prf5, prf6, prf7, prf8);

            before.setPrefType(prf1);
            before.setPrefPreference(prf2);
            before.setPrefFlight(prf3);
            before.setPrefRoom(prf4);
            before.setPrefPlan(prf5);
            before.setPrefTransport(prf6);
            before.setPrefMeal(prf7);
            before.setPrefTendency(prf8);

            req.getSession().setAttribute("user", before);

            resp.sendRedirect("mypage");
        } catch (SQLException e) {
        }
    }
}
