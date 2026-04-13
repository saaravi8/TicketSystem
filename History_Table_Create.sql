CREATE TABLE ticket_history (
    history_id        BIGSERIAL PRIMARY KEY,

    ticket_id         BIGINT NOT NULL,

    changed_by        VARCHAR(100),

    field_name        VARCHAR(100) NOT NULL,
    old_value         TEXT,
    new_value         TEXT,

    changed_at        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_history_ticket
        FOREIGN KEY (ticket_id)
        REFERENCES tickets(ticket_id)
        ON DELETE CASCADE
);
