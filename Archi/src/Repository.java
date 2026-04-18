import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Repository implements queries {

    private Connection connection;

    public Repository(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void displayAllTickets() {
        String sql = "SELECT ticket_id, title, status::text, priority::text, "
                   + "creator_id, assignee_id, created_at, closed_at "
                   + "FROM tickets ORDER BY ticket_id";

        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            List<Ticket> tickets = new ArrayList<>();

            while (rs.next()) {
                Ticket ticket = new Ticket(
                    rs.getInt("ticket_id"),
                    rs.getString("title"),
                    rs.getString("status"),
                    rs.getString("priority"),
                    rs.getString("creator_id"),
                    rs.getString("assignee_id"),
                    rs.getTimestamp("created_at"),
                    rs.getTimestamp("closed_at")
                );
                tickets.add(ticket);
            }

            if (tickets.isEmpty()) {
                System.out.println("No tickets found in the database.");
            } else {
                System.out.println("========== ALL TICKETS (" + tickets.size() + ") ==========\n");
                for (Ticket t : tickets) {
                    System.out.println(t);
                    System.out.println("--------------------------------------------");
                }
            }

        } catch (SQLException e) {
            System.err.println("Error retrieving tickets: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        Connect c = new Connect();
        try {
            Connection conn = c.getConnection();
            System.out.println("Connected to the database successfully!\n");

            Repository repo = new Repository(conn);
            repo.displayAllTickets();

            conn.close();
        } catch (SQLException e) {
            System.err.println("Failed to connect to the database: " + e.getMessage());
        }
    }
}
