DROP DATABASE IF EXISTS BTVN_MySQL_2;
CREATE DATABASE BTVN_MySQL_2;
USE BTVN_MySQL_2;

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
    Duration TIME,
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
            (5, N'Trưởng phòng');

INSERT INTO Account_table 
VALUES 	
			(101, 'nhanvien1@gmail.com', 'nguyenvana2001', N'Nguyen Van A', 7, 3, '2023-10-10'),
            (102, 'nhanvien2@gmail.com', 'nguyenvanb2002', N'Nguyen Van B', 10, 5, '2023-12-15'),
            (103, 'nhanvien3@gmail.com', 'nguyenvanc2003', N'Nguyen Van C', 2, 2, '2023-11-25'),
            (104, 'nhanvien4@gmail.com', 'nguyenvand2004', N'Nguyen Van D', 6, 1, '2023-09-08'),
            (105, 'nhanvien5@gmail.com', 'nguyenvane2005', N'Nguyen Van E', 7, 5, '2023-04-12'),
            (106, 'nhanvien6@gmail.com', 'nguyenvanf2006', N'Nguyen Van F', 10, 4, '2023-03-24'),
            (107, 'nhanvien7@gmail.com', 'nguyenvang2007', N'Nguyen Van G', 8, 4, '2023-06-09'),
            (108, 'nhanvien8@gmail.com', 'nguyenvanh2008', N'Nguyen Van H', 7, 5, '2023-09-15');

INSERT INTO GroupTable
VALUES 
			(11, 'Group 1', 111, '2023-10-09'),
            (12, 'Group 2', 112, '2023-12-15'),
            (13, 'Group 3', 113, '2023-09-08'),
            (14, 'Group 4', 114, '2023-09-15'),
            (15, 'Group 5', 115, '2023-04-12'),
            (16, 'Group 6', 116, '2023-11-25'),
            (17, 'Group 7', 117, '2023-06-09'),
            (18, 'Group 8', 118, '2023-02-01');

INSERT INTO GroupAccount
VALUES 
			(11, 101, '2023-04-19'),
            (12, 102, '2023-04-20'),
            (13, 103, '2023-04-21'),
            (16, 106, '2023-04-25'),
            (18, 108, '2023-04-29');

INSERT INTO TypeQuestion
VALUES 		
			(51, "Type 1"),
            (52, "Type 2"),
            (53, "Type 3"),
            (54, "Type 4"),
            (55, "Type 5"),
            (56, "Type 6"),
            (57, "Type 7"),
            (58, "Type 8");

INSERT INTO CategoryQuestion
VALUES
			(61, 'No 1'),
            (62, 'No 2'),
            (63, 'No 3'),
            (64, 'No 4'),
            (65, 'No 5'),
            (66, 'No 6'),
            (67, 'No 7'),
            (68, 'No 8');

INSERT INTO Question
VALUES
			(91, 'Q 1', 63, 56, 81, '2023-04-20'),
            (92, 'Q 2', 65, 54, 82, '2023-05-29'),
            (93, 'Q 3', 67, 53, 83, '2023-08-25'),
            (94, 'Q 4', 64, 55, 84, '2023-03-14'),
            (95, 'Q 5', 62, 51, 85, '2023-06-19'),
            (96, 'Q 6', 63, 52, 86, '2023-08-30'),
            (97, 'Q 7', 61, 53, 87, '2023-12-31'),
            (98, 'Q 8', 65, 58, 88, '2023-11-09');

INSERT INTO Answer
VALUES 
			(71, 'A 1', 91, 'false'),
            (72, 'A 2', 92, 'true'),
            (73, 'A 3', 97, 'false'),
            (74, 'A 4', 95, 'true'),
            (75, 'A 5', 93, 'true'),
            (76, 'A 6', 96, 'false'),
            (77, 'A 7', 96, 'false'),
            (78, 'A 8', 92, 'true');

INSERT INTO Exam
VALUES 
			(31, 511, 'Title 1', 66, '06:09:15', 611, '2023-09-06'),
            (32, 512, 'Title 2', 65, '07:08:15', 612, '2023-09-06'),
            (33, 513, 'Title 3', 63, '09:07:16', 613, '2023-09-06'),
            (34, 514, 'Title 4', 65, '03:04:07', 614, '2023-09-06'),
            (35, 515, 'Title 5', 67, '04:11:15', 615, '2023-09-06'),
            (36, 516, 'Title 6', 68, '07:02:09', 616, '2023-09-06'),
            (37, 517, 'Title 7', 64, '05:15:20', 617, '2023-09-06'),
            (38, 518, 'Title 8', 62, '11:19:30', 618, '2023-09-06');

INSERT INTO ExamQuestion
VALUES 
			(34, 97),
            (35, 96),
            (31, 95),
            (32, 91),
            (33, 96),
            (34, 91),
            (37, 97),
            (33, 93);