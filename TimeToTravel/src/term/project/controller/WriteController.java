package term.project.controller;

import com.oreilly.servlet.MultipartRequest;
import term.project.domain.Review;
import term.project.domain.TravelRoute;
import term.project.domain.User;
import term.project.repository.ReviewRepository;
import term.project.repository.TravelRouteRepository;
import term.project.util.FileUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(value = "/write")
public class WriteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher rd = req.getRequestDispatcher("/termproject/write.jsp");

        String type = req.getParameter("type");
        if (type == null || (!type.equals("review") && !type.equals("travel"))) {
            resp.sendRedirect("/home");
        } else {
            rd.forward(req, resp);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        MultipartRequest request = FileUtil.multipartRequest(req);

        String type = request.getParameter("type");

        if (type != null) {
            String postId = request.getParameter("postId");
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            User user = (User) req.getSession().getAttribute("user");
            String currentPage = request.getParameter("page");
            String fileName = validateFileAndExtractName(request);

            if (type.equals("review")) {
                ReviewRepository reviewRepository = new ReviewRepository();
                try {
                    if (postId != null) {
                        reviewRepository.update(postId, title, description);
                    } else {
                        currentPage = "0";
                        Integer postNum = reviewRepository.getAllCount() + 1;
                        Review review = new Review(user.getUserId(), title, description, postNum, fileName);
                        postId = review.getPostId();
                        reviewRepository.create(review);
                        System.out.println("새로운 여행 후기 : " + review);
                    }
                    resp.sendRedirect("/review?page=" + currentPage + "&id=" + postId);
                } catch (SQLException e) {
                }
            } else if (type.equals("travel")) {
                TravelRouteRepository travelRouteRepository = new TravelRouteRepository();
                String destination = request.getParameter("destination");
                int day = Integer.parseInt(request.getParameter("day"));
                LocalDate departureDate = LocalDate.parse(request.getParameter("departureDate"), DateTimeFormatter.ISO_LOCAL_DATE);
                LocalDate arrivalDate = LocalDate.parse(request.getParameter("arrivalDate"), DateTimeFormatter.ISO_LOCAL_DATE);
                int expense = Integer.parseInt(request.getParameter("expense"));
                int person = Integer.parseInt(request.getParameter("person"));
                String travelType = request.getParameter("travelType");

                try {
                    if (postId != null) {
                        travelRouteRepository.update(postId, title, description, destination, day, departureDate, arrivalDate, expense, person, travelType);
                    } else {
                        currentPage = "0";
                        Integer postNum = travelRouteRepository.getAllCount() + 1;
                        TravelRoute travelRoute = new TravelRoute(user.getUserId(), title, description, postNum, fileName, destination, day, departureDate, arrivalDate, expense, person, travelType);
                        postId = travelRoute.getPostId();
                        travelRouteRepository.create(travelRoute);
                        System.out.println("새로운 여행 계획 공유 : " + travelRoute);
                    }
                    resp.sendRedirect("/travel?page=" + currentPage + "&id=" + postId);
                } catch (SQLException e) {
                }
            }
        } else {
            resp.sendRedirect("/home");
        }
    }

    private String validateFileAndExtractName(MultipartRequest req) {
        File input = req.getFile("input");
        if (input != null) {
            String name = input.getName();
            if (name.endsWith("jpeg") || name.endsWith("jpg") || name.endsWith("png")) {
                return name;
            } else {
                input.delete();
            }
        }
        return null;
    }
}
