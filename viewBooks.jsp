<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books Collection - SeaLibrary</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <%@ page import="java.util.*, dao.BookDAO, model.Book" %>
</head>
<body>
    <div class="app-container">
        <%@ include file="sidebar.jsp" %>
        
        <main class="main-content">
            <%@ include file="header.jsp" %>
            
            <div class="page-header">
                <h1 class="page-title">Books Collection</h1>
                <p class="page-subtitle">Manage and explore all books currently in the library.</p>
            </div>

            <div class="content-padding">
                <%
                try {
                    List<Book> list = BookDAO.getAllBooks();

                    if (list != null && !list.isEmpty()) {
                %>
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                        <span style="color: var(--text-muted);">Showing <strong><%= list.size() %></strong> books</span>
                        <a href="addBook.jsp" class="btn btn-primary">+ Add New Book</a>
                    </div>

                    <div class="card-grid">
                        <%
                        for(Book b : list) {
                            String status = "Available";
                            String badgeClass = "badge-success";
                            if (b.getAvailableCopies() == 0) {
                                status = "All Issued";
                                badgeClass = "badge-danger";
                            } else if (b.getAvailableCopies() < b.getTotalCopies()) {
                                status = "Partially Issued";
                                badgeClass = "badge-warning";
                            }
                        %>
                        <div class="card">
                            <div class="card-header"><%= b.getTitle() %></div>
                            <div class="card-body">
                                <b>Book ID:</b> <span style="font-weight: 600;"><%= b.getId() %></span>
                                <b>Author ID:</b> <%= b.getAuthorId() %>
                                <b>Category ID:</b> <%= b.getCategoryId() %>
                                
                                <div style="margin-top: 1.5rem; padding-top: 1.5rem; border-top: 1px solid var(--border);">
                                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
                                        <div style="font-size: 0.875rem;">
                                            <span style="color: var(--text-muted);">Available: </span>
                                            <strong style="color: var(--primary-dark);"><%= b.getAvailableCopies() %></strong>
                                            <span style="color: var(--text-muted); margin-left: 0.5rem;">Total: </span>
                                            <strong><%= b.getTotalCopies() %></strong>
                                        </div>
                                    </div>
                                    
                                    <div style="text-align: center;">
                                        <span class="badge <%= badgeClass %>">
                                            <%= status %>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                        }
                        %>
                    </div>
                <%
                    } else {
                %>
                    <div class="alert alert-info">
                        <span><i class="fa-solid fa-circle-info" style="color: #0ea5e9;"></i></span>
                        <div>No books found in the library. <a href="addBook.jsp" style="font-weight: 600;">Add your first book</a></div>
                    </div>
                <%
                    }
                } catch(Exception e) {
                %>
                    <div class="alert alert-error">
                        <span><i class="fa-solid fa-circle-xmark" style="color: #ef4444;"></i></span>
                        <div>Error loading books: <%= e.getMessage() %></div>
                    </div>
                <%
                }
                %>
            </div>
        </main>
    </div>
</body>
</html>