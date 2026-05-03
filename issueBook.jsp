<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issue Book - SeaLibrary</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="app-container">
        <%@ include file="sidebar.jsp" %>
        
        <main class="main-content">
            <%@ include file="header.jsp" %>
            
            <div class="page-header">
                <h1 class="page-title">Issue Book to Student</h1>
                <p class="page-subtitle">Record a book issue transaction in the library logs.</p>
            </div>

            <div class="content-padding">
                <div class="form-container">
                    <%
                    String issueId = request.getParameter("issueId");
                    if(issueId != null) {
                    %>
                        <div class="alert alert-success">
                            <span><i class="fa-solid fa-circle-check" style="color: #10b981;"></i></span>
                            <div>
                                <strong>Success!</strong> Your Issue ID is: <strong><%= issueId %></strong>
                            </div>
                        </div>
                    <%
                    }
                    
                    String error = request.getParameter("error");
                    if(error != null) {
                        String msg = "An error occurred.";
                        if("no_copies".equals(error)) {
                            msg = "Out of Stock: No copies available for this book.";
                        } else if("unknown".equals(error)) {
                            msg = request.getParameter("msg");
                        }
                    %>
                        <div class="alert alert-error">
                            <span><i class="fa-solid fa-circle-xmark" style="color: #ef4444;"></i></span>
                            <div>
                                <strong>Issue Failed!</strong> <%= msg %>
                            </div>
                        </div>
                    <%
                    }
                    %>

                    <form action="IssueServlet" method="post">
                        <div class="form-group">
                            <label for="student_id">Student ID</label>
                            <input type="text" id="student_id" name="student_id" placeholder="Enter student ID" required>
                        </div>

                        <div class="form-group">
                            <label for="book_id">Book ID</label>
                            <input type="text" id="book_id" name="book_id" placeholder="Enter book ID" required>
                        </div>

                        <div class="form-group">
                            <label for="issue_date">Issue Date</label>
                            <input type="date" id="issue_date" name="issue_date" required>
                        </div>

                        <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                            <button type="submit" class="btn btn-primary" style="flex: 1;">Issue Book</button>
                            <a href="dashboard.jsp" class="btn btn-secondary" style="flex: 1;">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <script>
        // Set today's date as default
        document.getElementById('issue_date').valueAsDate = new Date();
    </script>
</body>
</html>