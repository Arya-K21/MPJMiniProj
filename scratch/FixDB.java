import java.sql.*;

public class FixDB {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/library_db",
                "root",
                "root"
            );
            
            if (con == null) {
                System.out.println("Connection failed");
                return;
            }
            
            System.out.println("Connection successful");
            Statement st = con.createStatement();
            
            // Check if columns exist
            DatabaseMetaData metaData = con.getMetaData();
            ResultSet rs = metaData.getColumns(null, null, "issue", "return_date");
            if (!rs.next()) {
                System.out.println("Adding return_date to issue table...");
                st.executeUpdate("ALTER TABLE issue ADD COLUMN return_date DATE");
            } else {
                System.out.println("return_date already exists");
            }
            
            rs = metaData.getColumns(null, null, "issue", "fine");
            if (!rs.next()) {
                System.out.println("Adding fine to issue table...");
                st.executeUpdate("ALTER TABLE issue ADD COLUMN fine INT DEFAULT 0");
            } else {
                System.out.println("fine already exists");
            }
            
            st.close();
            con.close();
            System.out.println("DB Fix completed");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
