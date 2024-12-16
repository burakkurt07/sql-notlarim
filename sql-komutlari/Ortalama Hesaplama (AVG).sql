SELECT marka, AVG(fiyat) AS ortalama_fiyat  
FROM araclar  
GROUP BY marka;
