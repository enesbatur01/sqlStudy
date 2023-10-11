--------------------Day 3 NT----------------------
---------------------tekrar-----------------------

CREATE TABLE calisanlar(
id char(5) PRIMARY KEY, --NOT NULL, UNIQUE, bu tablo başka bir tablo ile ilişkilendirilirken bu sütun kullanılacak
isim varchar(50) UNIQUE,
maas int NOT NULL,
ise_baslama date
); --parent

CREATE TABLE adresler(
adres_id char(5), --NULL olur, 
sokak varchar(30),
cadde varchar(30),
sehir varchar(20),
FOREIGN KEY(adres_id) REFERENCES calisanlar(id) 
); --child 

INSERT INTO calisanlar VALUES('10002', 'Donatello' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10003', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Donatello', 5000, '2018-04-14'); --isim UNIQUE
INSERT INTO calisanlar VALUES('10005', 'Michelangelo', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Leonardo', null, '2019-04-12'); --maaş NOT NULL
INSERT INTO calisanlar VALUES('10007', 'Raphael', '', '2018-04-14');--maaş için yanlış data type girdik integer olmalı
INSERT INTO calisanlar VALUES('', 'April', 2000, '2018-04-14');--empty null değil
INSERT INTO calisanlar VALUES('', 'Ms.April', 2000, '2018-04-14');--2. kere empty değer girdik id primary key yani unique olmalı
INSERT INTO calisanlar VALUES('10002', 'Splinter' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'Fred' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', 'Barnie' ,10000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'Wilma' ,11000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Betty' ,12000, '2018-04-14');

INSERT INTO adresler VALUES('10003','Ninja Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Kaya Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Taş Sok', '30.Cad.','Konya');

INSERT INTO adresler VALUES('10012','Taş Sok', '30.Cad.','Konya');--çalışanlarda 10012 id li kullanıcı yok


INSERT INTO adresler VALUES(NULL,'Taş Sok', '23.Cad.','Konya');
INSERT INTO adresler VALUES(NULL,'Taş Sok', '33.Cad.','Bursa');

SELECT*FROM calisanlar
SELECT*FROM adresler

--14-WHERE CONDITION(koşulu)

--calisanlar tablosundan ismi 'Donatello' olanlarım tüm bilgilerini listeleyelim
SELECT * FROM calisanlar WHERE isim='Donatello'

--calisanlar tablosundan maaşı 5000den fazla olanlarım tüm bilgilerini listeleyelim
SELECT isim,maas FROM calisanlar WHERE maas>5000 

--calisanlar tablosundan maaşı 5000den fazla olanlarım tüm bilgilerini listeleyelim
SELECT isim,maas FROM calisanlar WHERE maas>5000 

--adresler tablosundan sehiri 'Konya' ve 
--adres_id si 10002 olan tüm verileri getir
SELECT * FROM adresler WHERE sehir='Konya' AND adres_id='10002'

--sehiri 'Konya' veya 'Bursa' olan adreslerin cadde ve sehir bilgilerini getirelim.
SELECT * FROM adresler WHERE sehir='Konya' OR sehir='Bursa'

--15-DELETE FROM TABLO İSMİ WHERE ..KOŞUL.. :Tablodan koşulu sağlayan kayıtları siler --DML,
CREATE TABLE ogrenciler1
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);

INSERT INTO ogrenciler1 VALUES(122, 'Kerem Can', 'Fatma',75);
INSERT INTO ogrenciler1 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler1 VALUES(124, 'Veli Han', 'Ayse',85);
INSERT INTO ogrenciler1 VALUES(125, 'Kemal Tan', 'Hasan',85);
INSERT INTO ogrenciler1 VALUES(126, 'Ahmet Ran', 'Ayse',95);
INSERT INTO ogrenciler1 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler1 VALUES(128, 'Mustafa Bak', 'Ali', 99);
INSERT INTO ogrenciler1 VALUES(129, 'Mehmet Bak', 'Alihan', 89);

SELECT * FROM ogrenciler1

--id=123 olan kaydı silelim
DELETE FROM ogrenciler1 WHERE id=123

--ismi Kemal Tan olan kaydı silelim
DELETE FROM ogrenciler1 WHERE isim='Kemal Tan'

--ismi Ahmet Ran veya Veli Han olan  kayıtları silelim
DELETE FROM ogrenciler1 WHERE isim='Ahmet Ran' OR isim='Veli Han'

--16-A- Tabloda ki tüm kayıtları silme: DELETE FROM koşul belirtmezsek tablodaki bütün verileri siler

--students tablosundaki tüm kayıtları silelim
DELETE FROM students

--16-B- Tabloda ki tüm kayıtları silme: TRUNCATE TABLE ..

--doctors tablosundaki tüm kayıtları silelim
TRUNCATE TABLE doctors--WHERE KOMUTU kullanılamaz yani koşul belirtemeyiz

--17-parent-child ilişkisi olan tablolarda silme işlemi
SELECT * FROM calisanlar--parent
SELECT * FROM adresler  --calisanlar

--calisanlar tablosundaki tüm kayıtları silelim
DELETE FROM calisanlar--bazı kayıtlar adresler tablosunda referans alındığı için silinemiyor
DELETE FROM calisanlar WHERE id ='10002' --10002 id si adresler tablosunda kullanılmış

DELETE FROM adresler--tüm ilişki koparıldı
DELETE FROM calisanlar--artık hiçbir kayıt ref alınmıyor silebilir

--18-ON DELETE CASCADE: Kademeli silme işlemini otomatikleştirir
CREATE TABLE talebeler
(
id int primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
--parent

CREATE TABLE notlar( 
talebe_id int,
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id) ON DELETE CASCADE
);--child

INSERT INTO talebeler VALUES(122, 'Kerem Can', 'Fatma',75);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Veli Han', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Tan', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Ahmet Ran', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO talebeler VALUES(128, 'Mustafa Bak', 'Ali', 99);
INSERT INTO talebeler VALUES(129, 'Mehmet Bak', 'Alihan', 89);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);
INSERT INTO notlar VALUES ('127', 'Matematik',90);
INSERT INTO notlar VALUES (null, 'tarih',90);

SELECT * FROM talebeler
SELECT * FROM notlar

--notlar tablosundan id:123 olan kaydı silelim.
DELETE FROM notlar WHERE talebe_id=123;

--talebeler tablosundan id:126 olan kaydı silelim.
--parenttan referanslı kayıt silmek için aşamalı(cascade)
--silme yapmalıydık
--on delete cascade öz önce notlar tablosundan ref. siler
--sonra parenttan ref. kaldırılan kaydı siler.
DELETE FROM talebeler WHERE id=126;

DELETE FROM talebeler;--notlar tablosundan da sadece ref olan kayıtları siler

--19-Tabloyu silme: tabloyu SCHEMA dan kaldırma
--sairler tablosunu silelim
DROP TABLE sairler--DDL

--talebeler tablosunu silelim
DROP TABLE talebeler--ilişki hala tanımlı olduğu için silmez
DROP TABLE talebeler CASCADE

--talebeler1 tablosunu silelim
DROP TABLE IF EXISTS talebeler1--Hata almamak için

--20-IN CONDITION : liste içindeyse true NOT IN de vardır içinde değilse verir
CREATE TABLE musteriler  (
urun_id int,  
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler;

--Müşteriler tablosundan ürün ismi 'Orange', 'Apple' veya 'Apricot' olan verileri listeleyiniz.
--1.yol
SELECT * FROM musteriler WHERE urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot'

--2.yol
SELECT * FROM musteriler WHERE urun_isim IN ('Orange','Apple','Apricot')

--Müşteriler tablosundan ürün ismi 'Orange', 'Apple' ve 'Apricot' olmayan verileri listeleyiniz.
SELECT * FROM musteriler WHERE urun_isim NOT IN ('Orange','Apple','Apricot')

--21-BETWEEN .. AND .. komutu arasında ise demek
--Müşteriler tablosunda urun_id 20 ile 40(dahil) arasinda olan urunlerin tum bilgilerini listeleyiniz
SELECT * FROM musteriler WHERE urun_id>=20 AND urun_id<=40;

--2.yol
SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40;--20 ve 40 dahil

--Müşteriler tablosunda urun_id 20 den küçük veya 30(dahil değil) dan büyük olan urunlerin tum bilgilerini listeleyiniz
SELECT * FROM musteriler WHERE urun_id<20 OR urun_id>30;

--2.yol
SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 30

--22-AGGREGATE FONKSİYONU 
CREATE TABLE calisanlar3 (
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

SELECT * FROM markalar;
SELECT * FROM calisanlar3;

--calisanlar3 tablosunda max maaşı görüntüleyiniz
SELECT MAX( maas) FROM calisanlar3

--calisanlar3 tablosunda min maaşı görüntüleyiniz
SELECT MIN( maas) FROM calisanlar3

--calisanlar3 tablosunda toplam maaşı görüntüleyiniz
SELECT SUM( maas) FROM calisanlar3

--calisanlar3 tablosunda ortalama maaşı görüntüleyiniz
SELECT AVG ( maas) FROM calisanlar3
SELECT ROUND (AVG ( maas),2) FROM calisanlar3 --ROUND değeri tam sayıya yuvarlar en son ,2 yazmamız 2 küsurat ile göstermesini sağlar

--calisanlar3 tablosunda kayıt sayısını görüntüleyiniz
SELECT COUNT(maas) FROM calisanlar3

--calisanlar3 tablosunda maaşı 2500 olanalrın sayısını görüntüleyiniz

SELECT COUNT(maas) FROM calisanlar3 WHERE maas=2500




