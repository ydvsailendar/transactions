CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    person_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    type VARCHAR(10) NOT NULL CHECK (type IN ('LEND', 'BORROW')),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 