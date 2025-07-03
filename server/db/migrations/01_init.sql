-- Users
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(30),
    password_hash TEXT
);

-- Events
CREATE TABLE IF NOT EXISTS events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150),
    datetime TIMESTAMP NOT NULL,
    location VARCHAR(255),
    created_by INTEGER REFERENCES users(id)
);

-- Event Attendance
CREATE TABLE IF NOT EXISTS event_attendance (
    event_id INTEGER REFERENCES events(id),
    user_id INTEGER REFERENCES users(id),
    rsvp_status VARCHAR(15),
    PRIMARY KEY (event_id, user_id)
);

-- Notifications
CREATE TABLE IF NOT EXISTS notifications (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    event_id INTEGER REFERENCES events(id),
    message TEXT,
    sent_at TIMESTAMP
);