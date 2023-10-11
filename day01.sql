--tek yorum satırı selam
/*
Çoklu yorum satırı
selam
*/
--------------------DAY 1 NT--------------------
--1-Database oluşturma
CREATE DATABASE enes; --SQL komutlarında büyük/küçük harf duyarlılığı yoktur

--2-Database silme
DROP DATABASE enes;

--3-table oluşturma
CREATE TABLE students(
id CHAR(4),
name VARCHAR(20),
grade REAL,
register_date DATE	
);

--4-Mevcut bir tablodan yeni bir tablo oluşturma
CREATE TABLE grades AS SELECT  name,grade FROM students;

--5-Tabloya data ekleme
INSERT INTO students VALUES('1001','enes burak batur',99.8,'2023-10-04');
INSERT INTO students VALUES('1002','Harry Potter',100.0,now());

--6-Tablodaki tüm kayıtları(dataları) görüntüleme
SELECT * FROM students;

--7-Tablodaki bazı sütunlara data ekleme
INSERT INTO students(name,grade) VALUES('Jack Sparrow',88.8);  

--8-Tabloda belirli sütunlarda ki data ları görüntüleme
SELECT name,grade FROM students WHERE id='1001' ;

