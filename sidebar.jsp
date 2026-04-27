<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String currentPath = request.getServletPath();
    String adminName = (String) session.getAttribute("admin_name");
    if (adminName == null) adminName = "Librarian";
%>
<aside class="sidebar">
    <div class="logo">
        <div class="logo-icon">&#127754;</div>
        <span>SeaLibrary.io</span>
    </div>

    <ul class="nav-menu">
        <li class="nav-item">
            <a href="dashboard.jsp" class="nav-link <%= currentPath.contains("dashboard.jsp") ? "active" : "" %>">
                <span class="icon">&#127968;</span>
                <span>Dashboard</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="viewBooks.jsp" class="nav-link <%= currentPath.contains("viewBooks.jsp") ? "active" : "" %>">
                <span class="icon">&#128218;</span>
                <span>Books Collection</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="issueBook.jsp" class="nav-link <%= currentPath.contains("issueBook.jsp") ? "active" : "" %>">
                <span class="icon">&#129309;</span>
                <span>Issue Book</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="returnBook.jsp" class="nav-link <%= currentPath.contains("returnBook.jsp") ? "active" : "" %>">
                <span class="icon">&#128260;</span>
                <span>Return Book</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="addBook.jsp" class="nav-link <%= currentPath.contains("addBook.jsp") ? "active" : "" %>">
                <span class="icon">&#10133;</span>
                <span>Add New Book</span>
            </a>
        </li>
    </ul>

    <div class="sidebar-footer">
        <a href="LogoutServlet" onclick="return confirm('Are you sure you want to logout?')" class="nav-link" style="color: #ef4444;">
            <span class="icon">&#128682;</span>
            <span>Logout</span>
        </a>
    </div>
</aside>
