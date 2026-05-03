<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String hAdminName = (String) session.getAttribute("admin_name");
    if (hAdminName == null) hAdminName = "Librarian";
    String adminRole = "Administrator";
%>
<div class="top-bar">
    <div class="search-bar">
        <span><i class="fa-solid fa-search"></i></span>
        <input type="text" placeholder="Search books, students...">
    </div>

    <div class="user-profile">
        <div class="user-info">
            <div class="user-name"><%= hAdminName %></div>
            <div class="user-role"><%= adminRole %></div>
        </div>
        <div class="user-avatar">
            <%= hAdminName.substring(0, 1).toUpperCase() %>
        </div>
    </div>
</div>
