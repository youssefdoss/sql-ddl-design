-- CREATE TABLE departments (
--     department TEXT PRIMARY KEY
-- );

-- CREATE TABLE employees (
--     id SERIAL PRIMARY KEY,
--     name TEXT NOT NULL,
--     status TEXT NOT NULL
--         CHECK (status = 'full time' OR status = 'part time'),
--     months_at_job INT NOT NULL DEFAULT 0,
--     department TEXT NOT NULL REFERENCES departments,
--     manager INT REFERENCES employees
-- );

SELECT id, name, manager
    FROM employees
    JOIN employees ON employees.id = employees.id
