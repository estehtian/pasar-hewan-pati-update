# Endpoint utama
- `POST /api/auth/register` — registrasi penjual.
- `POST /api/auth/login` — login admin/penjual.
- `GET /api/animals` — katalog aktif publik saja.
- `GET /api/dashboard/summary` — statistik setelah login.
- `GET /api/animals/mine` — iklan milik penjual / semua iklan untuk admin.
- `POST /api/animals` — buat iklan, status otomatis pending.
- `PUT /api/animals/:id` — edit; edit oleh penjual kembali ke pending.
- `POST /api/admin/animals/:id/review` — admin setujui/tolak.
- `POST /api/whatsapp/send` — admin/staff mengirim pesan.
- `GET|POST /webhooks/whatsapp` — verifikasi dan menerima webhook Meta.

Fondasi awal belum mencakup upload foto cloud, pembayaran, CRM penuh, rate limiting, reset password, atau test otomatis. Tambahkan sebelum produksi.