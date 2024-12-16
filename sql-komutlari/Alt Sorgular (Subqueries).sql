SELECT * FROM ogrenciler WHERE yas > (SELECT AVG(yas) FROM ogrenciler);
