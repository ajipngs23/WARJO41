// WARJO41 — Cloudflare Worker (hybrid): halaman & aset dari Cloudflare, foto dari Supabase Storage
// lewat cache Cloudflare (/img/...), supaya bandwidth Supabase tidak terpakai berulang-ulang.
// Develop Program By (Fuad&Norman)
const SUPA_FOTO = 'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/';
const SETAHUN = 'public, max-age=31536000, immutable';
const SUPA = 'https://cxudofsykdxrnowagwgb.supabase.co';
const ANON = 'sb_publishable_5z9BNrsp-XduyPw_aWJE_g_CiBLTprC'; // kunci publik (sama dengan di index.html)
const PUBLIK_TTL = 60; // detik — data katalog boleh telat maks 1 menit

// Data publik (pengaturan toko, produk aktif, iklan aktif, hadiah aktif) dalam 1 permintaan, di-cache Cloudflare.
async function dataPublik(ctx, segar) {
  const cache = caches.default, kunci = new Request('https://cache.warjo41/api/publik');
  if (!segar) { const hit = await cache.match(kunci); if (hit) return hit; }
  const ambil = q => fetch(SUPA + '/rest/v1/' + q, { headers: { apikey: ANON, authorization: 'Bearer ' + ANON } })
    .then(r => { if (!r.ok) throw new Error(q.split('?')[0] + ' ' + r.status); return r.json(); });
  const [settings, products, popups, rewards] = await Promise.all([
    ambil('settings?select=*'),
    ambil('products?select=*&aktif=eq.true&order=nama'),
    ambil('popups?select=*&aktif=eq.true&order=urutan'),
    ambil('rewards?select=*&aktif=eq.true&order=poin'),
  ]);
  const res = new Response(JSON.stringify({ t: Date.now(), settings, products, popups, rewards }), { headers: {
    'content-type': 'application/json; charset=utf-8', 'cache-control': `public, max-age=${PUBLIK_TTL}` } });
  ctx.waitUntil(cache.put(kunci, res.clone()));
  return res;
}

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    if (url.pathname === '/img/ping') return new Response(null, { status: 204, headers: { 'cache-control': 'no-store' } });
    if (url.pathname === '/api/publik' && request.method === 'GET') {
      try { return await dataPublik(ctx, url.searchParams.has('segar')); }
      catch (e) { return new Response(JSON.stringify({ error: String(e.message || e) }), { status: 502, headers: { 'content-type': 'application/json', 'cache-control': 'no-store' } }); }
    }
    if (url.pathname.startsWith('/img/') && request.method === 'GET') {
      const path = url.pathname.slice(5);
      if (!/^[\w\-./]+$/.test(path) || path.includes('..')) return new Response('Bad path', { status: 400 });
      const cache = caches.default;
      const kunci = new Request(url.origin + '/img/' + path, { method: 'GET' });
      let res = await cache.match(kunci);
      if (res) return res;
      const asli = await fetch(SUPA_FOTO + path, { cf: { cacheEverything: true, cacheTtl: 31536000 } });
      if (!asli.ok) return new Response('Not found', { status: asli.status === 400 ? 404 : asli.status, headers: { 'cache-control': 'no-store' } });
      res = new Response(asli.body, { status: 200, headers: {
        'content-type': asli.headers.get('content-type') || 'application/octet-stream',
        'cache-control': SETAHUN, 'access-control-allow-origin': '*' } });
      ctx.waitUntil(cache.put(kunci, res.clone()));
      return res;
    }
    return env.ASSETS.fetch(request);
  }
};
