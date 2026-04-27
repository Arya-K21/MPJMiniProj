<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - SeaLibrary</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="app-container">
        <%@ include file="sidebar.jsp" %>
        
        <main class="main-content">
            <%@ include file="header.jsp" %>
            
            <div class="page-header">
                <h1 class="page-title">Dashboard Overview</h1>
                <p class="page-subtitle">Welcome back! Here's what's happening in your library today.</p>
            </div>

            <div class="content-padding">
                <!-- Simple stats grid with mock data -->
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon" style="background: var(--primary-light); color: var(--primary-dark);">&#128218;</div>
                        <div class="stat-info">
                            <div class="label">Total Books</div>
                            <div class="value">32,345</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon" style="background: #fee2e2; color: #ef4444;">&#11014;&#65039;</div>
                        <div class="stat-info">
                            <div class="label">Borrowed</div>
                            <div class="value">2,405</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon" style="background: #fef3c7; color: #d97706;">&#8987;</div>
                        <div class="stat-info">
                            <div class="label">Overdue</div>
                            <div class="value">45</div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon" style="background: #e0f2fe; color: #0ea5e9;">&#128101;</div>
                        <div class="stat-info">
                            <div class="label">Total Members</div>
                            <div class="value">1,504</div>
                        </div>
                    </div>
                </div>

                <h2 style="margin: 2rem 0 1rem; font-size: 1.25rem;">Quick Actions</h2>
                <div class="action-grid">
                    <a href="viewBooks.jsp" class="action-card">
                        <span class="action-icon">&#128214;</span>
                        <h3>Browse Collection</h3>
                        <p>View and manage all available books in the library.</p>
                    </a>
                    <a href="issueBook.jsp" class="action-card">
                        <span class="action-icon">&#129309;</span>
                        <h3>Issue a Book</h3>
                        <p>Quickly record a new book issue to a student.</p>
                    </a>
                    <a href="returnBook.jsp" class="action-card">
                        <span class="action-icon">&#128260;</span>
                        <h3>Process Return</h3>
                        <p>Calculate fines and mark books as returned.</p>
                    </a>
                </div>
            </div>
        </main>
    </div>
</body>
</html>