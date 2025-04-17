ALTER TABLE event_types
    ADD CONSTRAINT IF NOT EXISTS unique_event_type_name UNIQUE (name);

ALTER TABLE player_roles
    ADD CONSTRAINT IF NOT EXISTS unique_player_role_name UNIQUE (name);

ALTER TABLE server_types
    ADD CONSTRAINT IF NOT EXISTS unique_server_type_name UNIQUE (name);

INSERT INTO event_types (name, description) VALUES
    ('CONNECT', 'Player connected to the server'),
    ('DISCONNECT', 'Player disconnected from the server'),
    ('SWITCH', 'Player switched servers'),
    ('REGISTER', 'Player registration'),
    ('COMMAND', 'Player executed a command')
ON CONFLICT (name) DO NOTHING;

INSERT INTO server_types (name, description) VALUES
    ('survival', 'Server used for survival mode'),
    ('creative', 'Server used for creative mode'),
    ('lobby', 'Server used for the lobby'),
    ('event', 'Server used for events'),
    ('minigame', 'Server used for minigames'),
    ('vanilla', 'Server used for vanilla mode'),
    ('default', 'Default server')
ON CONFLICT (name) DO NOTHING;

INSERT INTO player_roles (name, description, is_staff) VALUES
    ('Admin', 'Administrator with full permissions', TRUE),
    ('default', 'Regular player with basic permissions', FALSE)
ON CONFLICT (name) DO NOTHING;

INSERT INTO server (name,type) VALUES
    ('survival','survival'),
    ('lobby','lobby'),
    ('event','event')
ON CONFLICT (name) DO NOTHING;