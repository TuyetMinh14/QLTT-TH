
-------procedure tính gpa
CREATE PROCEDURE GPA
    @StudentID char(8),
    @GPA float OUTPUT
AS
BEGIN
    IF @StudentID IN (SELECT studentID
    FROM Student)
    BEGIN
        SELECT @GPA = (SELECT AVG(avg)
            FROM GRADE
            WHERE studentID = @StudentID
            GROUP BY studentID)
        PRINT ' STUDENT WITH ID: ' + @StudentID + ' GPA: ' + CAST(@GPA AS CHAR)
    END
    ELSE 
    BEGIN
        PRINT 'CANT FIND STUDENT WITH ID: ' + @StudentID
        RETURN 0
    END
END

drop proc GPA
----- test
INSERT INTO grade
VALUES
    ('ST000001', 'IT101', '2021.2', 'LT000025', '4.5', '9.7', '7.1', '7.36');

GO
DECLARE  @OUTPUT FLOAT
EXEC GPA ST000004 , @OUTPUT OUTPUT



---delete 
DELETE FROM grade WHERE studentID = 'ST000001' AND CourseID = 'IT101'   



-------------FAILD AND NOT FAILED
GO
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
            FROM GRADE
            WHERE studentID = @studentID AND avg < 5)
        SELECT @PASSED = (SELECT COUNT(*)
            FROM GRADE
            WHERE studentID = @studentID AND avg >= 5)
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
EXEC FAILED_PASSED_SUBJECT ST000004, @FAIL OUTPUT, @PASS OUTPUT



----PROC TÍN CHỈ TÍCH LUỶ

GO
CREATE PROC COUNT_CREDIT
    @studentID CHAR(8),
    @SUMCREDIT INT OUTPUT
AS
BEGIN
    IF @studentID IN (SELECT studentID
    FROM Grade) 
 BEGIN
    SELECT @SUMCREDIT = (SELECT SUM(credit) FROM Grade gr, Course co where gr.courseID = co.courseID and gr.studentID = @studentID AND gr.[avg] >= 5)
    PRINT 'STUDENT WITH ID: ' + @studentID + ' Number of credit: ' + CAST(@SUMCREDIT AS CHAR)
    END
    ELSE
    BEGIN
    PRINT 'CANT STUDENT WITH ID: ' + @studentID
    END
END 

DROP PROC COUNT_CREDIT
GO
DECLARE @CREDIT INT
EXEC COUNT_CREDIT ST000001, @CREDIT OUTPUT 

