-- Sample users (skip if users already exist in the shared database)
INSERT INTO users (user_id, username, git_handle, role) VALUES
('dev-lead@company.com',      'dev_lead',    'dev-lead',    'Developer'),
('designer@avivit.co.il',     'designer',    'designer-av', 'User'),
('cto@company.com',           'cto',         'cto-main',    'Admin'),
('user@example.com',          'saaravivi',   'saaravivi',   'Developer'),
('ai-engineer@company.com',   'ai_engineer', 'ai-eng',      'Developer'),
('devops@company.com',        'devops',      'devops-lead', 'Developer'),
('creative-dir@studio.com',   'creative_dir','creative-d',  'User')
ON CONFLICT DO NOTHING;

-- Sample tickets
INSERT INTO tickets (title, status, priority, creator_id, assignee_id, created_at, closed_at) VALUES
('Fix Docker Compose network isolation for backend services',
 'In Progress', 'High',
 'dev-lead@company.com', 'user@example.com',
 '2026-04-10 09:00:00', NULL),

('Implement Tailwind CSS UI kit for Avivit Insurance dashboard',
 'Review', 'Medium',
 'designer@avivit.co.il', 'user@example.com',
 '2026-04-11 14:30:00', NULL),

('Initial setup of RAG pipeline for documentation search',
 'Closed', 'Critical',
 'cto@company.com', 'ai-engineer@company.com',
 '2026-04-01 10:00:00', '2026-04-05 16:20:00'),

('Configure TypeScript strict mode and resolve linting errors',
 'Open', 'Low',
 'user@example.com', NULL,
 '2026-04-14 08:15:00', NULL),

('Debug MacBook connectivity issues with local Docker registry',
 'Closed', 'High',
 'user@example.com', 'devops@company.com',
 '2026-04-12 11:00:00', '2026-04-12 13:45:00'),

('Create archipelago fantasy map assets for world-building project',
 'Open', 'Low',
 'creative-dir@studio.com', 'user@example.com',
 '2026-04-14 12:00:00', NULL);
