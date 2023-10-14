DROP DATABASE IF EXISTS Fresher_Training_Management;
CREATE DATABASE Fresher_Training_Management;
USE Fresher_Training_Management;

DROP TABLE IF EXISTS Trainees;
CREATE TABLE 	Trainees
(
				TraineeID TINYINT AUTO_INCREMENT PRIMARY KEY,
                Full_Name NVARCHAR(30) NOT NULL,
                Birth_Date DATE,
                Gender ENUM ('male', 'female', 'unknown'),
                ET_IQ INT CHECK (ET_IQ >= 0 AND ET_IQ <=20) NOT NULL,
                ET_GMath INT CHECK (ET_GMath >= 0 AND ET_GMath <=20) NOT NULL,
                ET_English INT CHECK (ET_English >= 0 AND ET_English <=50) NOT NULL,
                Training_Class NVARCHAR(5) NOT NULL,
                Evaluation_Note NVARCHAR(10) NOT NULL,
                VTI_Account NVARCHAR(20) NOT NULL UNIQUE
);

-- Q1: Add  at least 10 records into the created table --
INSERT INTO Trainees 
VALUES
			(1, 'Hoang Thi Thuy Van', '1977-06-01', 'female', 18, 16, 48, '1', 'Passed', 'hoangthuyvan0601'),
            (2, 'Le Nam Duong', '2002-08-24', 'male', 14, 12, 16, '2', 'Failed', 'duongnamle0824'),
            (3, 'Mai Xuan Phu', '2002-10-17', 'male', 17, 19, 40, '2', 'Passed', 'phuxuanmai1017'),
            (4, 'Hoang Thi Lan Anh', '1974-04-08', 'female', 13, 10, 45, '3', 'Passed', 'lananhhoang0408'),
            (5, 'Vo Nguyen Trung Quan', '1988-12-26', 'unknown', 9, 6, 22, '1', 'Failed', 'quan3d1226'),
            (6, 'Le Vinh Hieu', '1996-08-22', 'male', 16, 16, 14, '4', 'Failed', 'hieulv0822'),
            (7, 'Le Thi Ngoc Bich', '2001-04-02', 'female', 20, 20, 46, '2', 'Passed', 'bichngoc0402'),
            (8, 'Mai Anh Tu', '1980-06-09', 'male', 15, 3, 40, '1', 'Failed', 'tumaianh0609'),
            (9, 'Nguyen Nu Hai Linh', '2003-03-08', 'female', 18, 18, 50, '4', 'Passed', 'linhnguyen0308'),
            (10, 'Tran Thi Ly Ly', '2005-09-30', 'female', 7, 12, 30, 'NT003', 'Failed', 'lyly0930');

-- Q2: Query all trainees who is passed the entry test, group them into different birth months --
SELECT Month(Birth_Date), COUNT(Evaluation_Note) FROM Trainees
WHERE Evaluation_Note = 'Passed'
GROUP BY Month(Birth_Date);

-- Q3: Query the trainee who has the longest name, showing his/her age along with his/her basic information (as defined in the table) --
SELECT *, LENGTH(Full_Name) AS Lenght_Name FROM Trainees
ORDER BY Lenght_Name DESC
LIMIT 1;

-- Q4: Question 4: Query all the ET-passed trainees. One trainee is considered as ET-passed when he/she has the entry test points satisfied below criteria:
-- ET_IQ + ET_Gmath >= 20
-- ET_IQ >= 8
-- ET_Gmath >= 8
-- ET_English >= 18
SELECT * FROM Trainees
WHERE (ET_IQ + ET_Gmath >= 20) AND (ET_IQ >= 8) AND (ET_Gmath >= 8) AND (ET_English >= 18);

-- Q5: Delete Infomation of trainess who has TraineeID = 3
DELETE FROM Trainees
WHERE TraineeID = 3;

-- Q6: Trainee who has TraineeID = 5 move '2' class. Let update information into database
UPDATE Trainees
SET Training_Class = '2'
WHERE TraineeID = 5;
