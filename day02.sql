---------------------------DAY 2 NT------------------------
----------------------------TEKRAR-------------------------

CREATE TABLE sairler(
id int,
name varchar(50),
email varchar(50)
);

INSERT INTO sairler VALUES(1001,'Can Yücel','sair@mail.com');
INSERT INTO sairler VALUES(1001,'Necip Fazıl','sair@mail.com');
INSERT INTO sairler VALUES(1002,'','sair@mail.com');

INSERT INTO sairler(name) VALUES ('Nazım Hikmet');

select * from sairler;

--9-Tabloya UNİQUE constrainti ekleme
CREATE TABLE it_persons(
id SERIAL,
name VARCHAR(50),
email VARCHAR(50) UNIQUE,
salary REAL,	
prog_lang VARCHAR(20)
);

INSERT INTO it_persons(name,email,salary,prog_lang) VALUES('Enes Burak Batur','enesburakbaturqa@gmail.com',4000,'Java');
INSERT INTO it_persons(name,email,salary,prog_lang) VALUES('Başar Batur','başarbatur@gmail.com',7000,'Java');
INSERT INTO it_persons(name,email,salary) VALUES('Büşranur Batur','büşranurbatur@gmail.com',4000);

select * from it_persons;

--10-Tabloya NOT NULL constrainti ekleme
CREATE TABLE doctors(
id SERIAL,
name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
salary REAL	
);

INSERT INTO doctors(name,email,salary) VALUES ('Fatıma Hoca','dr@gmail.com',6000);
INSERT INTO doctors(email,salary) VALUES ('dr@gmail.com',6000); --not null null olamaz
INSERT INTO doctors(name,email,salary) VALUES ('Finduklu Ağaç','dahtır@gmail.com',5700);
--NOT NULL empty değer kabul eder.
INSERT INTO doctors(name,email,salary) VALUES ('','dahtır@gmail.com',5700);

SELECT * FROM doctors;

--11-Tabloya PK cpnstrainti ekleme: 1.yol
CREATE TABLE students2(
id int PRIMARY KEY, --UNIQUE, NOT NULL, başka bir tablo ile ilişkindirmek için kullanılacak
name varchar(50),
grade real,	
register_date date	
);

--12-Tabloya PK cpnstrainti ekleme: 2.yol
CREATE TABLE students3(
id int, --UNIQUE, NOT NULL, başka bir tablo ile ilişkindirmek için kullanılacak
name varchar(50),
grade real,	
register_date date,
CONSTRAINT std_pk PRIMARY KEY(id) 	
);

--composite key
CREATE TABLE students4(
id int,
name varchar(50),
grade real,	
register_date date,
CONSTRAINT composite_pk PRIMARY KEY(id,name)	
);

SELECT * FROM students4

--12-Tabloya FK constrainti ekleme  (students3 tablosuna bağladık)
CREATE TABLE address(
address_id int,
street varchar(50),
city varchar(20),
student_id int, --FK olsun	
CONSTRAINT adress_fk FOREIGN KEY(student_id) REFERENCES students3(id)
);

SELECT * FROM address

--13-Tabloya CHECK constrainti ekleme
CREATE TABLE personel(
id int,
name varchar(50),
salary real CHECK (salary>5000),
age int CHECK (age>0 OR age<50)	--negatif olmamalı
);

INSERT INTO personel VALUES(11,'Enes Burak Batur',3000,25); -- salary 5000 altı olduğu için kabul etmez
INSERT INTO personel VALUES(11,'Enes Burak Batur',6000,55); -- yaşı 50 üzeri olduüu için kabul etmez
INSERT INTO personel VALUES(11,'Enes Burak Batur',6000,23);

SELECT * FROM personel




