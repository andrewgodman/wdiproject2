CREATE DATABASE sweatr;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  email VARCHAR(400),
  user_name VARCHAR(20),
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  password_digest VARCHAR(400)
);

CREATE TABLE group_activities(
  id SERIAL PRIMARY KEY, 
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  location VARCHAR(40),
  activity_organiser INTEGER,
  FOREIGN KEY (activity_organiser) REFERENCES users(id),
  category INTEGER,
  FOREIGN KEY (category) REFERENCES activity_categories(id)
);

CREATE TABLE activity_categories(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20)
);