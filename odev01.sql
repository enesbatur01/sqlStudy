CREATE TABLE tedarikciler(
tedarikci_id CHAR(4),
tedarikci_name VARCHAR(20),
tedarikci_adress VARCHAR(20),
ulasim_tarihi DATE	
);

CREATE TABLE tedarikci_info AS SELECT tedarikci_name,ulasim_tarihi FROM tedarikciler;

CREATE TABLE ogretmenler(
kimlik_no NUMERIC(11),
isim VARCHAR(20),
brans VARCHAR(10),
cinsiyet CHAR(5)	
);

INSERT INTO ogretmenler VALUES(234431223,'Ayse Guler','Matematik','Kadin');
INSERT INTO ogretmenler VALUES(234431224,'Ali Guler','Fizik','Erkek');

INSERT INTO ogretmenler(kimlik_no,isim) VALUES (567597624,'Veli Guler');


SELECT * FROM ogretmenler;