-- Database: deneme

-- DROP DATABASE IF EXISTS deneme;

CREATE DATABASE deneme
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Turkish_Turkey.1254'
    LC_CTYPE = 'Turkish_Turkey.1254'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	CREATE TABLE tedarikciler (
	tedarikci_id char(4),
	tedarikci_ismi varchar(20),
	tedarikci_adres varchar(30),
	ulasım_tarihi DATE	
	);
	
	select * from tedarikciler;
	
	create table tedarikci_info as select tedarikci_ismi, tedarikci_adres from tedarikciler;
	
	select * from tedarikci_info;
	
	
	
	
	