INSERT INTO event_types (name, description) VALUES
    ('FIRST_JOIN', 'Player joined for first time')
ON CONFLICT (name) DO NOTHING;