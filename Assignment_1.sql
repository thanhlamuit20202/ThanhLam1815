CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department
(
	DepartmentID INT,
    DepartName VARCHAR(50)
);

CREATE TABLE Position
(
	PositionID INT,
    PositionName VARCHAR(20)
);

CREATE TABLE Account
(
	PRIMARY KEY (AccountID),
	AccountID INT,
    Email VARCHAR(100),
    Username VARCHAR(50),
    FullName VARCHAR(50),
    DepartmentID INT,
    PositionID INT,
    CreateDate DATE
);

CREATE TABLE GroupTable
(
	GroupID INT,
    GroupName VARCHAR(50),
    CreateID INT,
    CreateDate DATE
);

CREATE TABLE GroupAccount
(
	GroupID INT,
    AccountID INT,
    JoinDate DATE
);

CREATE TABLE TypeQuestion
(
	TypeID INT,
    TypeName VARCHAR(50)
);

CREATE TABLE CategoryQuestion
(
	CategoryID INT,
    CategorName VARCHAR(50)
);

CREATE TABLE Question
(
	QuestionID INT,
    Content VARCHAR(800),
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATE
);

CREATE TABLE Answer
(
	AnswerID INT,
    Content VARCHAR(800),
    QuestionID INT,
    isCorrect ENUM ('true', 'false')
);

CREATE TABLE Exam
(
	ExamID INT,
    Code INT,
    Title VARCHAR(50),
    CategoryID INT,
    Duration TIME,
    CreatorID INT,
    CreateDate DATE
);

CREATE TABLE ExamQuestion
(
	ExamID INT,
    QuestionID INT
);