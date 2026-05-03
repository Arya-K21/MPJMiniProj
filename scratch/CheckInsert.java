import java.sql.*;

public class CheckInsert {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db", "root", "root");
            
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO book (title, available_copies, copies, author_id, category_id) VALUES (?, ?, ?, ?, ?)"
            );
            ps.setString(1, "Test Book");
            ps.setInt(2, 5);
            ps.setInt(3, 5);
            ps.setInt(4, 1);
            ps.setInt(5, 4); // Category 4 (History)

            int rows = ps.executeUpdate();
            System.out.println("Inserted: " + rows);
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
