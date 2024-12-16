# sql-notlarim
SQL notlarım

Bu repo, üniversitede Veritabanı yönetimi dersinde aldığım SQL notlardan oluşmaktadır.
1. Temel SQL Komutları

SQL dört temel dil yapısına ayrılır:

DDL (Data Definition Language): Veritabanı yapısını tanımlar. Yeni tablolar oluşturabilir, mevcut tablolarda değişiklik yapabilir ya da tabloları silebilirsiniz.

DML (Data Manipulation Language): Verilerle ilgili işlemleri yapar. Veri ekleme, güncelleme veya silme gibi işlemler bu gruba girer.

DCL (Data Control Language): Veritabanı yetkilendirme ve kontrol. Kullanıcılara farklı seviyelerde yetkiler verebilirsiniz.

TCL (Transaction Control Language): Transaction'ları kontrol eder. İşlemleri geri alma veya kesinleştirme gibi komutları içerir.

DDL Komutları

Tablo Oluşturma: CREATE

Yeni bir tablo oluşturmak için kullanılır.

CREATE TABLE ogrenciler (
    id INT PRIMARY KEY,
    isim VARCHAR(100),
    yas INT,
    sehir VARCHAR(50)
);

Açıklama: ogrenciler adında bir tablo oluşturduk.

id: Birincil anahtar (PRIMARY KEY), tablodaki her satırı benzersiz şekilde tanımlar.

isim: 100 karakter uzunluğunda bir metin alanı.

yas: Tamsayı bir değer.

sehir: 50 karakter uzunluğunda bir metin alanı. Öğrencinin yaşadığı şehri belirtir.

Tablo Değiştirme: ALTER

Var olan bir tabloyu değiştirmek için kullanılır. Yeni kolon eklemek veya var olan kolonları düzenlemek mümkündür.

ALTER TABLE ogrenciler ADD email VARCHAR(100);

Açıklama: ogrenciler tablosuna email adında bir kolon ekledik. Bu kolon, öğrencinin e-posta adresini saklayacak şekilde tasarlandı.

Tablo Silme: DROP

Tabloyu tamamen silmek için kullanılır.

DROP TABLE ogrenciler;

Açıklama: ogrenciler tablosunu tüm verileriyle birlikte kalıcı olarak sildik. Dikkat edilmesi gereken bir komut, geri alınamaz!

DML Komutları

Veri Eklemek: INSERT

Bir tabloya yeni veri eklemek için kullanılır.

INSERT INTO ogrenciler (id, isim, yas, sehir, email)
VALUES (1, 'Ahmet', 22, 'Istanbul', 'ahmet@example.com');

Açıklama: ogrenciler tablosuna yeni bir kayıt ekledik. Bu kayıtta id, isim, yas, sehir ve email bilgilerini doldurduk.

Veri Güncellemek: UPDATE

Mevcut bir veriyi güncellemek için kullanılır.

UPDATE ogrenciler SET yas = 23 WHERE id = 1;

Açıklama: id değeri 1 olan öğrencinin yaşını 23 olarak güncelledik. Bu işlem, yalnızca belirtilen koşulu sağlayan kayıt üzerinde değişiklik yapar.

Veri Silmek: DELETE

Tablodaki belirli bir veriyi silmek için kullanılır.

DELETE FROM ogrenciler WHERE id = 1;

Açıklama: id değeri 1 olan kaydı tablodan sildik. Bu işlem de dikkat gerektirir çünkü silinen veri geri getirilemez.

DCL Komutları

Kullanıcı Yetkisi Vermek: GRANT

Kullanıcılara belirli yetkiler tanımlamak için kullanılır.

GRANT SELECT, INSERT ON ogrenciler TO 'kullanici_adi';

Açıklama: kullanici_adi adlı kullanıcıya ogrenciler tablosunda veri görme ve ekleme yetkisi verdik. Yetkiler granüler şekilde tanımlanabilir.

Yetki Kaldırmak: REVOKE

Daha önce verilmiş yetkileri kaldırmak için kullanılır.

REVOKE INSERT ON ogrenciler FROM 'kullanici_adi';

Açıklama: kullanici_adi adlı kullanıcının ekleme yetkisini kaldırdık. Ancak veri görme yetkisi devam etmektedir.

TCL Komutları

Transaction Kaydetmek: COMMIT

Yapılan değişiklikleri kalıcı hale getirmek için kullanılır.

COMMIT;

Açıklama: Transaction'ı kesinleştirdik. Bu işlem, yapılan değişikliklerin kaydedilmesini sağlar ve geri alınamaz hale getirir.

Transaction'ı Geri Almak: ROLLBACK

Yapılan işlemleri geri almak için kullanılır.

ROLLBACK;

Açıklama: Henüz kaydedilmemiş değişiklikleri geri aldık. Bu komut, hatalı bir işlem sonrası veritabanını önceki durumuna döndürmek için kullanışlıdır.

2. Tablo Yapıları

Tablo yapıları, SQL'in temelini oluşturur. Verileri organize etmek ve ilişkileri tanımlamak için kullanılır.

Birincil Anahtar: PRIMARY KEY

Tablodaki her kaydın benzersiz olmasını sağlar. Her tablo yalnızca bir birincil anahtara sahip olabilir.

CREATE TABLE kitaplar (
    id INT PRIMARY KEY,
    kitap_adi VARCHAR(100),
    yazar VARCHAR(50)
);

Açıklama: kitaplar adında bir tablo oluşturduk. id alanı birincil anahtar olarak tanımlandı ve her kitabın benzersiz şekilde tanımlanmasını sağlar.

Yabancı Anahtar: FOREIGN KEY

Tablolar arasında ilişki kurmak için kullanılır. Bir yabancı anahtar, başka bir tablodaki birincil anahtarı referans alır.

CREATE TABLE odunc (
    id INT PRIMARY KEY,
    kitap_id INT,
    ogrenci_id INT,
    FOREIGN KEY (kitap_id) REFERENCES kitaplar(id),
    FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id)
);

Açıklama: odunc tablosu, kitaplar ve ogrenciler tablolarıyla ilişkilidir. Bu ilişki, ödünç alınan kitapların hangi öğrenciye ait olduğunu takip etmeyi sağlar.

3. SQL Sorguları

Sorgular, veritabanındaki veriyi çekmek, düzenlemek ve analiz etmek için kullanılır.

Basit Sorgular

SELECT * FROM ogrenciler;

Açıklama: ogrenciler tablosundaki tüm verileri getirir. Basit bir sorgu, tüm veriyi görüntülemek için kullanılır.

Koşullu Sorgular

SELECT * FROM ogrenciler WHERE yas > 20;

Açıklama: Yaşı 20'den büyük olan öğrencileri listeler. WHERE koşulu, sonuçları filtrelemek için kullanılır.

Gruplama ve Sıralama

SELECT sehir, COUNT(*) AS ogrenci_sayisi
FROM ogrenciler
GROUP BY sehir
ORDER BY ogrenci_sayisi DESC;

Açıklama: Şehirlere göre gruplandırıp, öğrenci sayısına göre azalan şekilde sıraladık. Bu sorgu, gruplama (GROUP BY) ve sıralama (ORDER BY) işlemlerini bir arada kullanır.

Diğer başlıklar ilerleyen adımlarda detaylandırılacaktır. Bu notlar sürekli güncellenmektedir ve eklemeler yapılacaktır.

