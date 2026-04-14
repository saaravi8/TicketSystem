CREATE TABLE tickets (
    ticket_id              BIGSERIAL PRIMARY KEY,

    title                  VARCHAR(255) NOT NULL,
    description            TEXT,

    ticket_type            VARCHAR(50) NOT NULL,
    component_area         VARCHAR(50) NOT NULL,

    status                 VARCHAR(50) NOT NULL DEFAULT 'New',
    priority               VARCHAR(20) NOT NULL,
    severity               VARCHAR(20),

    requester_id_or_label  VARCHAR(100),
    assignee_id_or_label   VARCHAR(100),
    reporter_id_or_label   VARCHAR(100),

    created_at             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    due_date               TIMESTAMP,

    resolution_code        VARCHAR(50),
    resolution_notes       TEXT,

    related_reference      VARCHAR(255),

    tags                   TEXT[],  -- PostgreSQL array for tags

    parent_ticket_id       BIGINT,
    
    source_channel         VARCHAR(50),

    is_blocked             BOOLEAN NOT NULL DEFAULT FALSE,
    blocked_reason         TEXT,

    -- Self-reference (parent-child relationship)
    CONSTRAINT fk_parent_ticket
        FOREIGN KEY (parent_ticket_id)
        REFERENCES tickets(ticket_id)
        ON DELETE SET NULL,

    -- Enforce blocked logic
    CONSTRAINT chk_blocked_reason
        CHECK (
            (is_blocked = FALSE AND blocked_reason IS NULL)
            OR
            (is_blocked = TRUE AND blocked_reason IS NOT NULL)
        ),

    -- Optional: prevent empty title
    CONSTRAINT chk_title_not_empty
        CHECK (char_length(title) > 0)
);
