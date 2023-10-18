-- DATABASE --
DROP DATABASE IF EXISTS BTVN_MySQL_2;
CREATE DATABASE BTVN_MySQL_2;
USE BTVN_MySQL_2;

-- TABLE --
DROP TABLE IF EXISTS Department;
CREATE TABLE Department
(
	DepartmentID TINYINT PRIMARY KEY,
    DepartName NVARCHAR(50) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS Position;
CREATE TABLE Position
(
	PositionID TINYINT PRIMARY KEY,
    PositionName NVARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS Account_table;
CREATE TABLE Account_table
(
	PRIMARY KEY (AccountID),
	AccountID TINYINT,
    Email VARCHAR(50),
    Username VARCHAR(30) NOT NULL UNIQUE,
    FullName NVARCHAR(30) NOT NULL,
    DepartmentID TINYINT,
    PositionID TINYINT,
    CreateDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES Position (PositionID)
);

DROP TABLE IF EXISTS GroupTable;
CREATE TABLE GroupTable
(
	GroupID TINYINT PRIMARY KEY,
    GroupName VARCHAR(30) NOT NULL,
    CreateID TINYINT,
    CreateDate DATE
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount
(
	GroupID TINYINT,
    AccountID TINYINT,
	JoinDate DATE,
	FOREIGN KEY (GroupID) REFERENCES GroupTable(GroupID),
    FOREIGN KEY (AccountID) REFERENCES Account_table (AccountID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion
(
	TypeID TINYINT PRIMARY KEY,
    TypeName VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion
(
	CategoryID TINYINT PRIMARY KEY,
    CategorName VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question
(
	QuestionID TINYINT PRIMARY KEY,
    Content NVARCHAR(800) NOT NULL,
    CategoryID TINYINT,
    TypeID TINYINT,
	CreatorID TINYINT UNIQUE,
    CreateDate DATE,
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer
(
	AnswerID TINYINT PRIMARY KEY,
    Content NVARCHAR(800),
    QuestionID TINYINT,
    isCorrect ENUM ('true', 'false'),
	FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam
(
	ExamID TINYINT PRIMARY KEY,
    Code SMALLINT,
    Title NVARCHAR(50),
    CategoryID TINYINT,
    Duration TINYINT,
    CreatorID SMALLINT UNIQUE,
    CreateDate DATE,
	FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion
(
	ExamID TINYINT,
	QuestionID TINYINT,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
	FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

-- INSERT --
INSERT INTO Department 
VALUES 
			(1, N'Accouting'),
            (2, N'Audit'),
            (3, N'Sales'),
            (4, N'HR'),
            (5, N'Administration'),
            (6, N'Human Resources'),
            (7, N'Customer Service'),
            (8, N'Financial'),
            (9, N'Research and Devolopment'),
            (10, N'Quality');

INSERT INTO Position
VALUES 		
			(1, N'Chairman'),
            (2, N'Director'),
            (3, N'Manager'),
            (4, N'Test'),
            (5, N'Trainee'),
            (6, N'Devoloper'),
            (7, N'Team leader'),
            (8, N'CEO'),
			(9, N'Scrum master'),
            (10, N'PM');
            
INSERT INTO Account_table 
VALUES 	
			(1, 'hoangthuyvan0601@gmail.com', 'hoangthuyvan0601', N'Hoang Thi Thuy Van', 7, 6, '2003-10-10'),
            (2, 'duongnamle0824@gmail.com', 'duongnamle0824', N'Le Nam Duong', 10, 6, '2005-12-15'),
            (3, 'phuxuanmai1017@gmail.com', 'phuxuanmai1017', N'Mai Xuan Phu', 5, 8, '2011-11-25'),
            (4, 'lananhhoang0408@gmail.com', 'lananhhoang0408', N'Hoang Thi Lan Anh', 6, 3, '2015-09-08'),
            (5, 'quan3d1226@gmail.com', 'quan3d1226', N'Vo Nguyen Trung Quan', 4, 9, '2009-04-12'),
            (6, 'hieulv0822@gmail.com', 'hieulv0822', N'Le Vinh Hieu', 5, 5, '2008-03-24'),
            (7, 'bichngoc0402@gmail.com', 'bichngoc0402', N'Le Thi Ngoc Bich', 2, 2, '2023-06-09'),
            (8, 'tumaianh0609@gmail.com', 'tumaianh0609', N'Mai Anh Tu', 5, 10, '2019-09-15'),
            (9, 'linhnguyen0308@gmail.com', 'linhnguyen0308', N'Nguyen Nu Hai Linh', 8, 6, '2019-09-15'),
            (10, 'lyly0930@gmail.com', 'lyly0930', N'Tran Thi Ly Ly', 5, 4, '2019-09-15');

INSERT INTO GroupTable
VALUES 
			(1, 'Group 1', 1, '2023-10-09'),
            (2, 'Group 2', 2, '2023-12-15'),
            (3, 'Group 3', 3, '2023-09-08'),
            (4, 'Group 4', 4, '2023-09-15'),
            (5, 'Group 5', 5, '2023-04-12'),
            (6, 'Group 6', 6, '2023-11-25'),
            (7, 'Group 7', 7, '2023-06-09'),
            (8, 'Group 8', 8, '2023-02-01'),
            (9, 'Group 9', 9, '2023-07-26'),
            (10, 'Group 10', 10, '2023-05-23');

INSERT INTO GroupAccount
VALUES 
			(1, 9, '2023-04-19'),
            (1, 5, '2023-04-20'),
            (1, 7, '2023-04-21'),
            (2, 7, '2023-04-25'),
            (7, 3, '2023-04-29'),
            (5, 4, '2023-04-29'),
            (1, 8, '2023-04-29'),
            (1, 6, '2023-04-29'),
            (7, 2, '2023-04-29'),
            (1, 4, '2023-04-29');

INSERT INTO TypeQuestion
VALUES 		
			(1, "Nguyen "),
            (2, "Le"),
            (3, "Hoang"),
            (4, "Tran"),
            (5, "Nguyen "),
            (6, "Vu"),
            (7, "Thai"),
            (8, "Linh"),
            (9, "Nu"),
            (10, "Thanh");

INSERT INTO CategoryQuestion
VALUES
			(1, 'Essay'),
            (2, 'Multiple Choice'),
            (3, 'Multiple Choice'),
            (4, 'Essay'),
            (5, 'Multiple Choice'),
            (6, 'Essay'),
            (7, 'Essay'),
            (8, 'Essay'),
			(9, 'Multiple Choice'),
			(10, 'Multiple Choice');

INSERT INTO Question
VALUES
			(1, 'Q 1', 3, 6, 1, '2023-04-20'),
            (2, 'Q 2', 5, 4, 2, '2023-05-29'),
            (3, 'Q 3', 7, 3, 3, '2023-08-25'),
            (4, 'Q 4', 4, 5, 4, '2023-03-14'),
            (5, 'Q 5', 2, 1, 5, '2023-06-19'),
            (6, 'Q 6', 3, 2, 6, '2023-08-30'),
            (7, 'Q 7', 1, 3, 7, '2023-12-31'),
            (8, 'Q 8', 5, 7, 8, '2023-07-30'),
            (9, 'Q 9', 6, 8, 9, '2023-02-15'),
            (10, 'Q 10', 5, 8, 10, '2023-11-16');

INSERT INTO Answer
VALUES 
			(1, 'Asw 1', 1, 'false'),
            (2, 'Asw 2', 2, 'true'),
            (3, 'Asw 3', 7, 'false'),
            (4, 'Asw 4', 5, 'true'),
            (5, 'Asw 5', 3, 'true'),
            (6, 'Asw 6', 6, 'false'),
            (7, 'Asw 7', 6, 'false'),
            (8, 'Asw 8', 2, 'true'),
            (9, 'Asw 9', 4, 'true'),
            (10, 'Asw 10', 9, 'true');

INSERT INTO Exam
VALUES 
			(1, 111, 'Title 01', 6, '60', 1, '2023-09-06'),
            (2, 112, 'Title 02', 5, '50', 2, '2023-08-06'),
            (3, 113, 'Title 03', 3, '40', 3, '2023-07-06'),
            (4, 114, 'Title 04', 5, '120', 4, '2023-06-06'),
            (5, 115, 'Title 05', 7, '90', 5, '2023-05-06'),
            (6, 116, 'Title 06', 8, '70', 6, '2023-04-06'),
            (7, 117, 'Title 07', 4, '80', 7, '2023-02-06'),
            (8, 118, 'Title 08', 2, '20', 8, '2023-05-06'),
            (9, 119, 'Title 09', 9, '70', 9, '2023-06-09'),
            (10, 120, 'Title 10', 6, '110', 10, '2023-12-20');

INSERT INTO ExamQuestion
VALUES 
			(4, 7),
            (5, 6),
            (1, 5),
            (2, 1),
            (3, 6),
            (4, 5),
            (7, 7),
            (9, 6),
            (4, 5),
            (3, 3);
	
-- Ques 1: Lấy ds nhân viên và phòng ban --------------------------------------------------------
SELECT AccountID, Email, Username, FullName, t1.DepartmentID, DepartName, PositionID, CreateDate
FROM Account_table t1
JOIN Department t2 ON t1.DepartmentID = t2.DepartmentID;
-- ----------------------------------------------------------------------------------------------
-- Ques 2: Lấy thông tin account được tạo sau 20/12/2010
SELECT AccountID, Email, Username, FullName, t1.DepartmentID, DepartName, PositionID, CreateDate
FROM Account_table t1
JOIN Department t2 ON t1.DepartmentID = t2.DepartmentID
WHERE CreateDate < '2010-12-20';
-- ----------------------------------------------------------------------------------------------
-- Ques 3: Lấy ra tất cả devoloper
SELECT AccountID, Email, Username, FullName, PositionName, DepartmentID, t1.PositionID, CreateDate
FROM Account_table t1
JOIN Position t2 ON t1.PositionID = t2.PositionID
WHERE PositionName = 'Devoloper';
-- ----------------------------------------------------------------------------------------------
-- Ques 4: Lấy danh sách phòng ban có > 3 nhân viên
SELECT t1.DepartmentID, DepartName, COUNT(AccountID) AS NUM_ACC
FROM Account_table t1
JOIN Department t2 ON t1.DepartmentID = t2.DepartmentID
GROUP BY DepartName 
HAVING NUM_ACC > 3;
-- ----------------------------------------------------------------------------------------------
-- Ques 5: Lấy danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT t1.QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate, COUNT(ExamID) AS NUM_USED
FROM Question t1
JOIN ExamQuestion t2 ON t1.QuestionID = t2.QuestionID
GROUP BY t1.QuestionID
HAVING NUM_USED = (SELECT MAX(NUM_USED) 
				   FROM (SELECT COUNT(ExamID) AS NUM_USED
						 FROM Question t1
                         JOIN ExamQuestion t2 ON t1.QuestionID = t2.QuestionID
                         GROUP BY t1.QuestionID) AS Table_q5);
-- ----------------------------------------------------------------------------------------------
-- Ques 6: Thống kê mỗi Category Ques được sử dụng trong bao nhiêu Ques
SELECT CategorName, COUNT(QuestionID) AS NUM_QUES
FROM CategoryQuestion t1
JOIN Question t2 ON t1.CategoryID = t2.CategoryID
GROUP BY t1.CategoryID;
-- ----------------------------------------------------------------------------------------------
-- Ques 7: Thống kê mỗi Ques được sử dụng trong bao nhiêu Exam
SELECT t1.QuestionID, Content, COUNT(ExamID) AS NUM_EXAM
FROM Question t1
JOIN ExamQuestion t2 ON t1.QuestionID = t2.QuestionID
GROUP BY t1.QuestionID;
-- ----------------------------------------------------------------------------------------------
-- Ques 8: Lấy ra ques có nhiều answ nhất 
SELECT t2.QuestionID, t2.Content, COUNT(AnswerID) AS NUM_ANS
FROM Answer t1
JOIN Question t2 ON t1.QuestionID = t2.QuestionID
GROUP BY t2.QuestionID
HAVING NUM_ANS = (SELECT MAX(NUM_ANS)
				  FROM (SELECT COUNT(AnswerID) AS NUM_ANS
						FROM Answer t1
						JOIN Question t2 ON t1.QuestionID = t2.QuestionID
						GROUP BY t2.QuestionID) AS Table_q8);
-- ----------------------------------------------------------------------------------------------
-- Ques 9: Thống kê số lượng Account trong mỗi Group
SELECT t1.GroupID, GroupName, COUNT(AccountID) AS NUM_ACC
FROM GroupTable t1
JOIN GroupAccount t2 ON t1.GroupID = t2.GroupID
GROUP BY GroupID;
-- ----------------------------------------------------------------------------------------------
-- Ques 10: Tìm chức vụ có ít người nhất 
SELECT PositionName, COUNT(AccountID) AS NUM_ACC
FROM Position t1
JOIN Account_table t2 ON t1.PositionID = t2.PositionID
GROUP BY t1.PositionID
HAVING NUM_ACC = (SELECT MIN(NUM_ACC)
				  FROM (SELECT COUNT(AccountID) AS NUM_ACC
				  FROM Position t1
				  JOIN Account_table t2 ON t1.PositionID = t2.PositionID
				  GROUP BY t1.PositionID) AS Table_q10);
-- ----------------------------------------------------------------------------------------------
-- Ques 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM 
SELECT DepartName, SUM(CASE WHEN PositionName = 'Devoloper' THEN 1 ELSE 0 END) AS NUM_DEV,
				   SUM(CASE WHEN PositionName = 'Test' THEN 1 ELSE 0 END) AS NUM_TEST,
                   SUM(CASE WHEN PositionName = 'scrum master' THEN 1 ELSE 0 END) AS NUM_ScrumMaster,
                   SUM(CASE WHEN PositionName = 'PM' THEN 1 ELSE 0 END) AS NUM_PM
FROM Account_table t1
RIGHT JOIN Department t2 ON t1.DepartmentID = t2.DepartmentID
LEFT JOIN Position t3 ON t1.PositionID = t3.PositionID
GROUP BY DepartName;
-- ----------------------------------------------------------------------------------------------
-- Ques 12: Lấy thông tin chi tiết của các ques bao gồm: thông tin cơ bản của ques, loại, người tạo, answ
SELECT t1.QuestionID, t1.Content AS Question, CategoryID, TypeName, t3.Content AS Answer
FROM Question t1
JOIN TypeQuestion t2 ON t1.TypeID = t2.TypeID
JOIN Answer t3 ON t1.QuestionID = t3.QuestionID
ORDER BY QuestionID;
-- ----------------------------------------------------------------------------------------------
-- Ques 13: Lấy ra số lượng của mỗi loại câu hỏi tự luận hay trắc nghiệm
SELECT CategorName, COUNT(QuestionID) AS NUM_QUES
FROM CategoryQuestion t1
JOIN Question t2
ON t1.CategoryID = t2.CategoryID
GROUP BY CategorName;
-- ----------------------------------------------------------------------------------------------
-- Ques 14: Lấy ra group không có account nào
SELECT GroupName, COUNT(AccountID) AS NUM_ACC
FROM GroupTable t1
LEFT JOIN GroupAccount t2 ON t1.GroupID = t2.GroupID
GROUP BY GroupName
HAVING NUM_ACC = 0;
-- ----------------------------------------------------------------------------------------------
-- Ques 15: Trùng với Ques 14
-- ----------------------------------------------------------------------------------------------
-- Ques 16: Lấy ra Ques không có Answ nào
SELECT t1.Content, COUNT(AnswerID) AS NUM_ANSW
FROM Question t1
LEFT JOIN Answer t2 ON t1.QuestionID = t2.QuestionID
GROUP BY t1.Content
HAVING NUM_ANSW = 0;
-- ----------------------------------------------------------------------------------------------
-- Ques 17: 
-- a) Lấy các account thuộc nhóm thứ 1
SELECT t1.AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate-- , GroupID
FROM Account_table t1
JOIN GroupAccount t2 ON t1.AccountID = t2.AccountID
WHERE GroupID = 1
-- c) Ghép kết quả 2 câu a), b) sao cho không có record trùng nhau 
UNION 
-- b) Lấy các account thuộc nhóm thứ 2
SELECT t1.AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate-- , GroupID
FROM Account_table t1
JOIN GroupAccount t2 ON t1.AccountID = t2.AccountID
WHERE GroupID = 2;
-- ----------------------------------------------------------------------------------------------
-- Ques 18: 
-- a) Lấy các group có > 5 thành viên
SELECT GroupName, COUNT(AccountID) AS NUM_ACC
FROM GroupTable t1
JOIN GroupAccount t2 ON t1.GroupID = t2.GroupID
GROUP BY t1.GroupName
HAVING NUM_ACC > 5
-- c) Ghép kết quả 2 câu a) và b)
UNION
-- b) Lấy các group có < 7 thành viên
SELECT GroupName, COUNT(AccountID) AS NUM_ACC
FROM GroupTable t1
JOIN GroupAccount t2 ON t1.GroupID = t2.GroupID
GROUP BY t1.GroupName
HAVING NUM_ACC < 7;
-- ----------------------------------------------------------------------------------------------
-- Buổi 5
-- Ques 1: Tạo view chứa danh sách nhân viên thuộc phòng ban Sales
CREATE VIEW ques1 AS
	SELECT AccountID, Email, Username, FullName, t1.DepartmentID, PositionID, CreateDate
    FROM Account_table t1
    JOIN Department t2 ON t1.DepartmentID = t2.DepartmentID
    WHERE DepartName = 'Sales';
-- ----------------------------------------------------------------------------------------------
-- Ques 2: Tạo view chứa các account tham gia vào nhiều group nhất
CREATE VIEW ques2 AS
	SELECT t1.AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate, COUNT(GroupID)
    FROM Account_table t1
    JOIN GroupAccount t2 ON t1.AccountID = t2.AccountID
    GROUP BY t1.AccountID
    ORDER BY COUNT(GroupID)
    LIMIT 3;
-- ----------------------------------------------------------------------------------------------
-- Ques 3: Tạo view có chứa câu hỏi có content > 300 từ và xóa nó đi
WITH 
	cte_3 AS 
    (
		SELECT QuestionID, Content 
        FROM Question
    )
    
DELETE FROM cte_3
WHERE Length(Content) > 300;
-- ----------------------------------------------------------------------------------------------
-- Ques 4: Tạo view chứa danh sách phòng ban có nhiều nhân viên nhất
CREATE VIEW ques4 AS
	SELECT t1.DepartmentID, DepartName, COUNT(AccountID)
    FROM Department t1
    JOIN Account_table t2 ON t1.DepartmentID = t2.DepartmentID
    GROUP BY DepartName
    ORDER BY COUNT(AccountID) DESC 
    LIMIT 1;
-- ----------------------------------------------------------------------------------------------
-- Ques 5: Tạo view chứa câu hỏi do user họ 'Nguyen' tạo
CREATE VIEW ques5 AS
	SELECT QuestionID, Content, CategoryID, t1.TypeID, CreatorID, CreateDate, TypeName
    FROM Question t1
    JOIN TypeQuestion t2 ON t1.TypeID = t2.TypeID
    WHERE TypeName LIKE 'Nguyen%';