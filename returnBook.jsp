<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.IssueDAO, model.Issue, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Return Book - SeaLibrary</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .split-content {
            display: grid;
            grid-template-columns: 1fr 350px;
            gap: 2rem;
        }
        .issue-item {
            padding: 1rem;
            border: 1px solid var(--border);
            border-radius: var(--radius-sm);
            margin-bottom: 1rem;
            cursor: pointer;
            transition: all 0.2s;
            background: white;
        }
        .issue-item:hover {
            border-color: var(--primary);
            transform: translateX(4px);
            box-shadow: var(--shadow-sm);
        }
        .issue-title {
            font-weight: 600;
            margin-bottom: 0.25rem;
            color: var(--text-main);
        }
        .issue-meta {
            font-size: 0.8125rem;
            color: var(--text-muted);
        }
        .scroll-area {
            max-height: calc(100vh - 250px);
            overflow-y: auto;
            padding-right: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="app-container">
        <%@ include file="sidebar.jsp" %>
        
        <main class="main-content">
            <%@ include file="header.jsp" %>
            
            <div class="page-header">
                <h1 class="page-title">Book Returns</h1>
                <p class="page-subtitle">Process incoming books and manage pending returns.</p>
            </div>

            <div class="content-padding">
                <div class="split-content">
                    <div class="form-panel">
                        <div class="form-container" style="margin-top: 0; max-width: 100%;">
                            <h2 style="margin-bottom: 1.5rem; font-size: 1.25rem;">Return Transaction</h2>
                            <form action="ReturnServlet" method="post">
                                <div class="form-group">
                                    <label for="issue_id">Issue ID</label>
                                    <input type="text" id="issue_id" name="issue_id" placeholder="Select from list or enter ID" required>
                                </div>

                                <div class="form-group">
                                    <label for="return_date">Return Date</label>
                                    <input type="date" id="return_date" name="return_date" required>
                                </div>

                                <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                                    <button type="submit" class="btn btn-primary" style="flex: 1;">Confirm Return</button>
                                    <a href="dashboard.jsp" class="btn btn-secondary" style="flex: 1;">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="list-panel">
                        <h2 style="margin-bottom: 1.5rem; font-size: 1.25rem;">Pending Returns</h2>
                        <div class="scroll-area">
                            <%
                                try {
                                    List<Issue> issues = IssueDAO.getPendingIssues();
                                    if (issues == null || issues.isEmpty()) {
                            %>
                                        <div style="text-align: center; padding: 2rem; color: var(--text-muted);">
                                            No pending books to return.
                                        </div>
                            <%
                                    } else {
                                        for (Issue issue : issues) {
                            %>
                                            <div class="issue-item" onclick="selectIssue(<%= issue.getIssueId() %>)">
                                                <div class="issue-title"><%= issue.getBookTitle() %></div>
                                                <div class="issue-meta">
                                                    ID: <strong>#<%= issue.getIssueId() %></strong> &bull; 
                                                    Student: <%= issue.getStudentId() %>
                                                </div>
                                                <div style="margin-top: 0.5rem;">
                                                    <span class="badge badge-warning">Due: <%= issue.getDueDate() %></span>
                                                </div>
                                            </div>
                            <%
                                        }
                                    }
                                } catch (Exception e) {
                            %>
                                    <div class="alert alert-error">Unable to load pending issues.</div>
                            <%  } %>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        // Auto-fill form when an item is clicked
        function selectIssue(issueId) {
            document.getElementById('issue_id').value = issueId;
            const input = document.getElementById('issue_id');
            input.focus();
            input.style.borderColor = 'var(--primary)';
            setTimeout(() => {
                input.style.borderColor = 'var(--border)';
            }, 500);
        }

        // Set today's date as default
        document.getElementById('return_date').valueAsDate = new Date();
    </script>
</body>
</html>