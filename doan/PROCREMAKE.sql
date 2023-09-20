select * from grade where studentid='st000002'

--lấy bảng điểm
select t.courseid,t.avg,credit
from 	(select courseid, max(avg) as avg
		from grade 
		where studentid='st000002'
		group by courseid) as t
		inner join course on t.courseID=course.courseID

--lấy thông tin tính gpa
select sum(f.avg*f.credit) as TongDiem,sum(f.credit) as TongTinChi
from
(select t.courseid,t.avg,credit
from 	(select courseid, max(avg) as avg
		from grade 
		where studentid='st000002'
		group by courseid) as t
		inner join course on t.courseID=course.courseID) as f


--câu này là lấy toàn bộ thông tin điểm của 1 sinh viên
select * from grade where studentid='st000002'
--Tạo 1 bảng điểm cho 1 sinh viên (Tính môn lớn điểm hơn )
go
CREATE PROCEDURE GetCourseAverages
    @studentID VARCHAR(10)
AS
BEGIN
    SELECT t.courseID, t.avg, c.credit
    INTO #tempTable
    FROM (
        SELECT courseID, MAX(avg) AS avg
        FROM grade
        WHERE studentID = @studentID
        GROUP BY courseID
    ) AS t
    INNER JOIN course AS c ON t.courseID = c.courseID
    SELECT * FROM #tempTable
    DROP TABLE #tempTable
END



--test
EXECUTE GetCourseAverages @studentID = 'st000002'


--tính gpa cho 1 sinh viên
go
CREATE PROCEDURE CalculateGPA
    @studentID VARCHAR(10)
AS
BEGIN
    DECLARE @TongDiem DECIMAL(10, 2)
    DECLARE @TongTinChi INT

    SELECT @TongDiem = SUM(f.avg * f.credit),
           @TongTinChi = SUM(f.credit)
    FROM (
        SELECT t.courseID, t.avg, c.credit
        FROM (
            SELECT courseID, MAX(avg) AS avg
            FROM grade
            WHERE studentID = @studentID
            GROUP BY courseID
        ) AS t
        INNER JOIN course AS c ON t.courseID = c.courseID
    ) AS f

    DECLARE @GPA DECIMAL(10, 2)
    SET @GPA = @TongDiem / @TongTinChi

    SELECT @GPA AS GPA
END

--test
EXECUTE CalculateGPA @studentID = 'st000002'


-----NUMBERS OF PASSED AND FAILED SUBJECT
go
CREATE PROC FAILED_PASSED_SUBJECT
    @studentID CHAR(8),
    @FAILED INT OUTPUT,
    @PASSED INT OUTPUT
AS
BEGIN
    IF @studentID IN (SELECT studentID
    FROM Grade) 
 BEGIN
    SELECT @FAILED = (SELECT COUNT(*)  
        FROM (
        SELECT t.courseID, t.avg, c.credit
        FROM (
            SELECT courseID, MAX(avg) AS avg
            FROM grade
            WHERE studentID = @studentID
            GROUP BY courseID
        ) AS t
        INNER JOIN course AS c ON t.courseID = c.courseID
    ) AS f WHERE f.avg < 5)
    SELECT @PASSED = (SELECT COUNT(*)  
        FROM (
        SELECT t.courseID, t.avg, c.credit
        FROM (
            SELECT courseID, MAX(avg) AS avg
            FROM grade
            WHERE studentID = @studentID
            GROUP BY courseID
        ) AS t
        INNER JOIN course AS c ON t.courseID = c.courseID
    ) AS f WHERE f.avg >= 5)
        PRINT 'STUDENT WITH ID: ' + @studentID + ' NUMBER OF FAILD SUBJECT: ' + CAST(@FAILED AS CHAR) + ' NUMBER OF PASSED SEBJECT ' + CAST(@PASSED AS CHAR)
    END 
 ELSE
 BEGIN
        PRINT 'CANT FIND STUDENT WITH ID: ' + @StudentID
    END
END

DROP PROC FAILED_PASSED_SUBJECT
GO
DECLARE @FAIL INT , @PASS INT
EXEC FAILED_PASSED_SUBJECT st000002 , @FAIL OUTPUT, @PASS OUTPUT


--------SUM CREDIT
GO
CREATE PROC Sum_credit
    @studentID CHAR(8),
    @SUMCREDIT INT OUTPUT
AS
BEGIN
    IF @studentID IN (SELECT studentID
    FROM Grade) 
 BEGIN
    SELECT @SUMCREDIT = (select SUM(credit)
    from (select courseid, max(avg) as avg
		from grade 
		where studentid='st000002'
		group by courseid) as t
		inner join course on t.courseID=course.courseID )
    PRINT 'STUDENT WITH ID: ' + @studentID + ' Number of credit: ' + CAST(@SUMCREDIT AS CHAR)
    END
    ELSE
    BEGIN
    PRINT 'CANT STUDENT WITH ID: ' + @studentID
    END
END 

DROP PROC Sum_Credit
GO
DECLARE @CREDIT INT
EXEC Sum_credit ST000002, @CREDIT OUTPUT 