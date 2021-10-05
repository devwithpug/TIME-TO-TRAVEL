package term.project.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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


        String type = req.getParameter("type");

        System.out.println("type = " + type);
        String title = req.getParameter("title");
        System.out.println("title = " + title);
        String description = req.getParameter("content");

        System.out.println("description = " + description);

        resp.sendRedirect(req.getRequestURI());
    }
}
