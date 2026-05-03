import java.sql.*;

public class FixDB {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db", "root", "root");
            Statement s = c.createStatement();
            
            // Add missing categories
            s.execute("INSERT IGNORE INTO category (category_id, category_name) VALUES (4, 'History'), (5, 'Biography'), (6, 'Self-Help')");
            
            // Add some generic authors so IDs 4, 5, 6, 7 exist
            s.execute("INSERT IGNORE INTO author (author_id, author_name, email) VALUES (4, 'Jane Austen', 'jane@example.com'), (5, 'Mark Twain', 'mark@example.com'), (6, 'Agatha Christie', 'agatha@example.com'), (7, 'Stephen King', 'stephen@example.com'), (8, 'Arthur Conan Doyle', 'arthur@example.com')");
            
            System.out.println("SUCCESS: Missing categories and authors have been added to the database!");
            c.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
