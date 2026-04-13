CREATE TABLE attachments (
    attachment_id         BIGSERIAL PRIMARY KEY,

    ticket_id             BIGINT NOT NULL,

    file_name             VARCHAR(255) NOT NULL,
    file_type             VARCHAR(100),
    file_size             BIGINT,

    storage_path_or_ref   TEXT NOT NULL,

    uploaded_by           VARCHAR(100),
    uploaded_at           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_attachments_ticket
        FOREIGN KEY (ticket_id)
        REFERENCES tickets(ticket_id)
        ON DELETE CASCADE
);
