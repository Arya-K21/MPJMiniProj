<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book - SeaLibrary</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
                            <label for="author_id">Author</label>
                            <select id="author_id" name="author_id" required>
                                <option value="" disabled selected>-- Select an Author --</option>
                                <option value="1">J.K. Rowling</option>
                                <option value="2">George Orwell</option>
                                <option value="3">J.R.R. Tolkien</option>
                                <option value="4">Jane Austen</option>
                                <option value="5">Mark Twain</option>
                                <option value="6">Agatha Christie</option>
                                <option value="7">Stephen King</option>
                                <option value="8">Arthur Conan Doyle</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="category_id">Category</label>
                            <select id="category_id" name="category_id" required>
                                <option value="" disabled selected>-- Select a Category --</option>
                                <option value="1">Fiction</option>
                                <option value="2">Non-Fiction</option>
                                <option value="3">Science &amp; Technology</option>
                                <option value="4">History</option>
                                <option value="5">Biography</option>
                                <option value="6">Self-Help</option>
                            </select>
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