-- Ticket Types
CREATE TABLE ticket_types (
    ticket_type_id   SERIAL PRIMARY KEY,
    name             VARCHAR(50) UNIQUE NOT NULL
);

-- Statuses
CREATE TABLE statuses (
    status_id   SERIAL PRIMARY KEY,
    name        VARCHAR(50) UNIQUE NOT NULL
);

-- Priorities
CREATE TABLE priorities (
    priority_id   SERIAL PRIMARY KEY,
    name          VARCHAR(20) UNIQUE NOT NULL
);

-- Severities
CREATE TABLE severities (
    severity_id   SERIAL PRIMARY KEY,
    name          VARCHAR(20) UNIQUE NOT NULL
);

-- Resolution Codes
CREATE TABLE resolution_codes (
    resolution_code_id   SERIAL PRIMARY KEY,
    name                 VARCHAR(50) UNIQUE NOT NULL
);

-- Component Areas
CREATE TABLE component_areas (
    component_area_id   SERIAL PRIMARY KEY,
    name                VARCHAR(50) UNIQUE NOT NULL
);

-- Tags (normalized option)
CREATE TABLE tags (
    tag_id   SERIAL PRIMARY KEY,
    name     VARCHAR(50) UNIQUE NOT NULL
);

-- Ticket-Tags mapping (many-to-many)
CREATE TABLE ticket_tags (
    ticket_id   BIGINT NOT NULL,
    tag_id      INT NOT NULL,

    PRIMARY KEY (ticket_id, tag_id),

    FOREIGN KEY (ticket_id)
        REFERENCES tickets(ticket_id)
        ON DELETE CASCADE,

    FOREIGN KEY (tag_id)
        REFERENCES tags(tag_id)
        ON DELETE CASCADE
);
