-- =====================================================================
-- DATA TOKO WARJO41 — cadangan per 24 Nov 2026 (49 produk, tarif, iklan, pengaturan)
-- Jalankan SETELAH schema-lengkap.sql. Tidak berisi data member/pesanan.
-- Foto produk/logo/QRIS menunjuk ke storage Supabase WARJO41 (cxudofsykdxrnowagwgb).
-- Develop Program By (Fuad&Norman)
-- =====================================================================
begin;

insert into public.products(nama,kategori,deskripsi,harga,harga_slof,harga_ball,isi_slof,isi_ball,berat_gram,stok,foto_url,aktif,created_at) values
('TOLAK MISKIN ES KOPI','Umum','',12000,110000,null,10,100,10,50,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794673702225-IMG_0260.jpg',true,'2026-11-14T16:28:22.947119+00:00'),
('GG INTERNATIONAL KRETEK','Umum','',19000,null,null,10,100,10,49,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674084492-IMG_0204.jpg',true,'2026-11-14T16:34:45.589464+00:00'),
('DUNHILL KRETEK12','Umum','',15000,null,null,10,100,10,30,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674264015-IMG_0197.jpg',true,'2026-11-14T16:37:44.960266+00:00'),
('TEN MILD BERRY','Umum','',27000,null,null,10,100,100,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674332513-IMG_0219.jpg',true,'2026-11-14T16:38:53.03066+00:00'),
('JUARA COKLAT','Umum','',15000,140000,null,10,100,10,20,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674548306-IMG_0617.jpg',true,'2026-11-14T16:42:28.988526+00:00'),
('STARMILD','Umum','',27000,null,null,10,100,10,50,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674582165-IMG_0616.jpg',true,'2026-11-14T16:43:02.775686+00:00'),
('ONLINE ES TELER','Umum','',25000,239000,null,10,100,10,99,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674644593-IMG_0614.jpg',true,'2026-11-14T16:44:05.219976+00:00'),
('AMILD 50','Umum','',105000,400000,null,4,100,10,96,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794674708306-IMG_0613.jpg',true,'2026-11-14T16:45:09.638281+00:00'),
('FORTE APPLE','Umum','',29000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797063746-IMG_0656.jpg',true,'2026-11-14T17:00:50.847525+00:00'),
('BLACK ICETEA','Umum','',26000,null,null,10,100,10,0,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796992913-IMG_0654.jpg',true,'2026-11-14T17:01:25.859944+00:00'),
('HS MATCHA ICE','Umum','',27000,null,null,10,100,10,97,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797377967-IMG_0660.jpg',true,'2026-11-14T17:01:59.158422+00:00'),
('URBANMILD WATERMELON','Umum','',25000,240000,null,10,100,10,99,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796661494-IMG_0650.jpg',true,'2026-11-14T17:02:37.166611+00:00'),
('GROW TROPICAL','Umum','',24000,230000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797312044-IMG_0659.jpg',true,'2026-11-14T17:03:20.760439+00:00'),
('GROW CANDY','Umum','',24000,230000,null,10,100,10,99,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797324679-IMG_0657.jpg',true,'2026-11-14T17:03:55.396837+00:00'),
('CIGARILLOS 6BATANG','Umum','',15000,140000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796475849-IMG_0646.jpg',true,'2026-11-16T02:34:36.858486+00:00'),
('3VO SLEEK MANGGA APEL','Umum','',35000,340000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796515609-IMG_0649.jpg',true,'2026-11-16T02:35:16.221088+00:00'),
('AROMA LEMON TEA','Umum','',27000,null,null,10,100,10,49,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796576155-IMG_0647.jpg',true,'2026-11-16T02:36:16.863477+00:00'),
('AROMA BERRY TEA','Umum','',27000,null,null,10,100,10,49,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796640420-IMG_0648.jpg',true,'2026-11-16T02:36:57.122492+00:00'),
('MLD FRESH COLA','Umum','',32000,null,null,10,100,10,99,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797209128-IMG_0651.jpg',true,'2026-11-16T02:38:52.285808+00:00'),
('BENTOEL SJT','Rekomendasi','',12000,null,null,10,100,10,88,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794796897852-IMG_0653.jpg',true,'2026-11-16T02:41:38.439196+00:00'),
('FORTE MELON','Umum','',29000,null,null,10,100,10,38,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794797192509-IMG_0655.jpg',true,'2026-11-16T02:44:44.085979+00:00'),
('CAMEL ICE LIME','Umum','',27000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794798748669-IMG_0662.jpg',true,'2026-11-16T03:12:29.581592+00:00'),
('CAPRA','Umum','',27000,260000,null,10,100,10,99,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794799228622-IMG_0664.jpg',true,'2026-11-16T03:20:29.412533+00:00'),
('CAMEL BANANA','Umum','',20000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794887407548-IMG_0668.jpg',true,'2026-11-17T03:50:08.313385+00:00'),
('DIPLOMAT X PERUNGGU BERRY','Umum','',27000,260000,null,10,100,10,98,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794909103896-IMG_0701.jpg',true,'2026-11-17T09:51:45.499456+00:00'),
('DIPLOMAT X PERUNGGU MILD','Umum','',27000,260000,null,10,100,10,98,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794909143522-IMG_0702.jpg',true,'2026-11-17T09:52:24.1498+00:00'),
('WISMILAK KLIK MELON','Umum','',15000,140000,null,10,100,10,93,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794999226275-IMG_0752.jpg',true,'2026-11-17T09:53:16.481769+00:00'),
('TANDA TAMBAH SEMANGKA','Umum','',26000,null,null,10,100,10,0,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794909473515-IMG_0704.jpg',true,'2026-11-17T09:57:55.391648+00:00'),
('TANDA TAMBAH JAMBU','Umum','',26000,null,null,10,100,10,0,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794909506715-IMG_0705.jpg',true,'2026-11-17T09:58:27.382272+00:00'),
('MAXXIMIL','Umum','',25000,240000,null,10,100,10,35,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794969827118-IMG_0719.jpg',true,'2026-11-18T02:43:49.340035+00:00'),
('BLACK MATCHA KURO','Umum','',35000,null,null,10,100,10,50,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794969887041-IMG_0721.jpg',true,'2026-11-18T02:44:47.697301+00:00'),
('BLACK MATCHA SHIRO','Umum','',35000,null,null,10,100,10,98,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794969937503-IMG_0722.jpg',true,'2026-11-18T02:45:38.131021+00:00'),
('JUARA PISANG SUSU','Umum','',15000,140000,null,10,100,10,97,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794969981788-IMG_0723.jpg',true,'2026-11-18T02:46:24.102339+00:00'),
('WISMILAK KLIK APEL','Umum','',15000,140000,null,10,100,10,97,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794999212089-IMG_0751.jpg',true,'2026-11-18T02:49:46.557497+00:00'),
('DJARUM EXTRA MOCCA','Umum','',20000,null,null,10,100,10,0,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794998333723-IMG_0206.jpg',true,'2026-11-18T10:38:54.627117+00:00'),
('X-PERT MIX BERRY','Umum','',24000,230000,null,10,100,10,55,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1794999272100-IMG_0753.jpg',true,'2026-11-18T10:54:33.50387+00:00'),
('3VO ICETEA','Umum','',25000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795064602420-IMG_0763.jpg',true,'2026-11-19T05:03:23.115738+00:00'),
('3VO BERRYTEA','Umum','',25000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795064636077-IMG_0764.jpg',true,'2026-11-19T05:03:56.733649+00:00'),
('3VO LYCHEETEA','Umum','',25000,null,null,10,100,10,99,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795064719144-IMG_0765.jpg',true,'2026-11-19T05:05:20.052113+00:00'),
('DIPLOMAT MILD MATCHA','Umum','',27000,null,null,10,100,10,99,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795168847557-IMG_0806.jpg',true,'2026-11-20T10:00:50.289685+00:00'),
('ALVA ','Umum','',10000,90000,null,10,100,10,50,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795253707913-IMG_0828.jpg',true,'2026-11-21T09:35:08.828693+00:00'),
('LAMBORGHINI RED','Umum','',26000,250000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795254051508-IMG_0830.jpg',true,'2026-11-21T09:40:52.648825+00:00'),
('LAMBORGHINI BLUE','Umum','',26000,250000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795254085440-IMG_0829.jpg',true,'2026-11-21T09:41:26.820359+00:00'),
('TWIZZ INTERNATIONAL','Umum','',29000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795320059504-IMG_0203.jpg',true,'2026-11-22T04:01:00.813646+00:00'),
('DJITOE WATERMELON','Umum','',25000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795411480173-IMG_0866.jpg',true,'2026-11-23T05:24:41.088971+00:00'),
('DJITOE MILKY BANANA','Umum','',25000,null,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795411509184-IMG_0867.jpg',true,'2026-11-23T05:25:10.173047+00:00'),
('DIPLOMAT HOLLOW BERRY','Umum','',28000,270000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795411988255-IMG_0868.jpg',true,'2026-11-23T05:33:10.221743+00:00'),
('DIPLOMAT HOLLOW MANGGA','Umum','',28000,270000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795412037579-IMG_0869.jpg',true,'2026-11-23T05:33:58.866448+00:00'),
('76 AKSARA','Umum','',15000,139000,null,10,100,10,100,'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/produk/1795412167715-IMG_0871.jpg',true,'2026-11-23T05:36:09.590447+00:00');

insert into public.tarif_manual(kota,tarif_per_kg,etd) values
('Gresik',8000,'1-2 hari'),
('Surabaya',6000,'1-2 hari'),
('Sidoarjo',9000,'1-2 hari'),
('Malang',9000,'2-3 hari'),
('Jakarta',14000,'2-3 hari'),
('Bandung',19000,'2-4 hari')
on conflict (kota) do update set tarif_per_kg=excluded.tarif_per_kg, etd=excluded.etd;

-- video iklan disimpan di repo (folder iklan/), dilayani Cloudflare
insert into public.popups(judul,gambar_url,link,teks_tombol,aktif,mulai,selesai,urutan,posisi) values
('','/iklan/baris-1.mp4','','',true,'2026-11-09',null,1,'baris'),
('','/iklan/popup-1.mp4','','',true,'2026-11-23',null,0,'popup'),
('','/iklan/baris-2.mp4','','',true,'2026-11-23',null,2,'baris');

insert into public.settings(key,value) values
('nama_toko','WARJO41'),
('link_pendek','https://warjo41.ajipngs23.workers.dev'),
('slogan','WONG JOWO OJOK ILANG JOWONE'),
('wa_toko','6285353100764'),
('hp_toko','085353100764'),
('alamat_toko','Jl. Sidotopo Wetan No.43, Sidotopo Wetan, Kec. Kenjeran, Surabaya, Jawa Timur 60153'),
('toko_lat','-7.232652718530391'),
('toko_lng','112.75736654801659'),
('origin_id','69260'),
('origin_nama','SIDOTOPO/SIDOROPO WETAN, KENJERAN, SURABAYA, JAWA TIMUR, 60128'),
('tarif_default_per_kg','15000'),
('gosend_aktif','1'),
('tema_warna','#212121'),
('tema_warna2','#757575'),
('tema_gradasi','1'),
('tema_arah','120'),
('logo_url','https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/logo/1794803731997-216612FD_561A_45FC_8680_3B490C39605F.jpg'),
('banner_url','https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/iklan/1794803668044-54374E27_FA22_4506_9791_62FDEB491B1A.jpg'),
('bayar_transfer','0'),
('bank_nama',''),
('bank_norek',''),
('bank_atas_nama',''),
('bayar_qris','1'),
('qris_url','https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/qris/1794673258509.jpeg'),
('gosend_tarif_dasar','10000'),
('gosend_km_dasar','3'),
('gosend_per_km','3000'),
('gosend_maks_km','25'),
('gosend_berat_maks','20'),
('gosend_mode','estimasi'),
('gosend_origin_id',''),
('gosend_origin_nama','')
on conflict (key) do update set value=excluded.value;

commit;
