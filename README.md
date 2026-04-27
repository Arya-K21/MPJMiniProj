# 📚 Library Management System

A robust, modern Java-based web application for managing library operations efficiently. Features a sleek "Sea Vibes" aesthetic and supports seamless book tracking, student management, and fine calculation.

![Java](https://img.shields.io/badge/Java-ED8B00?style=flat-square&logo=java&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-007396?style=flat-square&logo=java&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C87?style=flat-square&logo=mysql&logoColor=white)
![Tomcat](https://img.shields.io/badge/Tomcat-F8DC75?style=flat-square&logo=apache-tomcat&logoColor=black)

---

## 🎯 Features

✨ **Core Functionality**
- 📖 **Book Management**: Add, view, and track book inventory
- 👥 **Student Management**: Register and manage student records
- 📤 **Issue Books**: Seamless book issuing to students with real-time feedback
- 📥 **Return Books**: Process returns and automatically calculate late fines
- 💰 **Fine Calculation**: Automatic fine tracking (₹10 per day late)
- 🔐 **Admin Authentication**: Secure login system for librarians

✨ **Technical Highlights**
- 🔄 **Hybrid Data Access**: Works with or without database connection (fallback to mock data)
- 🎨 **Modern UI**: Coastal color palette with glassmorphism effects
- 📱 **Responsive Design**: Works seamlessly on desktop and tablet devices
- ⚡ **Modular Architecture**: Clean separation of concerns (MVC pattern)

---

## 🛠️ Technology Stack

| Component | Technology |
|-----------|-----------|
| **Backend** | Java Servlets, JDBC |
| **Frontend** | JSP, HTML5, CSS3, JavaScript |
| **Web Server** | Apache Tomcat 11 |
| **Database** | MySQL with `com.mysql.cj.jdbc.Driver` |
| **Build Tool** | Manual compilation (or IDE export) |

---

## 📂 Project Structure

```
LibraryWebApp/
├── src/
│   ├── controller/          # HTTP request handlers (Servlets)
│   │   ├── LoginServlet.java
│   │   ├── BookServlet.java
│   │   ├── IssueServlet.java
│   │   ├── ReturnServlet.java
│   │   └── LogoutServlet.java
│   ├── dao/                 # Data Access Objects
│   │   ├── DBConnection.java
│   │   ├── BookDAO.java
│   │   └── IssueDAO.java
│   └── model/               # Data Models (POJOs)
│       ├── Book.java
│       └── Issue.java
├── jsp/                     # JavaServer Pages
│   ├── index.jsp            # Landing page
│   ├── login.jsp            # Admin login
│   ├── dashboard.jsp        # Main control center
│   ├── viewBooks.jsp        # Book inventory
│   ├── addBook.jsp          # Add new books
│   ├── issueBook.jsp        # Issue books to students
│   ├── returnBook.jsp       # Process book returns
│   ├── header.jsp           # Navigation component
│   └── sidebar.jsp          # Sidebar component
├── css/
│   └── style.css            # Sea Vibes theme styling
├── WEB-INF/
│   ├── web.xml              # Deployment descriptor
│   ├── classes/             # Compiled Java classes
│   └── lib/                 # External libraries
├── setup.sql                # Database initialization
└── README.md                # This file
```

---

## 📋 Prerequisites

Before setting up the project, ensure you have:

- **Java Development Kit (JDK)** 8 or higher
- **Apache Tomcat** 10 or higher (tested with v11)
- **MySQL Server** 5.7 or higher
- **MySQL Connector/J** (JDBC Driver) - included in `WEB-INF/lib/`
- An IDE like **IntelliJ IDEA**, **Eclipse**, or **VS Code**

---

## 🚀 Quick Start

### 1️⃣ Clone or Download the Project
```bash
# Navigate to your Tomcat webapps directory
cd /path/to/apache-tomcat-xx/webapps/
```

### 2️⃣ Database Setup

**Option A: Using MySQL Command Line**
```bash
mysql -u root -p < setup.sql
```

**Option B: Using MySQL Workbench**
1. Open MySQL Workbench
2. Create a new query tab
3. Open `setup.sql` and execute all statements

**Database created:** `library_db`

### 3️⃣ Configure Database Connection

Edit `src/dao/DBConnection.java` and update the credentials:

```java
private static final String URL = "jdbc:mysql://localhost:3306/library_db";
private static final String USER = "root";           // Change as needed
private static final String PASSWORD = "root";       // Change as needed
```

### 4️⃣ Compile and Deploy

**Using IDE (Recommended):**
1. Open the project in your IDE
2. Configure it as a Dynamic Web Project
3. Add Tomcat as the server runtime
4. Run on server

**Manual Deployment:**
```bash
# Compile
cd src
javac -d ../WEB-INF/classes controller/*.java dao/*.java model/*.java

# Deploy to Tomcat
cp -r ../ /path/to/apache-tomcat-xx/webapps/LibraryWebApp
```

### 5️⃣ Start Tomcat and Access the Application

```bash
# Linux/Mac
./catalina.sh run

# Windows
catalina.bat run
```

Open your browser and navigate to:
```
http://localhost:8080/LibraryWebApp/
```

---

## 🔑 Default Login Credentials

The `setup.sql` includes a default admin account:

| Field | Value |
|-------|-------|
| **Username** | admin |
| **Password** | admin123 |

⚠️ **Security Note**: Change these credentials in production!

---

## 📖 Usage Guide

### 📊 Dashboard
The main hub displaying:
- Total books in inventory
- Available copies
- Quick action buttons
- Issued books count

### 📚 Manage Books
1. Click **"Add Book"** to register new titles
2. Fill in book details (title, author, category, copies)
3. View all books in **"View Books"** tab

### 📤 Issue Books
1. Navigate to **"Issue Book"**
2. Select a student and book
3. Click **"Issue"** to record the transaction
4. Due date is automatically set to 14 days

### 📥 Return Books
1. Go to **"Return Book"**
2. Select from the list of pending issues on the left
3. Click on an issue to auto-populate the form
4. Confirm return to calculate fines automatically

### 💰 Fine Calculation
- **Rate**: ₹10 per day after due date
- **Automatic**: Calculated on return
- **Example**: 5 days late = ₹50 fine

---

## 🏗️ Architecture Overview

### MVC Pattern Implementation

```
Request (HTTP)
     ↓
[Controller] - Servlets handle business logic
     ↓
[Model] - POJOs represent data
     ↓
[DAO Layer] - Database abstraction
     ↓
[MySQL] - Persistent storage
     ↑
[View] - JSP pages render HTML
     ↓
Response (HTML)
```

### Hybrid Data Access

The application gracefully handles database unavailability:

```java
public List<Book> getAllBooks() {
    Connection con = DBConnection.getConnection();
    
    if (con == null) {
        // Use in-memory mock data for demonstration
        return getMockBooks();
    } else {
        // Execute database queries
        return queryDatabase();
    }
}
```

---

## 📊 Database Schema

### Tables

**admin**
```sql
admin_id (VARCHAR, PK) | password (VARCHAR) | name (VARCHAR)
```

**book**
```sql
id (INT, PK) | title (VARCHAR) | author_id (INT, FK) | 
category_id (INT, FK) | copies (INT) | available_copies (INT)
```

**student**
```sql
student_id (INT, PK) | student_name (VARCHAR) | email (VARCHAR) | phone (VARCHAR)
```

**issue**
```sql
issue_id (INT, PK) | student_id (INT, FK) | book_id (INT, FK) | 
issue_date (DATE) | due_date (DATE) | return_date (DATE) | fine (INT)
```

**author**
```sql
author_id (INT, PK) | author_name (VARCHAR) | email (VARCHAR)
```

**category**
```sql
category_id (INT, PK) | category_name (VARCHAR)
```

---

## 🎨 UI/UX Features

### Design Highlights
- **Color Scheme**: Sea Green (#1a5f7a), Coral (#e63946), Sky Blue (#8ecae6)
- **Typography**: Clean, modern font hierarchy
- **Interactions**: Smooth transitions and hover effects
- **Accessibility**: Semantic HTML and ARIA labels

### Key UX Enhancements
- ✅ Split-screen design in Return Books page
- ✅ Real-time form population with JavaScript
- ✅ Responsive tables for inventory viewing
- ✅ Intuitive navigation with persistent header and sidebar

---

## 🔧 Configuration

### Update Server Port
Edit Tomcat's `conf/server.xml`:
```xml
<Connector port="8080" protocol="HTTP/1.1" />
```

### Change Application Context
Rename the deployment folder or update `conf/Catalina/localhost/ROOT.xml`

### Add CORS Support (if needed)
Modify `web.xml` to add CORS headers for API requests

---

## 📝 Common Issues & Troubleshooting

| Issue | Solution |
|-------|----------|
| **Database connection fails** | Check MySQL is running; verify credentials in `DBConnection.java` |
| **404 Not Found** | Ensure context path matches deployment folder name |
| **Compilation errors** | Verify JDK version matches project source/target levels |
| **JSP not rendering** | Check Tomcat logs in `CATALINA_HOME/logs/` |
| **Static files not loading** | Verify `css/` and `images/` paths in JSP files |

---

## 📚 Additional Resources

- [Apache Tomcat Documentation](https://tomcat.apache.org/)
- [Java Servlets Guide](https://docs.oracle.com/cd/E19798-01/servlet/)
- [MySQL JDBC Driver](https://dev.mysql.com/downloads/connector/j/)
- [JSP Tutorial](https://www.oracle.com/java/technologies/jsps.html)

---

## 📄 License

This project is provided as-is for educational and library management purposes.

---

## 👨‍💻 Author & Support

For questions, suggestions, or improvements, feel free to reach out or open an issue.

**Happy Library Management! 📚✨**

---

**Last Updated**: April 2026  
**Version**: 1.0  
**Status**: Active Maintenance
