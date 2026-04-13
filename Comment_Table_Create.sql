CREATE TABLE comments (
    comment_id            BIGSERIAL PRIMARY KEY,

    ticket_id             BIGINT NOT NULL,
    
    author_id_or_label    VARCHAR(100),

    body                  TEXT NOT NULL,

    created_at            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    is_internal           BOOLEAN NOT NULL DEFAULT FALSE,

    CONSTRAINT fk_comments_ticket
        FOREIGN KEY (ticket_id)
        REFERENCES tickets(ticket_id)
        ON DELETE CASCADE,

    CONSTRAINT chk_comment_not_empty
        CHECK (char_length(body) > 0)
);
