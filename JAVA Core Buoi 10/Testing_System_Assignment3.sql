-- DATABASE --
DROP DATABASE IF EXISTS Testing_System_Assignment3;
CREATE DATABASE Testing_System_Assignment3;
USE Testing_System_Assignment3;

-- TABLE --
DROP TABLE IF EXISTS Department;
CREATE TABLE Department
(
	DepartmentID TINYINT PRIMARY KEY auto_increment,
    DepartName NVARCHAR(50) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS Position;
CREATE TABLE Position
(
	PositionID TINYINT PRIMARY KEY auto_increment,
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

-- 1. Thêm ít nhất 10 Record vào mỗi Table
INSERT INTO Department 
VALUES 
			(1, N'Marketing'),
            (2, N'Sale'),
            (3, N'Bảo vệ'),
            (4, N'Nhân sự'),
            (5, N'Kỹ thuật'),
            (6, N'Tài chính'),
            (7, N'Phó giám đốc'),
            (8, N'Giám đốc'),
            (9, N'Thư ký'),
            (10, N'Bán hàng');

INSERT INTO Position
VALUES 		
			(1, N'Nhân viên'),
            (2, N'Thực tập sinh'),
            (3, N'Thư ký'),
            (4, N'Phó phòng'),
            (5, N'Trưởng phòng'),
            (6, N'Chủ tịch'),
            (7, N'Phó chủ tịch'),
            (8, N'Giám đốc'),
            (9, N'Phó giám đốc'),
            (10, N'CEO');

INSERT INTO Account_table 
VALUES 	
			(101, 'phumaixuan@gmail.com', 'phumaixuan17', N'Mai Xuan Phu', 7, 3, '2023-10-10'),
            (102, 'thuvo1512@gmail.com', 'thuvo1512', N'Vo Nguyen Minh Thu', 10, 5, '2023-12-15'),
            (103, 'quanvo@gmail.com', 'quanvo35', N'Vo Nguyen Trung Quan', 2, 2, '2023-11-25'),
            (104, 'bichle@gmail.com', 'bichle16', N'Le Thi Ngoc Bich', 6, 1, '2023-09-08'),
            (105, 'chinhnguyen@gmail.com', 'chinhnguyen24', N'Nguyen Nhan Chinh', 7, 5, '2023-04-12'),
            (106, 'namlam@gmail.com', 'namlam11', N'Lam Nhat Nam', 10, 4, '2023-03-24'),
            (107, 'duonghoang@gmail.com', 'duonghoang27', N'Hoang Hai Duong', 8, 4, '2023-06-09'),
            (108, 'baoquoc@gmail.com', 'baoquoc09', N'Mai Bao Quoc', 7, 5, '2023-09-15'),
            (109, 'dattran@gmail.com', 'dattran18', N'Tran Minh Dat', 9, 6, '2023-09-15'),
            (110, 'duongle@gmail.com', 'duongle19', N'Le Nam Duong', 10, 5, '2023-09-15');

INSERT INTO GroupTable
VALUES 
			(11, 'Group 1', 111, '2023-10-09'),
            (12, 'Group 2', 112, '2023-12-15'),
            (13, 'Group 3', 113, '2023-09-08'),
            (14, 'Group 4', 114, '2023-09-15'),
            (15, 'Group 5', 115, '2023-04-12'),
            (16, 'Group 6', 116, '2023-11-25'),
            (17, 'Group 7', 117, '2023-06-09'),
            (18, 'Group 8', 118, '2023-02-01'),
            (19, 'Group 9', 119, '2023-08-25'),
            (20, 'Group 10', 120, '2023-05-11');

INSERT INTO GroupAccount
VALUES 
			(11, 101, '2023-04-19'),
            (12, 102, '2023-08-20'),
            (13, 103, '2023-07-21'),
            (16, 106, '2023-05-25'),
            (15, 108, '2023-03-29'),
            (14, 109, '2023-02-15'),
            (17, 108, '2023-12-17'),
            (19, 110, '2023-09-23'),
            (18, 104, '2023-04-26'),
            (20, 103, '2023-05-12');

INSERT INTO TypeQuestion
VALUES 		
			(51, "Type 1"),
            (52, "Type 2"),
            (53, "Type 3"),
            (54, "Type 4"),
            (55, "Type 5"),
            (56, "Type 6"),
            (57, "Type 7"),
            (58, "Type 8"),
            (59, "Type 9"),
            (60, "Type 10");

INSERT INTO CategoryQuestion
VALUES
			(61, 'No 1'),
            (62, 'No 2'),
            (63, 'No 3'),
            (64, 'No 4'),
            (65, 'No 5'),
            (66, 'No 6'),
            (67, 'No 7'),
            (68, 'No 8'),
            (69, 'No 9'),
            (70, 'No 10');

INSERT INTO Question
VALUES
			(91, 'Q 1', 63, 56, 81, '2023-04-20'),
            (92, 'Q 2', 65, 54, 82, '2023-05-29'),
            (93, 'Q 3', 67, 53, 83, '2023-08-25'),
            (94, 'Q 4', 64, 55, 84, '2023-03-14'),
            (95, 'Q 5', 62, 51, 85, '2023-06-19'),
            (96, 'Q 6', 63, 52, 86, '2023-08-30'),
            (97, 'Q 7', 61, 53, 87, '2023-12-31'),
            (98, 'Q 8', 65, 58, 88, '2023-04-07'),
            (99, 'Q 9', 65, 58, 89, '2023-11-09'),
            (100, 'Q 10', 67, 58, 70, '2023-09-12');

INSERT INTO Answer
VALUES 
			(71, 'A 1', 91, 'false'),
            (72, 'A 2', 92, 'true'),
            (73, 'A 3', 97, 'false'),
            (74, 'A 4', 95, 'true'),
            (75, 'A 5', 93, 'true'),
            (76, 'A 6', 96, 'false'),
            (77, 'A 7', 96, 'false'),
            (78, 'A 8', 92, 'true'),
            (79, 'A 9', 97, 'true'),
            (80, 'A 10', 92, 'true');

INSERT INTO Exam
VALUES 
			(31, 511, 'Title 1', 66, '60', 611, '2023-09-06'),
            (32, 512, 'Title 2', 65, '50', 612, '2023-08-06'),
            (33, 513, 'Title 3', 63, '40', 613, '2023-07-06'),
            (34, 514, 'Title 4', 65, '120', 614, '2023-06-06'),
            (35, 515, 'Title 5', 67, '90', 615, '2023-05-06'),
            (36, 516, 'Title 6', 68, '70', 616, '2023-04-06'),
            (37, 517, 'Title 7', 64, '80', 617, '2023-02-06'),
            (38, 518, 'Title 8', 62, '20', 618, '2023-06-25'),
            (39, 519, 'Title 9', 62, '20', 619, '2023-11-06'),
            (40, 520, 'Title 10', 62, '20', 620, '2023-05-06');

INSERT INTO ExamQuestion
VALUES 
			(34, 97),
            (35, 96),
            (31, 95),
            (32, 91),
            (33, 96),
            (34, 91),
            (37, 97),
            (33, 93),
            (39, 95),
            (40, 91);
            
-- SELECT * 
-- FROM Department;

-- SELECT Title, ExamID
-- FROM Exam;

-- SELECT FullName 
-- FROM Account_table
-- WHERE Username LIKE '%van%';

-- SELECT GroupName 
-- FROM GroupTable 
-- WHERE CreateDate < '2023-12-15';

-- SELECT ExamID
-- FROM Exam
-- WHERE Duration < 80 AND CreateDate < '2023-09-06';

-- SELECT FullName
-- FROM Account_table 
-- WHERE FullName LIKE 'N%' AND FullName LIKE '%O';
-- -- 'N%O'

-- SELECT COUNT(*) FROM Account_table
-- WHERE DepartmentID = 2;

-- SELECT * FROM Exam
-- ORDER BY CreateDate DESC
-- LIMIT 5;

-- SELECT COUNT(PositionID)  AS Number, PositionID FROM Account_table
-- GROUP BY PositionID
-- HAVING Number > 1;

-- -- C1
-- SELECT *, LENGTH(FullName) AS COUNT_Name FROM Account_table
-- GROUP BY AccountID
-- ORDER BY COUNT_Name DESC
-- LIMIT 1;

-- -- C2
-- SELECT * FROM Account_table
-- ORDER BY LENGTH(FullName)  DESC
-- LIMIT 1;

-- UPDATE GroupTable
-- SET 
-- CreateID = 120
-- WHERE GroupID > 13;

-- SELECT * FROM GroupTable;

-- SELECT * FROM Account_table;