CREATE INDEX idx_comments_ticket_id ON comments(ticket_id);
CREATE INDEX idx_history_ticket_id ON ticket_history(ticket_id);
CREATE INDEX idx_attachments_ticket_id ON attachments(ticket_id);
