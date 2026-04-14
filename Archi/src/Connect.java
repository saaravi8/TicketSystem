import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
	private static final String URL = "jdbc:postgresql://localhost:5432/your_db"; //to connect - change this URL
    private static final String USER = "postgres"; ///to connect - change this USER
    private static final String PASS = "your_password"; //to connect - change this PASS
    
    public Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            throw new SQLException("PostgreSQL Driver not found", e);
        }
    }
}
