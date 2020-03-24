-- +micrate Up
CREATE TABLE users(id INT PRIMARY KEY, email VARCHAR NOT NULL);

-- +micrate Down
DROP TABLE users;
