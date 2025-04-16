# All MySQL commands in one place.
It contains all the necessary commands to get started with mysql using shell to interact with the mysql database.

<br>
<br>

# User commands:

### Login
```bash
mysql -u root -p # root is the username here
```

### Show Users
```sql
SELECT User, Host FROM mysql.user;
```

### Create User
```sql
CREATE USER 'demouser'@'localhost' IDENTIFIED BY 'demopassword';
```

### Grant Privileges on all Databases
```sql
GRANT ALL PRIVILEGES ON * . * TO 'demouser'@'localhost';
FLUSH PRIVILEGES;
```

### Show Grants
```sql
SHOW GRANTS FOR 'demouser'@'localhost';
```

### Remove Grants
```sql
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'demouser'@'localhost';
```

### Delete User:
```sql
DROP USER 'demouser'@'localhost';
```

### Exit
```sql
exit;
```

<br>
<br>

# Databse Commands:

### Show Databases
```sql
SHOW DATABASES;
```

### Create Database
```sql
CREATE DATABASE mydb;
```

### Delete Database
```sql
DROP DATABASE mydb;
```

### Select Database
```sql
USE mydb;
```

<br>
<br>

# Table Commands:

### Create Table
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

### Show Tables
```sql
SHOW TABLES;
```

### Rename a table
```sql
RENAME TABLE employees TO workers;
```

### Delete Table
```sql
DROP TABLE user
```

<br>
<br>

# Column Commands

### Add new column (`ALTER` keyword)
```sql
ALTER TABLE users ADD age INT;
```

### Rename Column Name (`ALTER` keyword)
```sql
ALTER TABLE users
RENAME COLUMN is_admin TO role;
```

### `MODIFY` column (Data Type)
```sql
ALTER TABLE users
MODIFY COLUMN email VARCHAR(100);
```

### Move Columns/ Change order (`AFTER` keyword)
```sql
MODIFY email VARCHAR(100)
AFTER password;

-- TO move it to first
MODIFY email VARCHAR(100)
FIRST;
```

### Delete a column
```sql
ALTER TABLE users
DROP COLUMN last_name;
```
<br>
<br>

# Data Manipulation

### Insert Row / Record
```sql
INSERT INTO users (first_name, last_name, email, password, is_admin, register_date) values
('Steve', 'Rogers', 'steverog@gmail.com', '123456', 1, now()),
('Natasha', 'Romanoff', 1, now()),
('Tony', 'Stark', 'tonystark@gmail.com', '123456', 0, now());
```

### Insert into some columns:
```sql
INSERT INTO users (first_name, last_name, is_admin, register_date) values
('Natasha', 'Romanoff', 1, now());
-- These empty fields will be null
```

### Show All data
```sql
SELECT * FROM users;
```

### Show particular column
```sql
SELECT first_name, email FROM users;
```

### `WHERE`  Clause
```sql
SELECT * FROM users WHERE is_admin = 1;
SELECT * FROM users WHERE first_name = 'Steve';
SELECT * from users WHERE last_name = 'Stark' AND is_admin = 0;
SELECT * FROM user WHERE id != 1;
```

### `IS NULL` Keyword
```sql
SELECT * 
FROM users
WHERE email IS NULL;

-- Also can be used with NOT
SELECT * 
FROM users
WHERE email IS NOT NULL;
```

### `DELETE` Row
```sql
DELETE FROM users WHERE id = 2;

-- Removing WHERE will delete all rows
-- e.g
DELETE FROM uesrs;
```

### `UPDATE` Row
```sql
UPDATE users SET email = 'natasha@gmail.com' WHERE id = 3;
```

### Update multiple columns at once
```sql
UPDATE users
SET email = 'nat@gmail.com'
    password = 'nat1234'
WHERE id = 3;
```

### Set some fields equal to `NULL`
```sql
UPDATE users
SET password = NULL
```

### Set field of all rows.
```sql
UPDATE users
SET is_admin = 0; 
-- By just removing the where clause.
-- sets the value of all users' is_admin field = 0
```

<br>
<br>


# AUTOCOMMIT, COMMIT, ROLLBACK:

> What If you accidently delete all the rows by forgetting to put where clause. To avoid that shit, just put `AUTOCOMMIT=OFF` then after each __Transaction__ _(sequence of one or more SQL operations that are executed as a single logical unit of work)_ write `COMMIT` manually. Now If you forget to put where caluse and accidently delete all rows you can simply get all data back by writing `ROLLBACK`.

### Turn off autocommit:
```sql
SET AUTOCOMMIT = OFF;
```

### After each transaction `COMMIT`:
```sql
-- Let's say you entered some data at this point:
INSERT INTO users (first_name, last_name, email, password, is_admin, register_date) values
('Bruce', 'Banner', 'bruce.banner@gmail.com', '123456', 0, NOW()),
('Clint', 'Barton', 'clint.barton@gmail.com', '123456', 0, NOW());

-- Now Writing COMMIT creates a checkpoint here.
COMMIT;
-- assume it's -> CHECKPOINT 1.
-- Your progress is saved upto here.
```

### How to rollback:

1. Lets say STUPID you deleted all rows accidently🤦.

    ```sql
    DELETE FROM users;
    ```

2. Simply Write `ROLLBACK`. It will again set your progress upto the last checkpoint or last `COMMIT` you made. e. g. __CHECKPOINT 1__

    ```sql
    ROLLBACK;
    ```
3. Now check.:
    ```sql
    SELECT * FROM users;
    ```
4. You will see all operations are discarded that occurred after the last commit 💁. (e.g CHECKPOINT 1)


<br>
<br>

# Check current date and time:

### 1. Firstly lets create a table:
```sql
CREATE TABLE test(
    my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);
```
## 2. Insert currend date and time into the table:
```sql
INSERT INTO test
VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW());

-- show the data
SELECT * FROM test;
```

## 3. Manipulate date time:
```sql
INSERT INTO test
VALUES (CURRENT_DATE() + 1, CURRENT_TIME(), NOW());

-- CURRENT_DATE() + 1 means tomorrow here.
```


<br>
<br>

