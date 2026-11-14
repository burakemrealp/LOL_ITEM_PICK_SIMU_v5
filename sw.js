const CACHE_NAME = 'lol-items-pwa-v21';
const CORE_ASSETS = [
    './',
    './index.html',
    './manifest.json',
    './apple-touch-icon.png',
    './icon-192.png',
    './icon-512.png'
];

self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME).then((cache) => cache.addAll(CORE_ASSETS))
    );
    self.skipWaiting();
});

self.addEventListener('activate', (event) => {
    event.waitUntil(
        caches.keys().then((keys) =>
            Promise.all(keys.map((k) => (k !== CACHE_NAME ? caches.delete(k) : null)))
        )
    );
    self.clients.claim();
});

self.addEventListener('fetch', (event) => {
    const req = event.request;
    if (req.method !== 'GET') return;

    event.respondWith(
        caches.match(req).then((cachedResp) => {
            if (cachedResp) return cachedResp;
            return fetch(req)
                .then((netResp) => {
                    if (netResp && (netResp.status === 200 || netResp.type === 'opaque')) {
                        const copy = netResp.clone();
                        caches.open(CACHE_NAME).then((cache) => cache.put(req, copy));
                    }
                    return netResp;
                })
                .catch(() => cachedResp);
        })
    );
});
