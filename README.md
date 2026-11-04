# PASAR HEWAN PATI — paket dashboard + database + WhatsApp

Pilihan bisnis yang diterapkan:
- Admin dan penjual terdaftar dapat mengelola iklan.
- Penjual hanya dapat mengubah iklannya sendiri.
- Iklan baru dan perubahan dari penjual masuk status `pending`.
- Hanya admin yang dapat menyetujui/menolak.
- Katalog publik hanya menampilkan iklan `active`.

Arsitektur: GitHub Pages untuk frontend; backend Node.js/Express, PostgreSQL, dan webhook Meta di hosting terpisah dengan HTTPS. GitHub Pages tidak menjalankan API server/webhook.

Isi: `frontend/` (katalog dan dashboard), `backend/` (API, autentikasi, webhook, SQL), `PANDUAN-ID.md`.

Paket ini fondasi implementasi, belum tersambung ke akun Meta atau server Anda. Jangan memasukkan access token, App Secret, password DB, atau JWT secret ke GitHub atau chat.
