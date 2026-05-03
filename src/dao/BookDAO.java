package dao;

import java.sql.*;
import java.util.*;
import model.Book;

public class BookDAO {
    
    // Sample data for demo when DB is not connected
    private static List<Book> sampleBooks = new ArrayList<>();
    private static int nextId = 6;
    
    static {
        Book b1 = new Book();
        b1.setId(1);
        b1.setTitle("Harry Potter and the Philosopher's Stone");
        b1.setAuthorId(1);
        b1.setCategoryId(1);
        b1.setAvailableCopies(5);
        b1.setTotalCopies(5);
        sampleBooks.add(b1);
        
        Book b2 = new Book();
        b2.setId(2);
        b2.setTitle("1984");
        b2.setAuthorId(2);
        b2.setCategoryId(1);
        b2.setAvailableCopies(3);
        b2.setTotalCopies(3);
        sampleBooks.add(b2);
        
        Book b3 = new Book();
        b3.setId(3);
        b3.setTitle("The Lord of the Rings");
        b3.setAuthorId(3);
        b3.setCategoryId(1);
        b3.setAvailableCopies(2);
        b3.setTotalCopies(2);
        sampleBooks.add(b3);
        
        Book b4 = new Book();
        b4.setId(4);
        b4.setTitle("To Kill a Mockingbird");
        b4.setAuthorId(4);
        b4.setCategoryId(1);
        b4.setAvailableCopies(4);
        b4.setTotalCopies(4);
        sampleBooks.add(b4);
        
        Book b5 = new Book();
        b5.setId(5);
        b5.setTitle("The Great Gatsby");
        b5.setAuthorId(5);
        b5.setCategoryId(1);
        b5.setAvailableCopies(6);
        b5.setTotalCopies(6);
        sampleBooks.add(b5);
    }
    
    private static List<Book> getSampleBooks() {
        return sampleBooks;
    }

    public static void addBook(Book b) throws Exception {
        try {
            Connection con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("[WARNING] DB CONNECTION FAILED - Using sample data mode");
                b.setId(nextId++);
                sampleBooks.add(b);
                System.out.println("[OK] Book added to sample collection: " + b.getTitle());
                return;
            }

            System.out.println("[OK] DB CONNECTED");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO book (title, available_copies, copies, author_id, category_id) VALUES (?, ?, ?, ?, ?)"
            );

            ps.setString(1, b.getTitle());
            ps.setInt(2, b.getAvailableCopies());
            ps.setInt(3, b.getTotalCopies());
            ps.setInt(4, b.getAuthorId());
            ps.setInt(5, b.getCategoryId());

            int rows = ps.executeUpdate();

            System.out.println("Rows inserted: " + rows);
        } catch(Exception e) {
            System.out.println("[WARNING] Database error: " + e.getMessage());
            b.setId(nextId++);
            sampleBooks.add(b);
            System.out.println("[OK] Book added to sample collection: " + b.getTitle());
        }
    }

    public static List<Book> getAllBooks() throws Exception {
        try {
            List<Book> list = new ArrayList<>();

            Connection con = DBConnection.getConnection();
            
            if (con == null) {
                System.out.println("[WARNING] DB CONNECTION FAILED - Returning sample data");
                return getSampleBooks();
            }
            
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM book");

            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setAvailableCopies(rs.getInt("available_copies"));
                b.setTotalCopies(rs.getInt("copies"));
                b.setAuthorId(rs.getInt("author_id"));
                b.setCategoryId(rs.getInt("category_id"));

                list.add(b);
            }

            return list;
        } catch(Exception e) {
            System.out.println("[WARNING] Database error: " + e.getMessage());
            System.out.println("[OK] Returning sample data for demo");
            return getSampleBooks();
        }
    }

    public static void updateAvailableCopies(int bookId, int delta) throws Exception {
        Connection con = DBConnection.getConnection();
        
        if (con == null) {
            System.out.println("[WARNING] DB CONNECTION FAILED - Updating available copies in sample data");
            for (Book b : sampleBooks) {
                if (b.getId() == bookId) {
                    b.setAvailableCopies(b.getAvailableCopies() + delta);
                    return;
                }
            }
            return;
        }

        PreparedStatement ps = con.prepareStatement(
            "UPDATE book SET available_copies = available_copies + ? WHERE id = ?"
        );
        ps.setInt(1, delta);
        ps.setInt(2, bookId);
        ps.executeUpdate();
        ps.close();
        con.close();
    }

    public static Book getBookById(int id) throws Exception {
        Connection con = DBConnection.getConnection();
        if (con == null) {
            for (Book b : sampleBooks) {
                if (b.getId() == id) return b;
            }
            return null;
        }

        PreparedStatement ps = con.prepareStatement("SELECT * FROM book WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        Book b = null;
        if (rs.next()) {
            b = new Book();
            b.setId(rs.getInt("id"));
            b.setTitle(rs.getString("title"));
            b.setAvailableCopies(rs.getInt("available_copies"));
            b.setTotalCopies(rs.getInt("copies"));
            b.setAuthorId(rs.getInt("author_id"));
            b.setCategoryId(rs.getInt("category_id"));
        }
        rs.close();
        ps.close();
        con.close();
        return b;
    }
}