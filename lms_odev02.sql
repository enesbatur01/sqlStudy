SELECT * FROM musteri
SELECT sehir FROM musteri WHERE meslek ='AVUKAT'
SELECT * FROM musteri WHERE cinsiyet ='K'
SELECT sehir FROM musteri WHERE cinsiyet ='K'
SELECT * FROM musteri WHERE yas BETWEEN 40 AND 50
SELECT meslek FROM musteri WHERE cinsiyet='E'
SELECT * FROM musteri WHERE yas NOT BETWEEN 30 AND 40
SELECT * FROM musteri WHERE yas BETWEEN 30 AND 40 AND cinsiyet='K' AND meslek='ÖĞRETMEN'
SELECT * FROM musteri WHERE yas NOT BETWEEN 30 AND 40 AND cinsiyet ='E' AND NOT meslek='AVUKAT'
SELECT * FROM musteri WHERE gelir BETWEEN 3000 AND 5000
DELETE FROM musteri WHERE isim='ALİ'
DELETE FROM musteri WHERE yas =60
DELETE FROM musteri WHERE meslek='KUAFÖR' AND cinsiyet = 'K'
DELETE FROM musteri WHERE gelir=6000 OR meslek ='TESİSATÇI'
DELETE FROM musteri
DROP TABLE tedarikciler3
DROP TABLE urunler