import java.sql.Timestamp;

public class Ticket {
    private int ticketId;
    private String title;
    private String status;
    private String priority;
    private String creatorName;
    private String assigneeName;
    private Timestamp createdAt;
    private Timestamp closedAt;

    public Ticket(int ticketId, String title, String status, String priority,
                  String creatorName, String assigneeName,
                  Timestamp createdAt, Timestamp closedAt) {
        this.ticketId = ticketId;
        this.title = title;
        this.status = status;
        this.priority = priority;
        this.creatorName = creatorName;
        this.assigneeName = assigneeName;
        this.createdAt = createdAt;
        this.closedAt = closedAt;
    }

    public int getTicketId() { return ticketId; }
    public String getTitle() { return title; }
    public String getStatus() { return status; }
    public String getPriority() { return priority; }
    public String getCreatorName() { return creatorName; }
    public String getAssigneeName() { return assigneeName; }
    public Timestamp getCreatedAt() { return createdAt; }
    public Timestamp getClosedAt() { return closedAt; }

    @Override
    public String toString() {
        return String.format(
            "[#%d] %s\n     Status: %-12s | Priority: %-8s\n     Creator: %-20s | Assignee: %s\n     Created: %s | Closed: %s",
            ticketId, title, status, priority,
            creatorName,
            assigneeName != null ? assigneeName : "Unassigned",
            createdAt,
            closedAt != null ? closedAt.toString() : "—");
    }
}
