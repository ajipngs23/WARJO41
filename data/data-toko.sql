-- =====================================================================
-- DATA TOKO WARJO41 — cadangan per 16 Nov 2026 (produk, tarif, iklan, pengaturan)
-- Jalankan SETELAH schema-lengkap.sql. Tidak berisi data member/pesanan.
-- Foto produk/logo/QRIS masih menunjuk ke storage Supabase WARJO41 (cxudofsykdxrnowagwgb).
-- Develop Program By (Fuad&Norman)
-- =====================================================================
begin;

insert into public.products(nama,kategori,deskripsi,harga,harga_slof,harga_ball,isi_slof,isi_ball,berat_gram,stok,foto_url,aktif) values
('TOLAK MISKIN ES KOPI','Umum','',12000,110000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794673702225-IMG_0260.jpg',true),
('GG INTERNATIONAL KRETEK','Umum','',19000,null,null,10,100,10,50,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674084492-IMG_0204.jpg',true),
('DUNHILL KRETEK12','Umum','',15000,null,null,10,100,10,30,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674264015-IMG_0197.jpg',true),
('TEN MILD BERRY','Umum','',27000,null,null,10,100,100,0,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674332513-IMG_0219.jpg',true),
('JUARA COKLAT','Umum','',15000,140000,null,10,100,10,0,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674548306-IMG_0617.jpg',true),
('STARMILD','Umum','',27000,null,null,10,100,10,0,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674582165-IMG_0616.jpg',true),
('ONLINE ES TELER','Umum','',25000,239000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674644593-IMG_0614.jpg',true),
('AMILD 50','Umum','',105000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674708306-IMG_0613.jpg',true),
('FORTE APPLE','Umum','',29000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797063746-IMG_0656.jpg',true),
('BLACK ICETEA','Umum','',26000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796992913-IMG_0654.jpg',true),
('HS MATCHA ICE','Umum','',27000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797377967-IMG_0660.jpg',true),
('URBANMILD WATERMELON','Umum','',25000,240000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796661494-IMG_0650.jpg',true),
('GROW TROPICAL','Umum','',24000,230000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797312044-IMG_0659.jpg',true),
('GROW CANDY','Umum','',24000,230000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797324679-IMG_0657.jpg',true),
('CIGARILLOS 6BATANG','Umum','',15000,140000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796475849-IMG_0646.jpg',true),
('3VO SLEEK MANGGA APEL','Umum','',35000,340000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796515609-IMG_0649.jpg',true),
('AROMA LEMON TEA','Umum','',27000,null,null,10,100,10,50,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796576155-IMG_0647.jpg',true),
('AROMA BERRY TEA','Umum','',27000,null,null,10,100,10,50,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796640420-IMG_0648.jpg',true),
('MLD FRESH COLA','Umum','',32000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797209128-IMG_0651.jpg',true),
('BENTOEL SJT','Umum','',12000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796897852-IMG_0653.jpg',true),
('FORTE MELON','Umum','',29000,null,null,10,100,10,39,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797192509-IMG_0655.jpg',true),
('CAMEL ICE LIME','Umum','',27000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794798748669-IMG_0662.jpg',true),
('CAPRA','Umum','',27000,260000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794799228622-IMG_0664.jpg',true);

insert into public.tarif_manual(kota,tarif_per_kg,etd) values
('Bandung',19000,'2-4 hari'),
('Gresik',8000,'1-2 hari'),
('Jakarta',18000,'2-4 hari'),
('Malang',12000,'2-3 hari'),
('Sidoarjo',9000,'1-2 hari'),
('Surabaya',8000,'1-2 hari')
on conflict (kota) do update set tarif_per_kg=excluded.tarif_per_kg, etd=excluded.etd;

insert into public.popups(judul,gambar_url,link,teks_tombol,aktif,mulai,selesai,urutan,posisi) values
('','https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/iklan/1794193933310-WhatsApp_Video_2026_11_09_at_10_06_19.mp4','','',true,'2026-11-09','2026-12-09',1,'baris'),
('','https://xkwaudqodbcwjfdhrunu.supabase.co/storage/v1/object/public/foto/iklan/1794193966575-WhatsApp_Video_2026_11_06_at_08_37_59.mp4','','',true,'2026-11-09','2026-12-09',0,'popup');

insert into public.settings(key,value) values
('alamat_toko','Jl. Sidotopo Wetan No.43, Sidotopo Wetan, Kec. Kenjeran, Surabaya, Jawa Timur 60153'),
('bank_atas_nama',''),
('bank_nama',''),
('bank_norek',''),
('banner_url','https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/iklan/1794803668044-54374E27_FA22_4506_9791_62FDEB491B1A.jpg'),
('bayar_qris','1'),
('bayar_transfer','0'),
('gosend_aktif','1'),
('gosend_mode','estimasi'),
('hp_toko','085353100764'),
('link_pendek','https://warjo41.ajipngs23.workers.dev'),
('logo_url','https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/logo/1794803731997-216612FD_561A_45FC_8680_3B490C39605F.jpg'),
('nama_toko','WARJO41'),
('origin_id','69260'),
('origin_nama','SIDOTOPO/SIDOROPO WETAN, KENJERAN, SURABAYA, JAWA TIMUR, 60128'),
('qris_url','https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/qris/1794673258509.jpeg'),
('slogan','WONG JOWO OJOK ILANG JOWONE'),
('tarif_default_per_kg','15000'),
('tema_arah','120'),
('tema_gradasi','1'),
('tema_warna','#212121'),
('tema_warna2','#757575'),
('toko_lat','-7.232652718530391'),
('toko_lng','112.75736654801659'),
('wa_toko','6285353100764')
on conflict (key) do update set value=excluded.value;

commit;
