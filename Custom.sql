CREATE DATABASE custom;
USE custom;

CREATE TABLE SinhVien
(
	MSSV INT,
    HoTen VARCHAR(100),
    NamSinh DATE,
    GioiTinh VARCHAR(5)
);

-- INSERT 1
INSERT INTO SinhVien VALUES (20521513, "Hoang Thanh Lam", "2002-01-15", "Nam");

-- INSERT 2
INSERT INTO SinhVien (NamSinh, MSSV) VALUES ("1969-12-30", 20521518);

-- INSERT 3
INSERT INTO SinhVien (HoTen, MSSV) VALUES ("Thanh Lam", 20521234),
											("Vinh Hieu", 20521235),
                                            ("Xuan Phu", 20521974);
					
SELECT * FROM SinhVien;

CREATE TABLE Info
(
	CustomerID INT,
    CustomerName VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Info VALUES (1, "Thanh Lam", "KTX A", "Quang Tri"),
							(2, "Vinh Hieu", "KTX A", "Thanh Hoa"),
							(3, "Nam Duong", "KTX D", "Hue"),
                            (4, "Xuan Phu", "KTX A", "Quang Tri"),
                            (5, "Trung Quan", "KTX A", "Da Nang"),
                            (6, "Thanh Lam", "KTX C", "Quang Tri");

SELECT DISTINCT Address FROM Info;

-- Loop cả 2 -> loại 
-- Như nhau
SELECT DISTINCT Address, CustomerID FROM Info;
-- SELECT DISTINCT CustomerID, Address FROM Info;