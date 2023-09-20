CREATE database STUDENTMANAGEMENT;
USE STUDENTMANAGEMENT;
CREATE TABLE Student (
    studentID CHAR(8) PRIMARY KEY,
    name NVARCHAR(30) NOT NULL,
    dateOfBirth DATETIME NOT NULL,
    gender CHAR(1) NOT NULL,
    address NVARCHAR(100) NOT NULL,
    email NVARCHAR(50) NOT NULL,
    phoneNumber CHAR(10) NOT NULL,
    classID CHAR(8)
);
CREATE TABLE Lecturer (
  lecturerID CHAR(8) PRIMARY KEY,
  name NVARCHAR(30) NOT NULL,
  dateOfBirth DATETIME NOT NULL,
  gender CHAR(1) NOT NULL,
  address NVARCHAR(100) NOT NULL,
  email NVARCHAR(50) NOT NULL,
  phoneNumber CHAR(10) NOT NULL,
  facultyID CHAR(8) NOT NULL
);
CREATE TABLE AdminUser (
  staffID CHAR(8) PRIMARY KEY,
  name NVARCHAR(30) NOT NULL,
  dateOfBirth DATETIME NOT NULL,
  gender CHAR(1) NOT NULL,
  address NVARCHAR(100) NOT NULL,
  email NVARCHAR(50) NOT NULL,
  phoneNumber CHAR(10) NOT NULL,
  departmentID CHAR(8) NOT NULL
);
CREATE TABLE Course (
    courseID CHAR(8) PRIMARY KEY,
    courseName NVARCHAR(50) NOT NULL,
    facultyID CHAR(8) NOT NULL,
    credit INT NOT NULL,
    description text,
    previousCourse CHAR(8),
    followingCourse CHAR(8)
);
CREATE TABLE Grade (
  studentID CHAR(8) NOT NULL,
  courseID CHAR(8) NOT NULL,
  semester CHAR(16) NOT NULL,
  lecturerID CHAR(8) NOT NULL,
  process FLOAT NULL,
  mid float null,
  final float null,
  avg float null,
  PRIMARY KEY (studentID, courseID, semester),
  FOREIGN KEY (studentID) REFERENCES Student (studentID),
  FOREIGN KEY (courseID) REFERENCES Course (courseID),
  FOREIGN KEY (lecturerID) REFERENCES Lecturer (lecturerID)
);

CREATE TABLE Faculty (
    facultyID CHAR(8) PRIMARY KEY,
    facultyName NVARCHAR(100) NOT NULL,
    dean NVARCHAR(30) NOT NULL,
    numberOfLecturer INT  NULL,
    numberOfStudent INT  NULL
);
CREATE TABLE Classroom (
    classroomID CHAR(8) PRIMARY KEY
);
CREATE TABLE schedule (
  scheduleID varchar(8) NOT NULL,
  courseID CHAR(8) NOT NULL,
  day varchar(10) NOT NULL,
  time TIME NOT NULL,
  classroomID CHAR(8) NOT NULL,
  lecturerID char(8),
  semester char(15),
  PRIMARY KEY (scheduleID),
  foreign key (LECTURERID) REFERENCES LECTURER(LECTURERID),
  foreign key (courseid) references course(courseid),
  foreign key (classroomid) references classroom(classroomid)
);

CREATE TABLE student_schedule (
  studentID char(8),
  scheduleid varchar(8),
  primary key(studentid,scheduleid),
  foreign key (studentid) references student(studentid),
  foreign key (scheduleid) references schedule(scheduleid)
);
CREATE TABLE TestSchedule (
	scheduleID varchar(8),
    classroomID CHAR(8),
    Time DATETIME,
    CourseID CHAR(8),
    LecturerID Char(8),
    PRIMARY KEY (classroomID,time,scheduleid),
    FOREIGN KEY (CourseID) REFERENCES Course (courseID),
    FOREIGN KEY (classroomID) REFERENCES Classroom (classroomID),
    FOREIGN KEY (scheduleID) references schedule(scheduleid),
    FOREIGN KEY (lecturerID) references lecturer(lecturerid)
);
CREATE TABLE StudentClass (
    classID CHAR(8) PRIMARY KEY,
    academicYear int NOT NULL,
    numberOfStudent INT  NULL,
    lecturerID CHAR(8) NOT NULL,
    FOREIGN KEY (lecturerID) REFERENCES Lecturer(lecturerID)
);
CREATE TABLE Faculty_class(
	facultyID char(8),
    classID char(8),
    primary key (facultyid, classid),
    foreign key (facultyid) references faculty(facultyid),
    foreign key (classid) references studentclass(classid)
);
CREATE TABLE TuitionFee (
  TuitionFee NUMERIC,
  Status NVARCHAR(20),
  StudentID CHAR(8),
  sumcredit int,
  primary key (STUDENTID,TUITIONFEE),
  FOREIGN KEY (StudentID) REFERENCES Student (StudentID)
);

CREATE TABLE Course_register (
	studentID char(8),
    courseID CHAR(8),
    semester char(8),
    primary key(studentid, courseid),
    foreign key(studentid) references student(studentid),
    foreign key(courseid) references course(courseid)
);
CREATE TABLE Account (
   username VARCHAR(50) NOT NULL,
   password VARCHAR(256) NOT NULL,
   PRIMARY KEY (username)
);
ALTER TABLE STUDENT
ADD CONSTRAINT FK1 FOREIGN KEY (classID) REFERENCES StudentClass (classID);

ALTER TABLE LECTURER
ADD CONSTRAINT FK3 FOREIGN KEY (FACULTYID) REFERENCES FACULTY (FACULTYID);

ALTER TABLE COURSE
ADD CONSTRAINT FK5 FOREIGN KEY (FACULTYID) REFERENCES FACULTY (FACULTYID);

CREATE TABLE attendance(
	scheduleid varchar(8),
	status varchar(8) NOT NULL,
    FOREIGN KEY (SCHEDULEID) REFERENCES SCHEDULE(SCHEDULEID)
);

CREATE TABLE attendance_add(
	studentid char(8),
    scheduleid varchar(8),
    time datetime,
    note text,
    primary key(studentid,scheduleid),
    foreign key (studentid) references student(studentid),
	foreign key (scheduleid) references schedule(scheduleid)
);

--1
--trigger khi insert to schedule, sẽ tự động insert vào attendance status 'close'
--trong dự án giảng viên có thể điều chỉnh trạng thái open/close, khi open sinh viên 
--mới thấy form điểm danh, close thì ko, cái này sẽ gặp lại chỗ phân quyền
go
CREATE TRIGGER insert_attendance_trigger
ON schedule
AFTER INSERT
AS
BEGIN
    INSERT INTO attendance (scheduleid, status)
    SELECT inserted.scheduleid, 'close'
    FROM inserted;
END;

go
--2
--trigger tự động cập nhập numberOfLecturer trong bảng faculty khi insert new lecturer
CREATE TRIGGER update_numberOfLecturer
ON Lecturer
AFTER INSERT
AS
BEGIN
	UPDATE Faculty
	SET numberOfLecturer = (
	SELECT COUNT(lecturerID)
	FROM Lecturer
	WHERE facultyID = inserted.facultyID
	GROUP BY facultyID
	)
	FROM Faculty
	INNER JOIN inserted ON Faculty.facultyID = inserted.facultyID;
END;


--3
--trigger tự động cập nhập numberOfStudent trong bảng STUDENTCLASS khi insert new student
go
CREATE TRIGGER update_numberOfStudent
ON Student
AFTER INSERT
AS
BEGIN
	UPDATE StudentClass
	SET numberOfStudent = (
	SELECT COUNT(studentID)
	FROM Student
	WHERE classID = inserted.classID
	GROUP BY classID
	)
	FROM StudentClass
	INNER JOIN inserted ON StudentClass.classID = inserted.classID;
END;

--4
--trigger tự động cập nhập numberOfStudent trong bảng FACULTY khi insert new student
go
CREATE TRIGGER update_numberOfStudent_1
ON studentclass
AFTER UPDATE
AS
BEGIN
	UPDATE Faculty
	SET numberOfStudent = (
	SELECT SUM(s.numberOfStudent)
	FROM studentclass AS s
	INNER JOIN faculty_class AS fc ON s.classid = fc.classid
	GROUP BY fc.facultyid
	HAVING facultyID=Faculty.facultyID
	)
END;
--TRIGGER 1,2,3,4 ĐÃ TEST THÀNH CÔNG, DROP DATABASE TẠO LẠI KHI INSERT DATA THÌ TRIGGER ĐÃ THỰC THI THÀNH CÔNG


--5 TRIGGER TỰ ĐỘNG CẬP NHẬP ĐIỂM TRUNG BÌNH (CỘT AVG) THEO CÔNG THỨC 0.2*process+0.3*mid+0.5* final
--FOR INSERT
go
CREATE TRIGGER insert_avg
ON GRADE
AFTER INSERT
AS
BEGIN
	UPDATE g
	SET g.AVG = (i.process * 0.2) + (i.mid * 0.3) + (i.final * 0.5)
	FROM GRADE g
	INNER JOIN inserted i ON g.courseID=i.courseID and g.studentID=i.studentID and g.semester=i.semester
END;

--TEST, ĐÃ TEST OK
INSERT INTO Grade (studentID, courseID, semester, lecturerID, process, mid, final)
VALUES 
('ST000001', 'IT100', '2021.1', 'LT000001', 8.5, 6.75, 9.25);

--RESTORE
DELETE FROM GRADE WHERE STUDENTID='ST000001';

--DELETE TRIGGER
DROP TRIGGER insert_avg

--CHO UPDATE
go
CREATE TRIGGER update_avg
ON GRADE
AFTER UPDATE
AS
BEGIN
	UPDATE g
	SET g.AVG = (i.process * 0.2) + (i.mid * 0.3) + (i.final * 0.5)
	FROM GRADE g
	INNER JOIN inserted i ON g.courseID=i.courseID and g.studentID=i.studentID and g.semester=i.semester
END;

--TEST, ĐÃ TEST OK
INSERT INTO Grade (studentID, courseID, semester, lecturerID, process, mid, final)
VALUES 
('ST000001', 'IT100', '2021.1', 'LT000001', 8.5, 6.75, 9.25);

UPDATE Grade
SET PROCESS=5.5
WHERE STUDENTID='ST000001' AND COURSEID='IT100' AND SEMESTER='2021.1'
--RESTORE
DELETE FROM GRADE WHERE STUDENTID='ST000001';

--DELETE TRIGGER
DROP TRIGGER update_avg
--TRIGGER 1,2,3,4 ĐÃ TEST THÀNH CÔNG, DROP DATABASE TẠO LẠI KHI INSERT DATA THÌ SẼ TRIGGER ĐÃ THỰC THI THÀNH CÔNG
--5
--trigger ràng buộc điểm số trong 0-10, for insert
go
CREATE TRIGGER check_grade_range
ON Grade
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @InvalidGradeMessage NVARCHAR(100);
    IF EXISTS(SELECT 1 FROM inserted WHERE [process] < 0 OR [process] > 10)
    BEGIN
        SET @InvalidGradeMessage = 'Invalid process grade';
        RAISERROR (@InvalidGradeMessage, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
    IF EXISTS(SELECT 1 FROM inserted WHERE mid < 0 OR mid > 10)
    BEGIN
        SET @InvalidGradeMessage = 'Invalid mid grade';
        RAISERROR (@InvalidGradeMessage, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
    IF EXISTS(SELECT 1 FROM inserted WHERE final < 0 OR final > 10)
    BEGIN
        SET @InvalidGradeMessage = 'Invalid final grade';
        RAISERROR (@InvalidGradeMessage, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Nếu tất cả các điều kiện đều hợp lệ, chèn dữ liệu vào bảng
    INSERT INTO Grade
    SELECT *
    FROM inserted;
END;

--TEST, ĐÃ TEST OK
INSERT INTO grade (studentID, courseID, semester, lecturerID, process, mid, final) 
VALUES ('ST000002', 'CS115', '2023.2', 'lt000001', '15.0', '1.0', '4.0');

INSERT INTO grade (studentID, courseID, semester, lecturerID, process, mid, final)
VALUES ('ST000002', 'IT101', '2021.2', 'LT000025', '4.5', '9.7', '7.1');

--RESTORE
DELETE FROM GRADE WHERE STUDENTID='ST000002' AND (COURSEID='CS115' OR COURSEID='IT101')

--DELETE TRIGGER
DROP TRIGGER CHECK_GRADE_RANGE


--trigger ràng buộc điểm số trong 0-10, for update
go
CREATE TRIGGER check_grade_range_update
ON Grade
INSTEAD OF UPDATE
AS
BEGIN
    DECLARE @InvalidGradeMessage NVARCHAR(100);

    IF EXISTS(SELECT 1 FROM inserted WHERE [process] < 0 OR [process] > 10)
    BEGIN
        SET @InvalidGradeMessage = 'Invalid process grade';
        RAISERROR (@InvalidGradeMessage, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    IF EXISTS(SELECT 1 FROM inserted WHERE mid < 0 OR mid > 10)
    BEGIN
        SET @InvalidGradeMessage = 'Invalid mid grade';
        RAISERROR (@InvalidGradeMessage, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    IF EXISTS(SELECT 1 FROM inserted WHERE final < 0 OR final > 10)
    BEGIN
        SET @InvalidGradeMessage = 'Invalid final grade';
        RAISERROR (@InvalidGradeMessage, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Nếu tất cả các điều kiện đều hợp lệ, cập nhật dữ liệu trong bảng
    UPDATE Grade
    SET process = inserted.process,
        mid = inserted.mid,
        final = inserted.final
    FROM Grade
    INNER JOIN inserted ON Grade.studentID = inserted.studentID AND inserted.courseID=grade.courseID and inserted.semester=grade.semester;
END;

--TEST, ĐÃ TEST OK
INSERT INTO grade VALUES ('ST000002', 'IT101', '2021.2', 'LT000025', '4.5', '9.7', '7.1', '7.36');

UPDATE GRADE
SET PROCESS=12
WHERE STUDENTID='ST000002' AND COURSEID='IT101' AND SEMESTER='2021.2'
--RESTORE
DELETE FROM GRADE WHERE STUDENTID='ST000002' AND (COURSEID='CS115' OR COURSEID='IT101')

--DELETE TRIGGER
DROP TRIGGER CHECK_GRADE_RANGE_UPDATE

--6
--trigger tự động cập nhập bảng tuitionfee theo bảng register_course. giả sử 1 tín chỉ là 400k, for insert
go
CREATE TRIGGER insert_course_register
ON course_register
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM TUITIONFEE WHERE STUDENTID = (SELECT STUDENTID FROM inserted)) 
    BEGIN
        UPDATE TUITIONFEE
        SET TUITIONFEE = TUITIONFEE + (400000 * (SELECT CREDIT FROM COURSE WHERE COURSEID = (SELECT COURSEID FROM inserted))),
            sumcredit = sumcredit + (SELECT CREDIT FROM COURSE WHERE COURSEID = (SELECT COURSEID FROM inserted))
        WHERE STUDENTID = (SELECT STUDENTID FROM inserted);
    END
    ELSE
    BEGIN
        INSERT INTO TuitionFee (TuitionFee, Status, StudentID, sumcredit)
        SELECT (400000 * (SELECT CREDIT FROM COURSE WHERE COURSEID = (SELECT COURSEID FROM inserted))),
            'unpaid',
            (SELECT STUDENTID FROM inserted),
            (SELECT CREDIT FROM COURSE WHERE COURSEID = (SELECT COURSEID FROM inserted))
        FROM inserted
        INNER JOIN Course ON inserted.CourseID = Course.CourseID;
    END
END;
--TEST, TEST CẢ CHO TRIGGER DELETE PHÍA DƯỚI, ĐÃ TEST OK
INSERT INTO Course_register VALUES ('ST000001','CS101','2023.2')
INSERT INTO Course_register VALUES ('ST000001','CS102','2023.2')
INSERT INTO Course_register VALUES ('ST000001','CS103','2023.2')

--RESTORE
DELETE FROM Course_register WHERE studentID='ST000001' AND COURSEID='CS101'
DELETE FROM Course_register WHERE studentID='ST000001' AND COURSEID='CS102'
DELETE FROM Course_register WHERE studentID='ST000001' AND COURSEID='CS103'

DELETE FROM TuitionFee WHERE STUDENTID='ST000001'
--DELETE TRIGGER
DROP TRIGGER insert_course_register

--trigger tự động cập nhập bảng tuitionfee theo bảng register_course. giả sử 1 tín chỉ là 400k, for delete
go
CREATE TRIGGER delete_course_register
ON course_register
AFTER DELETE
AS
BEGIN
    UPDATE TUITIONFEE
    SET TUITIONFEE = TUITIONFEE - (400000 * c.CREDIT),
        sumcredit = sumcredit - c.CREDIT
    FROM TUITIONFEE
    JOIN deleted d ON TUITIONFEE.STUDENTID = d.STUDENTID
    JOIN COURSE c ON d.COURSEID = c.COURSEID;
END;
--DELETE TRIGGER
DROP TRIGGER delete_course_register


--7
--trigger ràng buộc môn học trước. Nếu insert vào bảng course_register (đăng kí học phần)
--sinh viên cần học qua môn học trước (có môn học đó trong bảng grade)
go
CREATE TRIGGER check_previous_course
ON course_register
AFTER INSERT
AS
BEGIN
    DECLARE @previous_course CHAR(8);
    SET @previous_course = (
        SELECT DISTINCT previouscourse
        FROM course
        WHERE courseid = (SELECT courseid FROM inserted)
    );
    IF @previous_course IS NOT NULL AND NOT EXISTS (
        SELECT courseid
        FROM grade
        WHERE studentid = (SELECT studentid FROM inserted)
		AND courseID=@previous_course
    )
    BEGIN
        RAISERROR ('Lỗi môn học trước', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
--TEST, 
INSERT INTO Course_register VALUES ('ST000001','CS101','2023.2') --KHÔNG MÔN HỌC TRƯỚC
INSERT INTO Course_register VALUES ('ST000001','CS102','2023.2') --KHÔNG MÔN HỌC TRƯỚC
INSERT INTO Course_register VALUES ('ST000001','CS113','2023.2') --CÓ MÔN HỌC TRƯỚC
--RESTORE
DELETE FROM Course_register WHERE studentID='ST000001' AND COURSEID='CS101' 
DELETE FROM Course_register WHERE studentID='ST000001' AND COURSEID='CS102' 
DELETE FROM Course_register WHERE studentID='ST000001' AND COURSEID='CS113'

--DELETE TRIGGER
DROP TRIGGER check_previous_course