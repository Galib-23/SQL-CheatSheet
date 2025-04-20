-- Create tables
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    dob DATE
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    credits INT
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Sample Queries
-- Get GPA-like average by student
SELECT s.name, AVG(CASE 
                    WHEN grade = 'A' THEN 4
                    WHEN grade = 'B' THEN 3
                    WHEN grade = 'C' THEN 2
                    WHEN grade = 'D' THEN 1
                    ELSE 0
                  END) AS GPA
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.name;
