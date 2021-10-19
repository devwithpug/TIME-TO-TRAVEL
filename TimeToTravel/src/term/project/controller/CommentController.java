package term.project.controller;

import term.project.domain.Comment;
import term.project.domain.User;
import term.project.repository.CommentRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/comment")
public class CommentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CommentRepository commentRepository = new CommentRepository();

        req.setCharacterEncoding("UTF-8");

        User user = (User) req.getSession().getAttribute("user");
        String type = req.getParameter("type");
        String page = req.getParameter("page");
        String postId = req.getParameter("postId");
        String description = req.getParameter("comment");

        Comment comment = new Comment(postId, user.getUserId(), description);

        try {
            commentRepository.create(comment);
        } catch (SQLException e) {
        }

        resp.sendRedirect(String.format("/%s?page=%s&id=%s", type, page, postId));
    }
}
