CREATE TABLE ogrenciler(
	id INT PRIMARY KEY,
	isim VARCHAR(30),
	adres VARCHAR(50),
	sinav_notu INT
);

-- VEYA

CREATE TABLE ogrenciler(
	id INT,
	isim VARCHAR(30),
	adres VARCHAR(50),
	sinav_notu INT,
	CONSTRAINT std_pk PRIMARY KEY (id)
);

-- 2PK olursa :

CREATE TABLE ogrenciler(
	id INT,
	isim VARCHAR(30),
	adres VARCHAR(50),
	sinav_notu INT,
	CONSTRAINT composite_pk PRIMARY KEY (id,isim)
);

/*
	Niye Composite PK ya ihtiyacımız var ?

Universite  öğrenci numarası
2023064120 gibi composite PK düşünelim
2023 -> öğrencinin kayıt yılı
064  -> bölüm kodu
120  -> öğrencinin kayıt sıras


*/

-- Sınav notunun 0 - 100 arası olma ihtimali

CREATE TABLE ogrenciler(
	id INT PRIMARY KEY,
	isim VARCHAR(30),
	adres VARCHAR(50),
	sinav_notu INT CHECK(sinav_notu>=0 AND sinav_notu<=100)
);

-- Tabloya veri ekleme

INSERT INTO ogrenciler VALUES(1,'Enes','Denizli',99);

INSERT INTO ogrenciler VALUES
	(2,'Zeki','Ankara',70),
	(3,'Betül','İstanbul',70),
	(4,'Bilal','İzmir',70),
	(5,'Büşra','Konya',70)
	
INSERT INTO ogrenciler(id,isim,sinav_notu) VALUES
	(6,'Cemal',45),
	(7,'Abdül',55)
	


SELECT * FROM ogrenciler

-- SORU1: ogrenciler tablosundaki id ve isim bilgileri ile tum recordlari getirelim :

SELECT id,isim FROM ogrenciler

-- SORU2: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listele

SELECT * FROM ogrenciler WHERE sinav_notu>80;

-- SORU3: Adresi Ankara olan ogrencilerin tum bilgilerini listele

SELECT * FROM ogrenciler WHERE adres='Ankara';

-- SORU4: Sinav notu 80 ve adresi Istanbul olan ogrenci ismini listele

SELECT isim FROM ogrenciler WHERE adres='Istanbul' AND sinav_notu=80;

-- SORU5: Sinav notu 55 veya 100 olan ogrencilerin tum bilgilerini listele

SELECT * FROM ogrenciler WHERE sinav_notu=55 OR sinav_notu=100;
SELECT * FROM ogrenciler WHERE sinav_notu in (55,100);

-- SORU6: sınav notu 65 ile 85 arasında olan öğrencileri listeleyiniz

SELECT * FROM ogrenciler WHERE sinav_notu BETWEEN 65 AND 85

-- SORU7: id'si 3 ve 5 arasinda olmayan ogrencilerin isim ve sinav notu listele

SELECT isim,sinav_notu FROM ogrenciler WHERE id NOT BETWEEN 3 AND 5

-- SORU8: En yuksek sinav puani nedir

SELECT MAX (sinav_notu) FROM ogrenciler

-- SORU9: İzmir'de yaşayan ve sınav notu 50'den yuksek olan öğrencilerin listesi:

SELECT * FROM ogrenciler WHERE sinav_notu>50 AND adres='İzmir'

-- SORU10: Öğrenci sayısı ve ortalama sınav notu:

SELECT COUNT (*) , ROUND(AVG (sinav_notu))FROM ogrenciler 

-- SORU11: sinav_notu 52 olan satiri siliniz

DELETE FROM ogrenciler WHERE sinav_notu=55

-- SORU12: ismi Derya Soylu veya Yavuz Bal olan satirlari siliniz

DELETE FROM ogrenciler WHERE isim in('Derya Soylu','Yavuz Bal') 

-- SORU13 : Ogrenciler tablosunun içeriğini siliniz

DELETE FROM ogrenciler --veri geri getirilebilir, veriyi siler
TRUNCATE TABLE ogrenciler --veri geri getirilemez, tabloyu siler

-- SORU14 : Ogrenciler Tablosunu siliniz

DROP TABLE ogrenciler--where condition var mı diye bakar
TRUNCATE TABLE ogrenciler--where olmaz direkt siler















