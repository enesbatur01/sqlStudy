--------------DAY'7---------------------
--JOINS--BİRLEŞTİRME
--JOIN:ilişkili tablolarda ortak bir sütun baz alınarak(tipik olarak PK ve FK)
--bir veya daha fazla tablodaki sütunların birleştirilmesini sağlar.


CREATE TABLE sirketler(
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'IBM');
INSERT INTO sirketler VALUES(101, 'GOOGLE');
INSERT INTO sirketler VALUES(102, 'MICROSOFT');
INSERT INTO sirketler VALUES(103, 'APPLE');

CREATE TABLE siparis(
siparis_id int,
sirket_id int,
siparis_tarihi date
);
INSERT INTO siparis VALUES(11, 101, ' 2023-02-17');  
INSERT INTO siparis VALUES(22, 102, ' 2023-02-18');  
INSERT INTO siparis VALUES(33, 103, ' 2023-01-19');  
INSERT INTO siparis VALUES(44, 104, ' 2023-01-20');  
INSERT INTO siparis VALUES(55, 105, ' 2022-12-21');



--33-INNER JOIN:baz aldığımız sütundaki sadece ortak değerleri gösterir.

--iki tablodaki şirket id'si aynı olanların şirket id,şirket ismi,
--sipariş tarihini,sipariş idsini  listeleyiniz.

SELECT sirketler.sirket_id,sirket_isim,siparis_id,siparis_tarihi
FROM sirketler
INNER JOIN siparis
ON sirketler.sirket_id=siparis.sirket_id

SELECT sirketler.sirket_id,sirket_isim,siparis_id,siparis_tarihi
FROM siparis
INNER JOIN sirketler
ON siparis.sirket_id=sirketler.sirket_id

--NOT: INNER JOIN ile tablolardaki ortak kayıtlar birleştiği için tablo sırası farketmez.

SELECT * FROM siparis
SELECT * FROM sirketler

--34-LEFT JOIN:Sol tablodaki(ilk tablodaki) tüm verileri getirir.
   --RIGHT JOIN:Sağ tablodaki(ikinci tablodaki) tüm verileri getirir.

--şirketler tablosundaki tüm kayıtların şirket id,şirket ismi,
--sipariş tarihini,sipariş idsini  listeleyiniz.  

SELECT siparis.sirket_id,sirket_isim,siparis_id,siparis_tarihi
FROM sirketler RIGHT JOIN siparis
ON sirketler.sirket_id=siparis.sirket_id     
   
SELECT siparis.sirket_id,sirket_isim,siparis_id,siparis_tarihi
FROM siparis LEFT JOIN sirketler
ON sirketler.sirket_id=siparis.sirket_id    
   
--LEFT/RIGHT JOIN tablo sırası değiştirilerek birbirinin yerine kullanılabilir.

   
--35-FULL JOIN:iki tablodaki baz alınan sütundaki tüm kayıtları getirir.

SELECT sirketler.sirket_id AS sirketler_id,sirket_isim,
       siparis.sirket_id AS siparis_sirket_id,siparis_id,siparis_tarihi
FROM siparis FULL JOIN sirketler
ON sirketler.sirket_id=siparis.sirket_id   

--36-SELF JOIN : tablonun kendi içindeki bir sütunu baz alarak INNER JOIN yapılmasını sağlar. 

CREATE TABLE personeller  (
id int,
isim varchar(20),  
title varchar(60), 
yonetici_id int
);
INSERT INTO personeller VALUES(1, 'Ali Can', 'SDET',     2);
INSERT INTO personeller VALUES(2, 'Veli Cem', 'QA',      3);
INSERT INTO personeller VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO personeller VALUES(4, 'Fatma Can', 'CEO',    null);

SELECT * FROM personeller;

SELECT p.isim AS personel, m.isim AS yönetici 
FROM personeller p
INNER JOIN personeller m
ON p.yonetici_id=m.id

--37-LIKE Cond.:WHERE komutu ile kullanılır, 
--Sorgular belirli bir karakter dizisini(desen-pattern) kullanarak filtreleme yapmamızı sağlar
--ILIKE:LIKE gibi ancak CASE INSENSITIVE dir.


CREATE TABLE words
( 
  word_id int UNIQUE,
  word varchar(50) NOT NULL,
  number_of_letters int
);

INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'Hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selim', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
INSERT INTO words VALUES (1009, 'hAt', 3);
INSERT INTO words VALUES (1010, 'yaf', 5);
INSERT INTO words VALUES (1011, 'ahata', 3);

SELECT * FROM words;

SELECT * FROM developers

SELECT * FROM developers WHERE name = 'Enes Can'

--wildcard (Joker : %) --> 0 veya daha fazla karakter

--developers tablosunda ismi E ile başlayanları listeleyiniz

SELECT * FROM developers WHERE name LIKE 'E%'

SELECT * FROM developers WHERE name ILIKE 'e%'

--a harfi ile biten şehirde çalışan dev isimlerini ve şehirlerini yazdiran QUERY yazin

SELECT name,city 
FROM developers
WHERE city LIKE '%a'

--Ismi T ile başlayıp n harfi ile biten dev isimlerini ve maaşlarını yazdiran QUERY yazin

SELECT name,salary 
FROM developers
WHERE name LIKE 'T%n'

--Ismi içinde 'an' olan dev isimlerini ve maaşlarını yazdiran QUERY yazin

SELECT name,salary 
FROM developers
WHERE name LIKE '%an%'

--Ismi içinde e ve a olan devlerin tüm bilgilerini yazdiran QUERY yazin

SELECT * 
FROM developers
WHERE name ILIKE '%e%a%' OR name ILIKE '%a%e%'

SELECT * 
FROM developers
WHERE name ILIKE '%e%' AND name ILIKE '%a%'

--al?

--underscore (_): 1 tane karakteri temsil eder

--Isminin ikinci harfi ü olan devlerin tum bilgilerini yazdiran QUERY yazin

SELECT *
FROM developers
WHERE name ILIKE '_ü%'

--Kullandığı prog. dili 4 harfli ve üçüncü harfi v olan devlerin tum bilgilerini yazdiran QUERY yazin

SELECT *
FROM developers
WHERE prog_lang ILIKE '__v_'

--Kullandığı prog. dili en az 5 harfli ve ilk harfi J olan devlerin tum bilgilerini yazdiran QUERY yazin.ÖDEVVV
--HINT:sadece JavaScript olacak
SELECT * FROM developers WHERE prog_lang ILIKE 'J____%'
--Isminin 2. harfi e,4. harfi i olan devlerin tum bilgilerini yazdiran QUERY yazin. ÖDEVV
SELECT * FROM developers WHERE name ILIKE '_e_i%'
--ismi boşluk içeren devlerin tum bilgilerini yazdiran QUERY yazin:ÖDEVVVV
SELECT * FROM developers WHERE name ILIKE '% %'


--37-REGEXP_LIKE(~):belirli bir karakter desenini içeren dataları regex
--kullanarak filtrelememizi sağlar


--[] : içerisindeki  harflerden en az birini temsil eder

--words tablosu çalışalım
--h harfinden sonra a veya i harfini sonra ise t harfini 
--içeren kelimelerin tum bilgilerini yazdiran QUERY yaziniz.


SELECT *
FROM words
WHERE word ~ 'h[ai]t'--hat,hit

SELECT *
FROM words
WHERE word ~* 'h[ai]t'--hat,hit INSENSITIVE

--küçük büyük harf olmasın istersek * işaretide kullanırız

--[-]:iki harf arasındaki harflerden birini temsil eder

--h harfinden sonra, a ile k arasindaki harflerden birini, sonra da t harfini
-- içeren kelimelerin tum bilgilerini  yazdiran QUERY yaziniz.

SELECT *
FROM words
WHERE word ~* 'h[a-k]t'--hat,hbt,hct

-- Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM words WHERE word ~* '[mi]'

--^:başlangıcı gösterir, $:bitişi gösterir
--a ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM words
WHERE word ~* '^a'

--a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM words WHERE word ~* '^[as]'

--m biten kelimelerin tum bilgilerini yazdiran QUERY yazin

SELECT *
FROM words
WHERE word ~* 'm$'

-- (.*)-->0 veya daha fazla karakteri temsil eder
--   . -->sadece 1 karakteri temsil eder

--y ile başlayıp f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin

SELECT *
FROM words
WHERE word ~* '^y.*f$'--yf

SELECT *
FROM words
WHERE word ~* '^y(.*)f$'--yf

--y ile başlayıp f ile biten 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin

SELECT *
FROM words
WHERE word ~* '^y.f$'

--NOT LIKE:verilen karakter desenine benzemeyenleri filtreler
-- !~     :verilen karakter desenine benzemeyenleri filtreler

-- ilk harfi h veya H olmayan kelimelerin tum bilgilerini yazdiran QUERY yaziniz.

SELECT *
FROM words
WHERE word NOT ILIKE 'h%'

SELECT *
FROM words
WHERE word !~* '^h'

--2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin.ÖDEV

SELECT * FROM words
WHERE word !~* '_[eio]'







