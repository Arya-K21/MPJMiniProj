package controller;

import dao.BookDAO;
import model.Book;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class BookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            //int id = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("title");

            int authorId = Integer.parseInt(req.getParameter("author_id"));
            int categoryId = Integer.parseInt(req.getParameter("category_id"));
            int copies = Integer.parseInt(req.getParameter("available_copies"));

            Book b = new Book();
            //b.setId(id);
            b.setTitle(title);
            b.setAuthorId(authorId);
            b.setCategoryId(categoryId);
            b.setAvailableCopies(copies);
            b.setTotalCopies(copies);

            BookDAO.addBook(b);

            System.out.println("BOOK ADDED SUCCESSFULLY");

        } catch(Exception e){
            e.printStackTrace();
        }

        res.sendRedirect("viewBooks.jsp");
    }
}