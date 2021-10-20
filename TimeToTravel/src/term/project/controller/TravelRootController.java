package term.project.controller;

import term.project.domain.TravelRoot;
import term.project.repository.CommentRepository;
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

@WebServlet(value = "/travel")
public class TravelRootController extends HttpServlet {

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
                    rd = req.getRequestDispatcher("/termproject/travelroot.jsp");
                } else {
                    rd = req.getRequestDispatcher("/termproject/travelroot_detail.jsp");
                }
                rd.forward(req, resp);
            }
        } else {
            TravelRootRepository travelRootRepository = new TravelRootRepository();
            CommentRepository commentRepository = new CommentRepository();
            try {
                commentRepository.deleteByPostId(postId);
                TravelRoot root = travelRootRepository.getOneById(postId);
                if (root.getFileName() != null) {
                    FileUtil.deleteFile(req, root.getFileName());
                }
                travelRootRepository.delete(postId);
            } catch (SQLException e) {
            }
            resp.sendRedirect("/travel?page=0");
        }
    }
}
