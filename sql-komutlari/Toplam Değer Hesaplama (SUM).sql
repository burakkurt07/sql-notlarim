SELECT kategori, SUM(satis_miktari) AS toplam_satis  
FROM urunler  
GROUP BY kategori;
