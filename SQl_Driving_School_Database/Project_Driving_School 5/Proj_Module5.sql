CREATE DATABASE IF NOT EXISTS projects_glassglow_drivingschool;
USE projects_glassglow_drivingschool;

CREATE TABLE IF NOT EXISTS Office (
    Office_ID INT PRIMARY KEY NOT NULL,
    Location VARCHAR(45) NOT NULL,
    Department VARCHAR(45) NOT NULL,
    No_of_Employee INT,
    UNIQUE INDEX Office_ID_UNIQUE (Office_ID) VISIBLE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Employee (
    EmployeeID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(45) NOT NULL,
    DOB DATE NOT NULL,
    apartmentNo VARCHAR(10),
    city VARCHAR(45),
    country VARCHAR(45),
    Position VARCHAR(45),
    OfficeID INT NOT NULL,
    FOREIGN KEY (OfficeID) REFERENCES Office (Office_ID),
    UNIQUE INDEX EmployeeID_UNIQUE (EmployeeID) VISIBLE,
    INDEX fk_Employee_Office_idx (OfficeID) VISIBLE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Student (
    StudentID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(45) NOT NULL,
    LastName VARCHAR(45) NOT NULL,
    DOB DATE NOT NULL,
    ContactNo VARCHAR(15),
    Email VARCHAR(45),
    Sex CHAR(1),
    apartmentNo VARCHAR(10),
    city VARCHAR(45),
    country VARCHAR(45),
    OfficeID INT NOT NULL,
    FOREIGN KEY (OfficeID) REFERENCES Office (Office_ID),
    UNIQUE INDEX StudentID_UNIQUE (StudentID) VISIBLE,
    INDEX fk_Student_Office_idx (OfficeID) VISIBLE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Instructor (
    InstructorID INT PRIMARY KEY NOT NULL,
    EmployeeID INT NOT NULL,
    FirstName VARCHAR(45) NOT NULL,
    LastName VARCHAR(45) NOT NULL,
    apartmentNo VARCHAR(10),
    city VARCHAR(45),
    country VARCHAR(45),
    VehicleID INT NOT NULL,
    Sex CHAR(1),
    Availability VARCHAR(45),
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle (VehicleID),
    UNIQUE INDEX InstructorID_UNIQUE (InstructorID) VISIBLE,
    INDEX fk_Instructor_Employee_idx (EmployeeID) VISIBLE,
    INDEX fk_Instructor_Vehicle_idx (VehicleID) VISIBLE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Course (
    CourseID INT PRIMARY KEY NOT NULL,
    CourseName VARCHAR(45) NOT NULL,
    InstructorID INT NOT NULL,
    StudentID INT NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Duration INT,
    Level VARCHAR(45),
    FOREIGN KEY (InstructorID) REFERENCES Instructor (InstructorID),
    FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
    UNIQUE INDEX CourseID_UNIQUE (CourseID) VISIBLE,
    INDEX fk_Course_Instructor_idx (InstructorID) VISIBLE,
    INDEX fk_Course_Student_idx (StudentID) VISIBLE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Vehicle (
    VehicleID INT PRIMARY KEY NOT NULL,
    VehicleMake VARCHAR(45),
    VehicleType VARCHAR(45),
    Model VARCHAR(45),
    Year YEAR,
    OfficeID INT NOT NULL,
    FOREIGN KEY (OfficeID) REFERENCES Office (Office_ID),
    UNIQUE INDEX VehicleID_UNIQUE (VehicleID) VISIBLE,
    INDEX fk_Vehicle_Office_idx (OfficeID) VISIBLE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Maintenance (
    VehicleID INT PRIMARY KEY NOT NULL,
    VehicleType VARCHAR(45),
    Date DATE,
    ServiceType VARCHAR(45),
    Cost DECIMAL(10,2),
    NextScheduleMaintenance DATE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle (VehicleID),
    UNIQUE INDEX VehicleID_UNIQUE (VehicleID) VISIBLE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Payment (
    PaymentID INT PRIMARY KEY NOT NULL,
    Payment_Date DATE,
    Nameofstudent VARCHAR(45),
    Amount DECIMAL(10,2),
    Email VARCHAR(45),
    StudentID INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
    UNIQUE INDEX PaymentID_UNIQUE (PaymentID) VISIBLE,
    INDEX fk_Payment_Student_idx (StudentID) VISIBLE
) ENGINE=InnoDB;

-- Insert data into Office table
INSERT INTO Office (Office_ID, Location, Department, No_of_Employee) VALUES
(1, 'Main Street', 'Administration', 10),
(2, 'West Avenue', 'Marketing', 8),
(3, 'East Street', 'Operations', 15),
(4, 'North Boulevard', 'Human Resources', 6),
(5, 'South Square', 'Finance', 12);

-- Insert data into Employee table
INSERT INTO Employee (EmployeeID, Name, DOB, apartmentNo, city, country, Position, OfficeID) VALUES
(101, 'John Doe', '1985-05-20', 'Apt 101', 'Scotland', 'UK', 'Manager', 1),
(102, 'Jane Smith', '1990-09-15', 'Apt 202', 'Scotland', 'UK', 'Assistant Manager', 2),
(103, 'Michael Johnson', '1988-03-10', 'Apt 303', 'Scotland', 'UK', 'Coordinator', 3),
(104, 'Emily Brown', '1995-07-08', 'Apt 404', 'Scotland', 'UK', 'Marketing Executive', 4),
(105, 'David Williams', '1983-12-25', 'Apt 505', 'Scotland', 'UK', 'Operations Manager', 5);

-- Insert data into Student table
INSERT INTO Student (StudentID, FirstName, LastName, DOB, ContactNo, Email, Sex, apartmentNo, city, country, OfficeID) VALUES
(201, 'Emma', 'Johnson', '2000-01-15', '123-456-7890', 'emma@example.com', 'F', 'Apt 10', 'Scotland', 'UK', 1),
(202, 'James', 'Miller', '1998-08-20', '987-654-3210', 'james@example.com', 'M', 'Apt 20', 'Scotland', 'UK', 2),
(203, 'Olivia', 'Brown', '2001-05-05', '456-789-0123', 'olivia@example.com', 'F', 'Apt 30', 'Scotland', 'UK', 3),
(204, 'William', 'Davis', '1999-11-10', '789-012-3456', 'william@example.com', 'M', 'Apt 40', 'Scotland', 'UK', 4),
(205, 'Sophia', 'Wilson', '2002-02-28', '321-654-9870', 'sophia@example.com', 'F', 'Apt 50', 'Scotland', 'UK', 5);

-- Insert data into Instructor table
INSERT INTO Instructor (InstructorID, EmployeeID, FirstName, LastName, apartmentNo, city, country, VehicleID, Sex, Availability) VALUES
(301, 101, 'Robert', 'Taylor', 'Apt 1A', 'Scotland', 'UK', 501, 'M', 'Full-time'),
(302, 102, 'Lisa', 'Johnson', 'Apt 2B', 'Scotland', 'UK', 502, 'F', 'Part-time'),
(303, 103, 'Christopher', 'Clark', 'Apt 3C', 'Scotland', 'UK', 503, 'M', 'Full-time'),
(304, 104, 'Megan', 'Martinez', 'Apt 4D', 'Scotland', 'UK', 504, 'F', 'Full-time'),
(305, 105, 'Ryan', 'Rodriguez', 'Apt 5E', 'Scotland', 'UK', 505, 'M', 'Part-time');

-- Insert data into Course table
INSERT INTO Course (CourseID, CourseName, InstructorID, StudentID, StartDate, EndDate, Duration, Level) VALUES
(401, 'Beginner Driving Course', 301, 201, '2024-05-01', '2024-05-30', 30, 'Beginner'),
(402, 'Advanced Driving Course', 302, 202, '2024-06-01', '2024-06-30', 30, 'Advanced'),
(403, 'Defensive Driving Course', 303, 203, '2024-07-01', '2024-07-30', 30, 'Intermediate'),
(404, 'City Driving Course', 304, 204, '2024-08-01', '2024-08-30', 30, 'Intermediate'),
(405, 'Highway Driving Course', 305, 205, '2024-09-01', '2024-09-30', 30, 'Advanced');

-- Insert data into Vehicle table
INSERT INTO Vehicle (VehicleID, VehicleMake, VehicleType, Model, Year, OfficeID) VALUES
(501, 'Toyota', 'Sedan', 'Camry', 2023, 1),
(502, 'Honda', 'SUV', 'CR-V', 2022, 2),
(503, 'Ford', 'Truck', 'F-150', 2021, 3),
(504, 'Chevrolet', 'Hatchback', 'Spark', 2024, 4),
(505, 'BMW', 'Convertible', 'Z4', 2023, 5);

-- Insert data into Maintenance table
INSERT INTO Maintenance (VehicleID, VehicleType, Date, ServiceType, Cost, NextScheduleMaintenance) VALUES
(501, 'Sedan', '2024-03-15', 'Regular Checkup', 100.00, '2024-09-15'),
(502, 'SUV', '2024-02-20', 'Oil Change', 80.50, '2024-08-20'),
(503, 'Truck', '2024-01-10', 'Brake Inspection', 120.75, '2024-07-10'),
(504, 'Hatchback', '2024-04-05', 'Tire Rotation', 65.00, '2024-10-05'),
(505, 'Convertible', '2024-05-20', 'Full Service', 150.00, '2024-11-20');

-- Insert data into Payment table
INSERT INTO Payment (PaymentID, Payment_Date, Nameofstudent, Amount, Email, StudentID) VALUES
(601, '2024-05-05', 'Emma Johnson', 200.00, 'emma@example.com', 201),
(602, '2024-06-10', 'James Miller', 250.00, 'james@example.com', 202),
(603, '2024-07-15', 'Olivia Brown', 220.00, 'olivia@example.com', 203),
(604, '2024-08-20', 'William Davis', 180.00, 'william@example.com', 204),
(605, '2024-09-25', 'Sophia Wilson', 300.00, 'sophia@example.com', 205);

select * from Office;
select * from Employee;
select* from Student;
select * from Instructor;
select* from Course;
select*from Vehicle;
select* from Maintenance;
select*from Payment;

--  the total number of students per instructor
SELECT Instructor.FirstName, Instructor.LastName, COUNT(Student.StudentID) AS NumberOfStudents
FROM Instructor
JOIN Course ON Instructor.InstructorID = Course.InstructorID
JOIN Student ON Course.StudentID = Student.StudentID
GROUP BY Instructor.InstructorID;

-- employee who are also instructor
SELECT Employee.Name
FROM Employee
JOIN Instructor ON Employee.EmployeeID = Instructor.EmployeeID;

-- Find the total payment received from each student:
SELECT Student.FirstName, Student.LastName, SUM(Payment.Amount) AS TotalPayment
FROM Student
JOIN Payment ON Student.StudentID = Payment.StudentID
GROUP BY Student.StudentID;

-- Find the instructors who are available full-time and have a vehicle of type ‘Sedan’
SELECT Instructor.FirstName, Instructor.LastName
FROM Instructor
JOIN Vehicle ON Instructor.VehicleID = Vehicle.VehicleID
WHERE Instructor.Availability = 'Full-time' AND Vehicle.VehicleType = 'Sedan';


-- Find the students who are older than 25 years
SELECT Student.FirstName, Student.LastName
FROM Student
WHERE YEAR(CURDATE()) - YEAR(Student.DOB) > 25;




