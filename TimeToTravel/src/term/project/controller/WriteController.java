package term.project.controller;

import term.project.domain.entity.Review;
import term.project.domain.entity.TravelRoot;
import term.project.domain.entity.User;
import term.project.repository.ReviewRepository;
import term.project.repository.TravelRootRepository;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/write")
public class WriteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher rd = req.getRequestDispatcher("/termproject/write.jsp");

        String type = req.getParameter("type");
        if (type == null || (!type.equals("review") && !type.equals("travelroot"))) {
            resp.sendRedirect("/home");
        } else {
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String type = req.getParameter("type");

        if (type != null) {
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            User user = (User) req.getSession().getAttribute("user");

            if (type.equals("review")) {
                ReviewRepository reviewRepository = new ReviewRepository();
                try {
                    Integer postNum = reviewRepository.getAllCount() + 1;
                    Review review = new Review(user.getUserId(), title, description, postNum);
                    reviewRepository.create(review);
                    System.out.println("새로운 여행 후기 : " + review);
                    resp.sendRedirect("/review?id=" + review.getPostId());
                } catch (SQLException e) {
                }
            } else if (type.equals("travelroot")) {
                TravelRootRepository travelRootRepository = new TravelRootRepository();
                try {
                    Integer postNum = travelRootRepository.getAllCount() + 1;
                    TravelRoot travelRoot = new TravelRoot(user.getUserId(), title, description, postNum);
                    travelRootRepository.create(travelRoot);
                    System.out.println("새로운 여행 계획 공유 : " + travelRoot);
                    resp.sendRedirect("/travelroot?id=" + travelRoot.getPostId());
                } catch (SQLException e) {
                }
            }
        } else {
            resp.sendRedirect("/home");
        }
    }
}
