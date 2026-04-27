package controller;

import dao.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            // If database is not available, use demo credentials
            if (con == null) {
                if ("admin".equals(user) && "admin".equals(pass)) {
                    HttpSession session = req.getSession();
                    session.setAttribute("admin_id", "admin");
                    session.setAttribute("admin_name", "Demo Administrator");
                    res.sendRedirect("dashboard.jsp");
                } else {
                    res.getWriter().println("<h3 style='color:red; text-align:center; margin-top:50px;'>Invalid Login Credentials!</h3>");
                }
                return;
            }

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM admin WHERE admin_id=? AND password=?"
            );

            ps.setString(1, user);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                HttpSession session = req.getSession();
                session.setAttribute("admin_id", rs.getString("admin_id"));
                session.setAttribute("admin_name", rs.getString("name"));
                res.sendRedirect("dashboard.jsp");
            } else {
                res.getWriter().println("<h3 style='color:red; text-align:center; margin-top:50px;'>Invalid Login Credentials!</h3>");
            }

        } catch(Exception e){
            res.getWriter().println("<h3 style='color:red; text-align:center; margin-top:50px;'>Login Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    }
}