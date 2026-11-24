/* Service worker WARJO41 — Develop Program By (Fuad&Norman)
   Halaman: network-first (selalu versi terbaru, cadangan cache saat offline).
   Aset statis lokal: stale-while-revalidate. Data Supabase/API: tidak di-cache.
   Foto (/img/… dan storage Supabase): cache-first di cache terpisah, supaya tidak diunduh ulang. */
const CACHE = 'warjo41-v27';
const IMG = 'warjo41-img-v1'; // tidak ikut terhapus saat versi naik
const SHELL = ['/', '/index.html', '/demo-db.js', '/manifest.json', '/logo.jpg', '/banner-bg.jpg', '/fonts/poppins-bold.woff', '/icons/icon-192.png', '/icons/icon-512.png'];

self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(SHELL)).then(() => self.skipWaiting()));
});
self.addEventListener('activate', e => {
  e.waitUntil(caches.keys().then(ks => Promise.all(ks.filter(k => k !== CACHE && k !== IMG).map(k => caches.delete(k)))).then(() => self.clients.claim()));
});
self.addEventListener('fetch', e => {
  const req = e.request, url = new URL(req.url);
  if (req.method !== 'GET') return;
  const foto = (url.origin === location.origin && url.pathname.startsWith('/img/') && url.pathname !== '/img/ping')
    || (/\.supabase\.co$/.test(url.hostname) && url.pathname.includes('/storage/v1/object/public/') && !/\.(mp4|webm|mov)$/i.test(url.pathname));
  if (foto) { // cache-first: foto produk/logo/QRIS jarang berubah (nama file selalu baru saat diganti)
    e.respondWith(caches.open(IMG).then(c => c.match(req).then(hit => hit || fetch(req).then(r => { if (r.ok || r.type === 'opaque') c.put(req, r.clone()); return r; }))));
    return;
  }
  if (url.origin !== location.origin) return; // Supabase API, CDN, WA: langsung ke jaringan
  if (/\.(mp4|webm|mov)$/i.test(url.pathname)) return; // video: langsung ke jaringan (butuh Range/206 untuk iPhone)
  if (req.mode === 'navigate') {
    e.respondWith(fetch(req).then(r => { const c = r.clone(); caches.open(CACHE).then(x => x.put('/index.html', c)); return r; })
      .catch(() => caches.match('/index.html')));
    return;
  }
  e.respondWith(caches.match(req).then(hit => {
    const net = fetch(req).then(r => { if (r.ok) { const c = r.clone(); caches.open(CACHE).then(x => x.put(req, c)); } return r; }).catch(() => hit);
    return hit || net;
  }));
});
