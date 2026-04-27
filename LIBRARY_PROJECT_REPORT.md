# Library Management System - Technical Report

## 1. Project Overview
The **Library Management System** is a robust Java-based web application designed to manage library operations efficiently. It features a modern, professional "Sea Vibes" aesthetic and follows a modular architecture for scalability and maintainability.

The application allows administrators (librarians) to manage books, track book issues, handle returns, and calculate fines for late returns. One of its standout features is a **hybrid data access layer** that functions even when the MySQL database is not connected, using in-memory mock data for demonstration purposes.

## 2. Technology Stack
-   **Backend**: Java (Servlets), JDBC
-   **Frontend**: JSP (JavaServer Pages), CSS (Modern "Sea Vibes" UI), JavaScript
-   **Web Server**: Apache Tomcat 11
-   **Database**: MySQL (using the `com.mysql.cj.jdbc.Driver`)
-   **Styling**: Vanilla CSS with custom variables for the "Sea Vibes" (Sea Green, Sandy Brown, Coral) aesthetic.

---

## 3. Project Structure & Files

### A. Root Directory (Web Content)
-   `index.jsp`: The entry point, which redirects users to the login page.
-   `login.jsp`: A sleek, split-screen login page with themed illustrations.
-   `dashboard.jsp`: The main control center showing key statistics and actions.
-   `header.jsp` & `sidebar.jsp`: Modular UI components used across all pages for a consistent layout.
-   `viewBooks.jsp`: Displays the complete library inventory in a responsive table.
-   `addBook.jsp`: Interface for adding new book records to the system.
-   `issueBook.jsp`: Form for issuing books to students with real-time feedback.
-   `returnBook.jsp`: A specialized split-screen interface that lists currently issued books on the left and a return form on the right for ease of use.
-   `setup.sql`: Database initialization script containing table definitions for Admin, Books, Authors, Categories, Students, and Issues.

### B. Source Code (`src/`)
The backend is organized into three logical packages:

#### 1. Models (`src/model/`)
Plain Old Java Objects (POJOs) that represent the data entities.
-   `Book.java`: Tracks book ID, title, total copies, and available copies.
-   `Issue.java`: Records the relationship between students and books, including issue dates, due dates, return dates, and accumulated fines.

#### 2. Data Access Objects (`src/dao/`)
Handles all interactions with the persistence layer.
-   `DBConnection.java`: Manages the MySQL connection using JDBC.
-   `BookDAO.java`: Performs CRUD operations for books. Contains the "hybrid data" logic that falls back to sample data if DB connection fails.
-   `IssueDAO.java`: Manages the lifecycle of a book issue, including marking returns and calculating pending issues.

#### 3. Controllers (`src/controller/`)
Java Servlets that handle HTTP requests and implement business logic.
-   `LoginServlet.java`: Manages admin authentication and session management.
-   `BookServlet.java`: Handles the processing of new book additions.
-   `IssueServlet.java`: Implements the logic for issuing a book, updating availability counts.
-   `ReturnServlet.java`: Calculates late return fines (₹10 per day) and updates records.
-   `LogoutServlet.java`: Terminates the user session securely.

---

## 4. Key Implementation Details

### Hybrid Data Access Logic
Wait-safe design in `BookDAO` and `IssueDAO`:
```java
Connection con = DBConnection.getConnection();
if (con == null) {
    // Fallback to in-memory static List<Book> or List<Issue>
    // This allows the app to be showcased without a local database setup.
} else {
    // Standard JDBC PreparedStatement execution
}
```

### Fine Calculation Algorithm
Implemented in `ReturnServlet`:
1.  Retrieve the `due_date` for the `issue_id`.
2.  Compare it against the `actual_return_date`.
3.  Calculate the difference in days.
4.  `Fine = Math.max(0, daysLate * 10)`.

### User Experience (UX) Enhancements
-   **Split-Screen Return**: The `returnBook.jsp` features a dynamic sidebar. When a user clicks on a "Pending Issue", JavaScript automatically populates the `issue_id` in the return form, minimizing data entry errors.
-   **Modern UI**: Uses a coastal color palette (#1a5f7a, #e63946, #8ecae6) with glassmorphism effects and smooth transitions.

---

## 5. Database Schema (MySQL)
The system uses a relational schema with foreign key constraints:
-   **admin**: (admin_id, password, name)
-   **author**: (author_id, author_name, email)
-   **category**: (category_id, category_name)
-   **book**: (id, title, author_id, category_id, copies, available_copies)
-   **student**: (student_id, student_name, email, phone)
-   **issue**: (issue_id, student_id, book_id, issue_date, due_date, return_date, fine)

---

## 6. How to Run
1.  **Database Setup**: Execute `setup.sql` in your MySQL Workbench or terminal.
2.  **Configuration**: Update credentials in `src/dao/DBConnection.java` if they differ from the defaults (root/root).
3.  **Deployment**: Export the project as a `.war` file or run it directly on Apache Tomcat via an IDE.
4.  **Access**: Open `http://localhost:8080/LibraryWebApp/` in your browser.
