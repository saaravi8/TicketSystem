-- ---- ENUM types (required by tickets) ----
CREATE TYPE ticket_status   AS ENUM ('Open', 'In Progress', 'Review', 'Closed');
CREATE TYPE ticket_priority AS ENUM ('Low', 'Medium', 'High', 'Critical');

-- ---- Tickets ----
CREATE TABLE tickets (
    ticket_id   SERIAL          PRIMARY KEY,
    title       VARCHAR(300)    NOT NULL,
    status      ticket_status   NOT NULL DEFAULT 'Open',
    priority    ticket_priority NOT NULL DEFAULT 'Medium',
    creator_id  VARCHAR(255)    NOT NULL REFERENCES users(user_id) ON DELETE RESTRICT,
    assignee_id VARCHAR(255)             REFERENCES users(user_id) ON DELETE SET NULL,
    created_at  TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    closed_at   TIMESTAMP
);

CREATE INDEX idx_tickets_status     ON tickets(status);
CREATE INDEX idx_tickets_priority   ON tickets(priority);
CREATE INDEX idx_tickets_assignee   ON tickets(assignee_id);
CREATE INDEX idx_tickets_created_at ON tickets(created_at);
