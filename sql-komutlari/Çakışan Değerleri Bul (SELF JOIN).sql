SELECT p1.proje_adi, p2.proje_adi  
FROM projeler p1  
JOIN projeler p2  
ON p1.personel_id = p2.personel_id  
WHERE p1.proje_id <> p2.proje_id;
