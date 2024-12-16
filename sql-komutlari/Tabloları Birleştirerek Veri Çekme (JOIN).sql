SELECT musteriler.isim, siparisler.siparis_tarihi, siparisler.tutar  
FROM musteriler  
JOIN siparisler  
ON musteriler.id = siparisler.musteri_id;
