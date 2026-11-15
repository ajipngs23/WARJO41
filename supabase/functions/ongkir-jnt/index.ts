// Supabase Edge Function: ongkir-jnt
// Proxy ke API RajaOngkir (Komerce): ongkir & lacak J&T + tarif GoSend (Delivery API).
// Secret:  BITESHIP_KEY (tarif GoSend/Gojek via Biteship)  ·  RAJAONGKIR_KEY (Shipping Cost)  ·  KOMERCE_DELIVERY_KEY (Delivery API, untuk GoSend;
//          bila kosong dicoba pakai RAJAONGKIR_KEY)
// Develop Program By Nurman Catra

const BASE = "https://rajaongkir.komerce.id/api/v1";
const DBASE = "https://api.collaborator.komerce.id/tariff/api/v1";
const BBASE = "https://api.biteship.com/v1";
const cors = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};
const json = (b: any, s = 200) => {
  console.log(JSON.stringify({ ok: b?.ok, error: b?.error ?? null, n: Array.isArray(b?.data) ? b.data.length : undefined })); // log status (tanpa key)
  return new Response(JSON.stringify(b), { status: s, headers: { ...cors, "Content-Type": "application/json" } });
};

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: cors });
  const key = Deno.env.get("RAJAONGKIR_KEY") || "";
  const dkey = Deno.env.get("KOMERCE_DELIVERY_KEY") || key;

  try {
    const body = await req.json();
    console.log("action", body?.action, "bkey", !!Deno.env.get("BITESHIP_KEY"), "dkey", !!dkey, "key", !!key);

    // ===== GoSend via Biteship (rates by coordinates) =====
    if (body.action === "biteship") {
      const bkey = Deno.env.get("BITESHIP_KEY") || "";
      if (!bkey) return json({ ok: false, error: "BITESHIP_KEY belum diset" });
      const num = (v: unknown) => Number(v);
      const [ola, olo, dla, dlo] = [num(body.origin_lat), num(body.origin_lng), num(body.dest_lat), num(body.dest_lng)];
      if (![ola, olo, dla, dlo].every((v) => isFinite(v) && v !== 0)) return json({ ok: false, error: "Koordinat tidak valid" });
      const r = await fetch(`${BBASE}/rates/couriers`, {
        method: "POST",
        headers: { authorization: bkey, "content-type": "application/json" },
        body: JSON.stringify({
          origin_latitude: ola, origin_longitude: olo, destination_latitude: dla, destination_longitude: dlo,
          couriers: "gojek",
          items: [{ name: "Pesanan WARJO41", value: Math.max(1, Math.round(num(body.value) || 1)), weight: Math.max(1, Math.round(num(body.weight) || 1000)), quantity: 1 }],
        }),
      });
      const d = await r.json().catch(() => ({}));
      const data = (d?.pricing || []).filter((x: any) => String(x.courier_code).toLowerCase() === "gojek").map((x: any) => ({
        service: x.courier_service_code, name: x.courier_service_name, price: x.price, duration: x.duration,
      }));
      return json({ ok: r.ok && d?.success !== false, data, error: r.ok && d?.success !== false ? null : d?.error || `HTTP ${r.status}` });
    }

    // ===== GoSend via Komerce Delivery API =====
    if (body.action === "dsearch" || body.action === "gosend") {
      if (!dkey) return json({ ok: false, error: "KOMERCE_DELIVERY_KEY belum diset" });
      const dsearch = async (q: string) => {
        const r = await fetch(`${DBASE}/destination/search?keyword=${encodeURIComponent(q)}`, { headers: { "x-api-key": dkey } });
        const d = await r.json().catch(() => ({}));
        return { ok: r.ok, data: (d.data || []) as any[], error: r.ok ? null : d?.meta?.message || `HTTP ${r.status}` };
      };
      if (body.action === "dsearch") {
        const q = String(body.q || "").trim();
        if (q.length < 3) { const t = await dsearch("jakarta"); return json({ ok: t.ok, data: [], error: t.error }); } // cek key
        return json(await dsearch(q));
      }
      // body: origin_id, dest_id | dest_keyword, origin_pin "lat,lng", dest_pin "lat,lng", weight (gram), item_value
      let dest = String(body.dest_id || "");
      if (!dest) {
        const kw = String(body.dest_keyword || "").trim();
        if (kw.length < 3) return json({ ok: false, error: "Isi kode pos / kecamatan penerima" });
        const s = await dsearch(kw);
        if (!s.ok) return json({ ok: false, error: s.error });
        if (!s.data.length) return json({ ok: false, error: "Wilayah penerima tidak ditemukan" });
        dest = String(s.data[0].id);
      }
      const pin = (v: unknown) => String(v || "").replace(/\s+/g, "");
      if (!/^-?\d+(\.\d+)?,-?\d+(\.\d+)?$/.test(pin(body.origin_pin)) || !/^-?\d+(\.\d+)?,-?\d+(\.\d+)?$/.test(pin(body.dest_pin)))
        return json({ ok: false, error: "Titik koordinat toko / penerima tidak valid" });
      const qs = new URLSearchParams({
        shipper_destination_id: String(body.origin_id || ""),
        receiver_destination_id: dest,
        weight: String(Math.max(0.1, Math.round((Number(body.weight) || 1000) / 100) / 10)), // kg
        item_value: String(Math.max(1, Math.round(Number(body.item_value) || 1))),
        cod: "no",
        origin_pin_point: pin(body.origin_pin),
        destination_pin_point: pin(body.dest_pin),
      });
      const r = await fetch(`${DBASE}/calculate?${qs}`, { headers: { "x-api-key": dkey } });
      const d = await r.json().catch(() => ({}));
      const data = (d?.data?.calculate_instant || []).map((x: any) => ({
        courier: x.shipping_name, service: x.service_name, cost: x.shipping_cost, cost_net: x.shipping_cost_net, etd: x.etd,
      }));
      return json({ ok: r.ok, dest_id: dest, data, error: r.ok ? null : d?.meta?.message || `HTTP ${r.status}` });
    }

    if (!key) return json({ ok: false, error: "RAJAONGKIR_KEY belum diset" }, 200);

    // 1) cari kota/kecamatan tujuan
    if (body.action === "search") {
      const q = String(body.q || "").trim();
      if (q.length < 3) return json({ ok: true, data: [] });
      const r = await fetch(`${BASE}/destination/domestic-destination?search=${encodeURIComponent(q)}&limit=10&offset=0`, {
        headers: { key },
      });
      const d = await r.json();
      return json({ ok: r.ok, data: d.data || [], error: r.ok ? null : d?.meta?.message });
    }

    // 2) hitung ongkir J&T
    if (body.action === "cost") {
      const form = new URLSearchParams({
        origin: String(body.origin),
        destination: String(body.destination),
        weight: String(Math.max(1, Math.round(body.weight || 1000))),
        courier: "jnt",
        price: "lowest",
      });
      const r = await fetch(`${BASE}/calculate/domestic-cost`, {
        method: "POST",
        headers: { key, "Content-Type": "application/x-www-form-urlencoded" },
        body: form,
      });
      const d = await r.json();
      const data = (d.data || []).map((x: any) => ({
        service: x.service, description: x.description, cost: x.cost, etd: x.etd,
      }));
      return json({ ok: r.ok, data, error: r.ok ? null : d?.meta?.message });
    }

    // 3) lacak resi J&T
    if (body.action === "track") {
      const awb = String(body.awb || "").trim().toUpperCase().replace(/\s+/g, "");
      if (!/^[A-Z0-9]{6,30}$/.test(awb)) return json({ ok: false, error: "Nomor resi tidak valid" });
      const qs = new URLSearchParams({ awb, courier: "jnt" });
      const r = await fetch(`${BASE}/track/waybill?${qs}`, {
        method: "POST",
        headers: { key, "Content-Type": "application/x-www-form-urlencoded" },
        body: qs,
      });
      const d = await r.json().catch(() => ({}));
      return json({ ok: r.ok && !!d?.data, data: d?.data || null, error: r.ok ? null : d?.meta?.message || `HTTP ${r.status}` });
    }

    return json({ ok: false, error: "action tidak dikenal" }, 400);
  } catch (e) {
    return json({ ok: false, error: String(e) }, 500);
  }
});
