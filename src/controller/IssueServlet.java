package controller;

import dao.IssueDAO;
import model.Issue;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class IssueServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            Issue issue = new Issue();
            issue.setStudentId(Integer.parseInt(req.getParameter("student_id")));
            issue.setBookId(Integer.parseInt(req.getParameter("book_id")));
            issue.setIssueDate(Date.valueOf(req.getParameter("issue_date")));

            int issueId = IssueDAO.issueBook(issue);
            res.sendRedirect("issueBook.jsp?issueId=" + issueId);
        } catch(Exception e){
            if ("NO_COPIES".equals(e.getMessage())) {
                res.sendRedirect("issueBook.jsp?error=no_copies");
            } else {
                e.printStackTrace();
                res.sendRedirect("issueBook.jsp?error=unknown&msg=" + e.getMessage());
            }
        }
    }
}