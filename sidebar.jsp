<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String currentPath = request.getServletPath();
    String adminName = (String) session.getAttribute("admin_name");
    if (adminName == null) adminName = "Librarian";
%>
<aside class="sidebar">
    <div class="logo">
        <div class="logo-icon"><i class="fa-solid fa-water"></i></div>
        <span>SeaLibrary.io</span>
    </div>

    <ul class="nav-menu">
        <li class="nav-item">
            <a href="dashboard.jsp" class="nav-link <%= currentPath.contains("dashboard.jsp") ? "active" : "" %>">
                <span class="icon"><i class="fa-solid fa-house"></i></span>
                <span>Dashboard</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="viewBooks.jsp" class="nav-link <%= currentPath.contains("viewBooks.jsp") ? "active" : "" %>">
                <span class="icon"><i class="fa-solid fa-book"></i></span>
                <span>Books Collection</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="issueBook.jsp" class="nav-link <%= currentPath.contains("issueBook.jsp") ? "active" : "" %>">
                <span class="icon"><i class="fa-solid fa-handshake"></i></span>
                <span>Issue Book</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="returnBook.jsp" class="nav-link <%= currentPath.contains("returnBook.jsp") ? "active" : "" %>">
                <span class="icon"><i class="fa-solid fa-rotate-left"></i></span>
                <span>Return Book</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="addBook.jsp" class="nav-link <%= currentPath.contains("addBook.jsp") ? "active" : "" %>">
                <span class="icon"><i class="fa-solid fa-plus"></i></span>
                <span>Add New Book</span>
            </a>
        </li>
    </ul>

    <div class="sidebar-footer">
        <a href="LogoutServlet" onclick="return confirm('Are you sure you want to logout?')" class="nav-link" style="color: #ef4444;">
            <span class="icon"><i class="fa-solid fa-right-from-bracket"></i></span>
            <span>Logout</span>
        </a>
    </div>
</aside>
