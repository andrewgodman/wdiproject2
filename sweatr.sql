CREATE DATABASE sweatr;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    email VARCHAR(400),
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    password_digest VARCHAR(400)
);