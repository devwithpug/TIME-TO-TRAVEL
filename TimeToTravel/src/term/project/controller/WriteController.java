package term.project.controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import term.project.domain.entity.Review;
import term.project.domain.entity.TravelRoot;
import term.project.domain.entity.User;
import term.project.repository.ReviewRepository;
import term.project.repository.TravelRootRepository;
import term.project.util.FileUtil;

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

        // MultipartRequest multipartRequest = new MultipartRequest(req, "./", 5000 * 1024, "UTF-8", new DefaultFileRenamePolicy());
        if (type != null) {
            String postId = req.getParameter("postId");
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            User user = (User) req.getSession().getAttribute("user");
            String currentPage = req.getParameter("page");

            if (type.equals("review")) {
                ReviewRepository reviewRepository = new ReviewRepository();
                try {
                    if (postId != null) {
                        reviewRepository.update(postId, title, description);
                    } else {
                        currentPage = "0";
                        Integer postNum = reviewRepository.getAllCount() + 1;
                        Review review = new Review(user.getUserId(), title, description, postNum);
                        postId = review.getPostId();
                        reviewRepository.create(review);
                        System.out.println("새로운 여행 후기 : " + review);
                    }
                    resp.sendRedirect("/review?page=" + currentPage + "&id=" + postId);
                } catch (SQLException e) {
                }
            } else if (type.equals("travelroot")) {
                TravelRootRepository travelRootRepository = new TravelRootRepository();
                try {
                    if (postId != null) {
                        travelRootRepository.update(postId, title, description);
                    } else {
                        currentPage = "0";
                        Integer postNum = travelRootRepository.getAllCount() + 1;
                        TravelRoot travelRoot = new TravelRoot(user.getUserId(), title, description, postNum);
                        postId = travelRoot.getPostId();
                        travelRootRepository.create(travelRoot);
                        System.out.println("새로운 여행 계획 공유 : " + travelRoot);
                    }
                    resp.sendRedirect("/travelroot?page=" + currentPage + "&id=" + postId);
                } catch (SQLException e) {
                }
            }
        } else {
            resp.sendRedirect("/home");
        }
    }
}
