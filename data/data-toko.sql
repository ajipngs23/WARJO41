-- =====================================================================
-- DATA TOKO WARJO41 (disalin dari Warung Dini) (per 14 Nov 2026) — jalankan SETELAH schema-lengkap.sql
-- Isi: produk, tarif J&T manual, iklan, pengaturan toko.
-- Foto/video masih tersimpan di Supabase lama (xkwaudqodbcwjfdhrunu). Selama project lama
-- masih aktif, gambar tetap tampil. Untuk benar-benar mandiri: upload ulang lewat Admin.
-- =====================================================================
begin;
insert into public.products(nama,kategori,deskripsi,harga,harga_slof,harga_ball,isi_slof,isi_ball,berat_gram,stok,foto_url,aktif) values
('HS Matcha ice','Rekomendasi ','1 slop beda harga ',27000,260000,2630000,10,100,22,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794182470734-93071.jpg',true),
('Black Matcha Shiro','Umum','',35000,345000,3400000,10,100,22,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794182589874-93077.jpg',true),
('Black matcha Kuro','Umum','',35000,345000,3400000,10,100,22,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794182685903-93074.jpg',true),
('Tanda Tambah Guava','Umum','',26000,250000,2450000,10,100,22,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794182786249-93068.jpg',true),
('3vo matcha ','Rekomendasi ','Harga 1 slop lebih murah',26000,250000,2480000,10,100,22,16,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183036536-93084.jpg',true),
('Diplomat Hollow Berry rush','Umum','Harga 1 slop lebih murah',28000,275000,2730000,10,100,24,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183105095-93088.jpg',true),
('Diplomat Hollw Mango Rush','Umum','Harga 1 slop lebih murah',28000,275000,2730000,10,100,24,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183253434-93082.jpg',true),
('Wismilak Slim Berry Tea','Umum','Harga 1 slop lebih murah',19000,178000,1750000,10,100,26,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183410454-93091.jpg',true),
('Wismilak Slim Lychee Tea','Umum','Harga 1 slop lebih murah',19000,178000,1750000,10,100,26,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183472948-93108.jpg',true),
('Maxximil','Umum','Harga 1 slop lebih murah',25000,246000,2450000,10,100,22,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183510932-93112.jpg',true),
('Black ice Tea','Rekomendasi ','Harga 1 slop lebih murah ',25000,249000,2485000,10,100,24,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183554485-93105.jpg',true),
('Grow Guava','Rekomendasi ','Harga 1 slop lebih murah',24000,23400,2333000,10,100,20,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183631856-93128.jpg',true),
('Grow Watermelon ','Umum','Harga 1 slop lebih murah ',24000,234000,2333000,10,100,20,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183667601-93127.jpg',true),
('Aroma Max Apple','Umum','Harga 1 slop lebih murah ',12500,117000,1150000,10,100,26,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183705678-93124.jpg',true),
('Grow original ','Umum','Harga 1 slop lebih murah ',24000,234000,2333000,10,100,20,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183786844-93132.jpg',true),
('Tanda Tambah Watermelon ','Rekomendasi ','Harga 1 slop lebih murah ',26000,250000,2450000,10,100,22,78,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183820568-93133.jpg',true),
('Tanda Tambah Original ','Umum','Harga 1 slop lebih ',26000,250000,2450000,10,100,22,100,'https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/produk/1794183848872-93131.jpg',true);
insert into public.tarif_manual(kota,tarif_per_kg,etd) values
('Gresik',8000,'1-2 hari'),
('Surabaya',8000,'1-2 hari'),
('Sidoarjo',9000,'1-2 hari'),
('Malang',12000,'2-3 hari'),
('Jakarta',18000,'2-4 hari'),
('Bandung',19000,'2-4 hari')
on conflict (kota) do update set tarif_per_kg=excluded.tarif_per_kg, etd=excluded.etd;
insert into public.popups(judul,gambar_url,link,teks_tombol,aktif,mulai,selesai,urutan,posisi) values
('','https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/iklan/1794193933310-WhatsApp_Video_2026_11_09_at_10_06_19.mp4','','',true,'2026-11-09','2026-12-09',1,'baris'),
('','https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/iklan/1794193966575-WhatsApp_Video_2026_11_06_at_08_37_59.mp4','','',true,'2026-11-09','2026-12-09',0,'popup');
insert into public.settings(key,value) values
('alamat_toko','Prambon, Boboh, Kec. Menganti, Kabupaten Gresik, Jawa Timur'),
('bank_atas_nama','Moh fauzil adhim'),
('bank_nama','BRI'),
('bank_norek','620801004172504'),
('banner_url',''),
('hp_toko','081945507050'),
('link_pendek',''),
('logo_url',''),
('nama_toko','WARJO41'),
('origin_id','69597'),
('origin_nama','MENGANTI, MENGANTI, GRESIK, JAWA TIMUR, 61174'),
('qris_url',''),
('slogan','Lengkap, murah, ramah.'),
('tarif_default_per_kg','15000'),
('toko_lat','-7.261802'),
('toko_lng','112.567277'),
('wa_toko','6281945507050')
on conflict (key) do update set value=excluded.value;
commit;
