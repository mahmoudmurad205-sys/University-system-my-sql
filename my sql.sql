-- إنشاء قاعدة البيانات coursesإذا لم تكن موجودة
CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;

-- حذف الجداول إذا كانت موجودة مسبقًا (بالترتيب الصحيح لتجنب مشاكل القيود المرجعية)
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Professors;
DROP TABLE IF EXISTS Departments;

-- إنشاء جدول الأقسام
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Budget DECIMAL(15, 2) NOT NULL
);

-- إنشاء جدول الأساتذة
CREATE TABLE Professors (
    Professor_ID INT PRIMARY KEY,
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255) NOT NULL,
    Department_ID INT NOT NULL,
    Email VARCHAR(255),
    Phone VARCHAR(20),
    CONSTRAINT FK_Professor_Department FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

-- إنشاء جدول الطلاب
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Department_ID INT NOT NULL,
    CONSTRAINT FK_Student_Department FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

-- إنشاء جدول الدورات الدراسية
CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Credits INT NOT NULL,
    Department_ID INT NOT NULL,
    Professor_ID INT NOT NULL,
    CONSTRAINT FK_Course_Department FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
    CONSTRAINT FK_Course_Professor FOREIGN KEY (Professor_ID) REFERENCES Professors(Professor_ID)
);

-- إنشاء جدول التسجيلات
CREATE TABLE Enrollments (
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    Enrollment_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (Student_ID, Course_ID),
    CONSTRAINT FK_Enrollment_Student FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    CONSTRAINT FK_Enrollment_Course FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

-- إدخال بيانات الأقسام
INSERT INTO Departments VALUES (1, 'Computer Science', 500000);
INSERT INTO Departments VALUES (2, 'Electrical Engineering', 450000);
INSERT INTO Departments VALUES (3, 'Mechanical Engineering', 400000);

-- إدخال بيانات الأساتذة (تم تعديل الأسماء)
INSERT INTO Professors VALUES (1, 'Samer', 'Swailah', 1, 'samer.swailah@university.edu', '+1234567890');
INSERT INTO Professors VALUES (2, 'Majd', 'Sameer', 2, 'majd.sameer@university.edu', '+1234567891');
INSERT INTO Professors VALUES (3, 'Khaled', 'Mohammad', 3, 'khaled.mohammad@university.edu', '+1234567892');

-- إدخال بيانات الطلاب (تم تعديل الأسماء)
INSERT INTO Students VALUES (1, 'Mahmoud', 'Mohammad', 'mahmoud.mohammad@university.edu', '+1234567893', 1);
INSERT INTO Students VALUES (2, 'Mohammad', 'Allan', 'mohammad.allan@university.edu', '+1234567894', 2);
INSERT INTO Students VALUES (3, 'Salem', 'Saeed', 'salem.saeed@university.edu', '+1234567895', 3);

-- إدخال بيانات الدورات الدراسية
INSERT INTO Courses VALUES (1, 'Introduction to Programming', 3, 1, 1);
INSERT INTO Courses VALUES (2, 'Data Structures', 4, 1, 1);
INSERT INTO Courses VALUES (3, 'Circuit Analysis', 3, 2, 2);
INSERT INTO Courses VALUES (4, 'Thermodynamics', 3, 3, 3);

-- إدخال بيانات التسجيلات
INSERT INTO Enrollments VALUES (1, 1, CURRENT_TIMESTAMP, 90);
INSERT INTO Enrollments VALUES (1, 2, CURRENT_TIMESTAMP, 85);
INSERT INTO Enrollments VALUES (2, 3, CURRENT_TIMESTAMP, 88);
INSERT INTO Enrollments VALUES (3, 4, CURRENT_TIMESTAMP, 92);













