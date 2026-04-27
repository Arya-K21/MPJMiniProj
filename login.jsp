<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Library Management System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="login-page">
        <div class="login-left">
            <img src="images/login-bg.png" alt="Library Sea Vibes">
            <div class="login-overlay">
                <h1>Dive into Knowledge</h1>
                <p>Welcome to the Library Management System. Explore our vast collection with a breeze.</p>
            </div>
        </div>
        <div class="login-right">
            <div class="login-header">
                <div class="logo">
                    <div class="logo-icon">📚</div>
                    <span>Library.io</span>
                </div>
                <h1>Login</h1>
                <p>Enter your credentials to access the dashboard</p>
            </div>

            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>

                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                    <label style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 0; cursor: pointer;">
                        <input type="checkbox" style="width: auto;"> <span>Remember me</span>
                    </label>
                    <a href="#" style="font-size: 0.875rem; color: var(--primary); text-decoration: none;">Forgot Password?</a>
                </div>

                <button type="submit" class="btn btn-primary" style="width: 100%;">Login</button>
            </form>

            <div style="margin-top: 2rem; text-align: center; color: var(--text-muted); font-size: 0.875rem;">
                <p>Don't have an account? <a href="#" style="color: var(--primary); font-weight: 600; text-decoration: none;">Contact Admin</a></p>
            </div>
        </div>
    </div>
</body>
</html>