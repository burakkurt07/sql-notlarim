SELECT ogrenciler.isim, kitaplar.kitap_adi  
FROM ogrenciler  
INNER JOIN odunc ON ogrenciler.id = odunc.ogrenci_id  
INNER JOIN kitaplar ON odunc.kitap_id = kitaplar.id;
