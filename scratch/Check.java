import java.sql.*;

public class Check {
    public static void main(String[] args) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db", "root", "root");
        ResultSet rs = c.createStatement().executeQuery("SELECT * FROM book");
        System.out.println("BOOKS IN DATABASE:");
        while(rs.next()) {
            System.out.println("- " + rs.getString("title") + " (Cat: " + rs.getInt("category_id") + ")");
        }
        c.close();
    }
}
