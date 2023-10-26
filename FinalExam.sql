DROP DATABASE IF EXISTS ThucTap;
CREATE DATABASE IF NOT EXISTS ThucTap;
USE ThucTap;

-- Ques 1:
DROP TABLE IF EXISTS GiangVien;
CREATE TABLE GiangVien (
				MaGV SMALLINT PRIMARY KEY AUTO_INCREMENT,
                HoTen NVARCHAR(20),
                Luong FLOAT
);

DROP TABLE IF EXISTS SinhVien;
CREATE TABLE SinhVien (
				MaSV SMALLINT PRIMARY KEY AUTO_INCREMENT,
                HoTen NVARCHAR(20),
                NamSinh SMALLINT,
                QueQuan NVARCHAR(30)
);

DROP TABLE IF EXISTS DeTai;
CREATE TABLE DeTai (
				MaDT SMALLINT PRIMARY KEY AUTO_INCREMENT,
                TenDT NVARCHAR(20) UNIQUE, 
                KinhPhi FLOAT,
                NoiThucTap NVARCHAR(30)
);

DROP TABLE IF EXISTS HuongDan;
CREATE TABLE HuongDan (
				ID SMALLINT PRIMARY KEY AUTO_INCREMENT,
                MaDT SMALLINT,
                MaSV SMALLINT,
                MaGV SMALLINT,
                KetQua NVARCHAR(10),
                FOREIGN KEY (MaSV) REFERENCES SinhVien (MaSV) ON DELETE CASCADE,
                FOREIGN KEY (MaGV) REFERENCES GiangVien (MaGV),
                FOREIGN KEY (MaDT) REFERENCES DeTai (MaDT)
);

INSERT INTO GiangVien (HoTen, Luong)
VALUES				(N'Nguyễn Ngọc Tự', 40000000),
					(N'Cao Thanh Tình', 30000000),
                    (N'Văn Thiên Luân', 20000000);

INSERT INTO SinhVien (HoTen, NamSinh, QueQuan)
VALUES				(N'Lê Vĩnh Hiếu', 2002, N'Thừa Thiên Huế'),
					(N'Mai Xuân Phú', 2002, N'Hà Nội'),
                    (N'Nguyễn Nữ Hải Linh', 2003, N'Hồ Chí Minh'),
                    (N'Hồ Minh Trí', 1996, N'An Giang');

INSERT INTO DeTai (TenDT, KinhPhi, NoiThucTap)
VALUES				(N'CONG NGHE SINH HOC', 2000000, N'Future Tech HCM'),
					(N'HE THONG NHUNG', '3000000', N'VN Chips HCM'),
                    (N'AN TOAN THONG TIN', 10000000, N'VTI HCM');
                    
INSERT INTO HuongDan (MaSV, MaDT, MaGV, KetQua)
VALUES				(2, 1, 3, N'Không Đạt'),
					(1, 3, 2, N'Không Đạt'),
                    (3, 2, 1, N'Đạt');

-- Ques 2:
SELECT * FROM SinhVien
WHERE MaSV NOT IN (SELECT MaSV FROM HuongDan);

SELECT COUNT(MaSV) AS NUM_OF_CNSH 
FROM DeTai t1
JOIN HuongDan t2 ON t1.MaDT = t2.MaDT
WHERE TenDT = 'CONG NGHE SINH HOC';

-- Ques 3:
DROP VIEW IF EXISTS SinhVienInfo;
CREATE VIEW SinhVienInfo AS
SELECT t1.MaSV, HoTen, IFNULL(t3.TenDT, N'Chưa có') AS TenDT
FROM SinhVien t1
LEFT JOIN HuongDan t2 ON t1.MaSV = t2.MaSV
LEFT JOIN DeTai t3 ON t2.MaDT = t3.MaDT;
-- CASE WHEN TenDT IS NOT NULL THEN TenDT ELSE N'Chưa có' END AS TenDT

-- Ques 4:
DROP TRIGGER IF EXISTS Insert_Born_Year;
DELIMITER $$
CREATE TRIGGER Insert_Born_Year
BEFORE INSERT ON SinhVien
FOR EACH ROW 
BEGIN
	IF NEW.NamSinh <= 1900 THEN
    SIGNAL SQLSTATE '12345'
    SET MESSAGE_TEXT = N'Năm sinh phải > 1900';
    END IF;
END $$
DELIMITER ;

	-- Test --
INSERT INTO SinhVien (HoTen, NamSinh, QueQuan)
VALUES 				(N'Lê Nam Dương', 1900, N'Đà Lạt');

-- Ques 5: 
DELETE FROM SinhVien
WHERE MaSV = 3;

SELECT * FROM SinhVien;
SELECT * FROM HuongDan;