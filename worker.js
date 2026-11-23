// WARJO41 — Cloudflare Worker (hybrid): halaman & aset dari Cloudflare, foto dari Supabase Storage
// lewat cache Cloudflare (/img/...), supaya bandwidth Supabase tidak terpakai berulang-ulang.
// Develop Program By (Fuad&Norman)
const SUPA_FOTO = 'https://cxudofsykdxrnowagwgb.supabase.co/storage/v1/object/public/foto/';
const SETAHUN = 'public, max-age=31536000, immutable';

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    if (url.pathname === '/img/ping') return new Response(null, { status: 204, headers: { 'cache-control': 'no-store' } });
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
