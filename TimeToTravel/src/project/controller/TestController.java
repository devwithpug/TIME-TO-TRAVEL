package project.controller;

import term.project.domain.entity.Comment;
import term.project.repository.CommentRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(value = "/test")
public class TestController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CommentRepository commentRepository = new CommentRepository();

        String postId = req.getParameter("postId");

        try {
            List<Comment> result = commentRepository.getAllByPostId(postId);
            result.forEach(System.out::println);
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/plain");
            resp.getWriter().write("length = " + result.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CommentRepository commentRepository = new CommentRepository();

        String postId = req.getParameter("postId");
        String userId = req.getParameter("userId");
        String d = req.getParameter("d");

        Comment comment = new Comment(postId, userId, d);

        try {
            Comment comment1 = commentRepository.create(comment);
            System.out.println("created = " + comment1);
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/plain");
            resp.getWriter().write(String.valueOf(comment1));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CommentRepository commentRepository = new CommentRepository();

        String commentId = req.getParameter("commentId");
        String d = req.getParameter("d");

        try {
            commentRepository.update(commentId, d);
            System.out.println("updated to = " + d);
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/plain");
            resp.getWriter().write("updated to = " + d);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CommentRepository commentRepository = new CommentRepository();

        String commentId = req.getParameter("commentId");

        try {
            commentRepository.delete(commentId);
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/plain");
            resp.getWriter().write("deleted = " + commentId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
