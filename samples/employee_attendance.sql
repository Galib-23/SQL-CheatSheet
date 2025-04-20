-- Create tables
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department VARCHAR(100)
);

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    date DATE,
    status ENUM('Present', 'Absent', 'Leave'),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Sample Queries
-- Count present days for each employee
SELECT e.name, COUNT(*) AS present_days
FROM Employees e
JOIN Attendance a ON e.employee_id = a.employee_id
WHERE a.status = 'Present'
GROUP BY e.name;
