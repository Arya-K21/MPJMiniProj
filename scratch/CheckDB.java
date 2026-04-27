import java.sql.*;

public class CheckDB {
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
            DatabaseMetaData metaData = con.getMetaData();
            ResultSet rs = metaData.getColumns(null, null, "issue", null);
            
            System.out.println("Columns in 'issue' table:");
            while (rs.next()) {
                System.out.println("- " + rs.getString("COLUMN_NAME"));
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
