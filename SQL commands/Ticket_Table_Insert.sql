INSERT INTO tickets (ticket_id, title, status, priority, creator_id, assignee_id, created_at, closed_at)
VALUES 
('TKT-001', 'Fix Docker Compose network isolation for backend services', 'In Progress', 'High', 'dev-lead@company.com', 'user@example.com', '2026-04-10 09:00:00', NULL),

('TKT-002', 'Implement Tailwind CSS UI kit for Avivit Insurance dashboard', 'Review', 'Medium', 'designer@avivit.co.il', 'user@example.com', '2026-04-11 14:30:00', NULL),

('TKT-003', 'Initial setup of RAG pipeline for documentation search', 'Closed', 'Critical', 'cto@company.com', 'ai-engineer@company.com', '2026-04-01 10:00:00', '2026-04-05 16:20:00'),

('TKT-004', 'Configure TypeScript strict mode and resolve linting errors', 'Open', 'Low', 'user@example.com', NULL, '2026-04-14 08:15:00', NULL),

('TKT-005', 'Debug MacBook connectivity issues with local Docker registry', 'Closed', 'High', 'user@example.com', 'devops@company.com', '2026-04-12 11:00:00', '2026-04-12 13:45:00'),

('TKT-006', 'Create archipelago fantasy map assets for world-building project', 'Open', 'Low', 'creative-dir@studio.com', 'user@example.com', '2026-04-14 12:00:00', NULL);