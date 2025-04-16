# All MySQL commands in one place.
It contains all the necessary commands to get started with mysql using shell to interact with the mysql database.

<br>
<br>

# User commands:

## Login
```bash
mysql -u root -p # root is the username here
```

## Show Users
```sql
SELECT User, Host FROM mysql.user;
```

## Create User
```sql
CREATE USER 'demouser'@'localhost' IDENTIFIED BY 'demopassword';
```

### Grant Privileges on all Databases
```sql
GRANT ALL PRIVILEGES ON * . * TO 'demouser'@'localhost';
FLUSH PRIVILEGES;
```

## Show Grants
```sql
SHOW GRANTS FOR 'demouser'@'localhost';
```

## Remove Grants
```sql
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'demouser'@'localhost';
```

## Delete User:
```sql
DROP USER 'demouser'@'localhost';
```

## Exit
```sql
exit;
```

<br>
<br>

# Databse Commands:

## Show Databases
```sql
SHOW DATABASES;
```

## Create Database
```sql
CREATE DATABASE mydb;
```

## Delete Database
```sql
DROP DATABASE mydb;
```

## Select Database
```sql
USE mydb;
```

## Create Table
```sql
CREATE TABLE user(
  id INT AUTO_INCREMENT,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(50),
  password VARCHAR(20),
  is_admin TINYINT(1),
  register_date DATETIME,
  PRIMARY KEY(id)
);
```

## Delete Table
```sql
DROP TABLE user
```

## Show Tables
```sql
SHOW TABLES;
```

## Insert Row / Record
```sql
INSERT INTO users (first_name, last_name, email, password, is_admin, register_date) values
('Steve', 'Rogers', 'steverog@gmail.com', '123456', 1, now()),
('Tony', 'Stark', 'tonystark@gmail.com', '123456', 0, now());
```

## Show All data
```sql
SELECT * FROM users;
```

## Show particular column
```sql
SELECT first_name, email FROM users;
```

## `WHERE`  Clause
```sql
SELECT * FROM users WHERE is_admin = 1;
SELECT * FROM users WHERE first_name = 'Steve';
SELECT * from users WHERE last_name = 'Stark' AND is_admin = 0;
```

## `DELETE` Row
```sql
DELETE FROM users WHERE id = 2;
```

## `UPDATE` Row
```sql
UPDATE users SET email = 'steverogers2@gmail.com' WHERE id = 1;
```

## Add new column
```sql
ALTER TABLE users ADD age INT;
```

## 