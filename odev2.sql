CREATE TABLE musteri (
musteri_no SERIAL,
isim VARCHAR(50) NOT NULL CHECK (isim <> '' ),
yas int check(yas>18),
cinsiyet char(1),
gelir REAL,
meslek VARCHAR(20),
sehir VARCHAR(20),
CONSTRAINT musteri_pk PRIMARY KEY(musteri_no)
);

INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('ALİ',35,'E',2500,'MÜHENDİS','İSTANBUL');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('BURAK',   25, 'E', 3500, 'MİMAR',       'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('CEYHUN',  45, 'E', 2000, 'MÜHENDİS',    'ANKARA');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('DEMET',   30, 'K', 3000, 'ÖĞRETMEN',    'ANKARA');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('FERHAT',  40, 'E', 2500, 'MİMAR',       'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('GALİP',   55, 'E', 4000, 'ÖĞRETMEN',    'İSTANBUL');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('KÖKSAL',  25, 'E', 2000, 'AVUKAT',      'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('LEYLA',   60, 'K', 2500, 'MİMAR',       'İSTANBUL');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('MELEK',   30, 'K', 2500, 'ÖĞRETMEN',    'İSTANBUL');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('JALE',    40, 'K', 6000, 'İŞLETMECİ',   'ANKARA');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('TEKİN',   45, 'E', 2000, 'AVUKAT',      'ANKARA');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('SAMET',   20, 'E', 3000, 'MİMAR',       'İSTANBUL');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('ŞULE',    20, 'K', 4500, 'ÖĞRETMEN',    'İSTANBUL');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('VELİ',    40, 'E', 2500, 'ÖĞRETMEN',    'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('ZEYNEP',  50, 'K', 3500, 'TESİSATÇI',   'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('ARDA',    55, 'E', 2000, 'KUAFÖR',      'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('MELİS',   30, 'K', 3000, 'KUAFÖR',      'ANKARA');

SELECT * FROM musteri;

SELECT isim,meslek FROM musteri;

CREATE TABLE sehirler(
alan_kodu VARCHAR(20),
isim VARCHAR(20) NOT NULL,
nufus int,
CONSTRAINT sehirler_pk PRIMARY KEY(alan_kodu)	
);

CREATE TABLE tedarikciler3(
tedarikci_id int,
tedarikci_ismi VARCHAR(50),
iletisim_isim VARCHAR(50) UNIQUE,
CONSTRAINT tedarikciler3_pk PRIMARY KEY(tedarikci_id)	
);

CREATE TABLE urunler (
tedarikci_idd int,
urun_id int,
tedarikci_id int,	
CONSTRAINT urunler_fk FOREIGN KEY (tedarikci_idd) REFERENCES tedarikciler3(tedarikci_id) 
);











