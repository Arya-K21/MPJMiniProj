-- Create Database
CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

-- Admin Table
CREATE TABLE IF NOT EXISTS admin (
    admin_id VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100)
);

-- Author Table
CREATE TABLE IF NOT EXISTS author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

-- Category Table
CREATE TABLE IF NOT EXISTS category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

-- Book Table
CREATE TABLE IF NOT EXISTS book (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    category_id INT,
    copies INT DEFAULT 0,
    available_copies INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES author(author_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Student Table
CREATE TABLE IF NOT EXISTS student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Issue Table
CREATE TABLE IF NOT EXISTS issue (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    book_id INT NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE,
    return_date DATE,
    fine INT DEFAULT 0,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (book_id) REFERENCES book(id)
);

-- Note: return_record table is replaced by consolidating into the issue table
-- to simplify the DAO logic.

-- Insert sample admin user
INSERT INTO admin (admin_id, password, name) VALUES ('admin', 'admin', 'Administrator');

-- Insert sample authors
INSERT INTO author (author_name, email) VALUES 
('J.K. Rowling', 'jk@example.com'),
('George Orwell', 'george@example.com'),
('J.R.R. Tolkien', 'tolkien@example.com');

-- Insert sample categories
INSERT INTO category (category_name) VALUES 
('Fiction'),
('Science'),
('History');

-- Insert sample books
INSERT INTO book (title, author_id, category_id, copies, available_copies) VALUES 
('Harry Potter', 1, 1, 5, 5),
('1984', 2, 1, 3, 3),
('The Lord of the Rings', 3, 1, 2, 2);

-- Insert sample students
INSERT INTO student (student_name, email, phone) VALUES 
('John Doe', 'john@example.com', '9876543210'),
('Jane Smith', 'jane@example.com', '9876543211'),
('Bob Johnson', 'bob@example.com', '9876543212');
