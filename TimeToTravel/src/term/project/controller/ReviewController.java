package term.project.controller;

import term.project.repository.ReviewRepository;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/review")
public class ReviewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String postId = req.getParameter("id");
        String page = req.getParameter("page");
        String delete = req.getParameter("delete");
        RequestDispatcher rd;

        if (delete == null) {
            if (postId == null && page == null) {
                resp.sendRedirect("/home");
            } else {
                if (postId == null) {
                    rd = req.getRequestDispatcher("/termproject/review.jsp");
                } else {
                    rd = req.getRequestDispatcher("/termproject/review_detail.jsp");
                }
                rd.forward(req, resp);
            }
        } else {
            ReviewRepository reviewRepository = new ReviewRepository();
            try {
                reviewRepository.delete(postId);
            } catch (SQLException e) {
            }
            resp.sendRedirect("/review?page=0");
        }
    }
}
