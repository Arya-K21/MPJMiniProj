<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book - SeaLibrary</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="app-container">
        <%@ include file="sidebar.jsp" %>
        
        <main class="main-content">
            <%@ include file="header.jsp" %>
            
            <div class="page-header">
                <h1 class="page-title">Add New Book</h1>
                <p class="page-subtitle">Add a new book to the library collections.</p>
            </div>

            <div class="content-padding">
                <div class="form-container">
                    <form action="BookServlet" method="post">
                        <div class="form-group">
                            <label for="title">Book Title</label>
                            <input type="text" id="title" name="title" placeholder="Enter book title" required>
                        </div>

                        <div class="form-group">
                            <label for="available_copies">Initial Copies</label>
                            <input type="number" id="available_copies" name="available_copies" placeholder="Number of copies" required>
                        </div>

                        <div class="form-group">
                            <label for="author_id">Author ID</label>
                            <input type="number" id="author_id" name="author_id" placeholder="Enter author ID" required>
                        </div>

                        <div class="form-group">
                            <label for="category_id">Category ID</label>
                            <input type="number" id="category_id" name="category_id" placeholder="Enter category ID" required>
                        </div>

                        <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                            <button type="submit" class="btn btn-primary" style="flex: 1;">Add Book</button>
                            <a href="dashboard.jsp" class="btn btn-secondary" style="flex: 1;">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
</body>
</html>