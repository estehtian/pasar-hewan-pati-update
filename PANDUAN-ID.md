# Panduan pemasangan

## 1. GitHub Pages
1. Backup repository `estehtian/pasar-hewan-pati-update`.
2. Salin isi `frontend/` ke repository. Gabungkan dengan desain/halaman yang sudah ada; jangan menimpa file lama sebelum backup.
3. Setelah backend aktif, ubah `frontend/assets/config.js` ke URL backend HTTPS.
4. Commit dan push. Jangan ubah DNS/domain yang sudah berjalan.

## 2. Database
1. Buat PostgreSQL 15+ pada penyedia hosting.
2. Jalankan `backend/database/schema.sql`.
3. Buat hash password admin di komputer lokal: `node -e "require('bcryptjs').hash('PASSWORD-KUAT-ANDA',12).then(console.log)"`.
4. Masukkan hash ke SQL:
   `INSERT INTO users(name,email,password_hash,role) VALUES ('Admin','email-anda','HASH_BCRYPT','admin');`

## 3. Backend
Di folder `backend/`: `npm install`, salin `.env.example` menjadi `.env`, isi nilainya, lalu `npm start`. Deploy backend ke layanan Node.js yang mendukung HTTPS, environment variables, dan proses server tetap aktif. Tes `GET /health`.

Environment: `DATABASE_URL`, `JWT_SECRET` (acak, minimal 32 karakter), `FRONTEND_ORIGIN`, `META_VERIFY_TOKEN`, `META_ACCESS_TOKEN`, `META_PHONE_NUMBER_ID`, `META_APP_SECRET`, `META_GRAPH_VERSION` (isi versi Graph API yang masih didukung Meta).

## 4. WhatsApp Cloud API
1. Buka https://developers.facebook.com/ dan buat/pilih aplikasi bisnis.
2. Tambahkan produk WhatsApp dan uji dulu dengan nomor tes Meta.
3. Ambil Phone Number ID dan access token dari WhatsApp API Setup.
4. Isi variabel Meta di environment backend, bukan di file frontend.
5. Callback URL webhook: `https://URL-BACKEND/webhooks/whatsapp`.
6. Verify token harus sama dengan `META_VERIFY_TOKEN`.
7. Verifikasi callback dan subscribe field `messages`.
8. Uji pesan masuk dan balasan. Webhook memeriksa `X-Hub-Signature-256`.

Dokumentasi resmi:
- https://developers.facebook.com/docs/whatsapp/cloud-api/get-started
- https://developers.facebook.com/docs/whatsapp/cloud-api/webhooks
- https://developers.facebook.com/docs/whatsapp/cloud-api/overview

## 5. Alur approval
Penjual daftar/login → kirim iklan → status `pending` → admin memeriksa → `active` atau `rejected`. Iklan pending/ditolak tidak muncul di katalog. Perubahan data oleh penjual mengembalikan iklan ke pending.

## 6. Sebelum produksi
Tambahkan rate limiting, validasi input lebih ketat, reset password, pagination, penyimpanan foto ke object storage, backup database, kebijakan privasi, pengujian hak akses, dan monitoring. Pesan template di luar jendela layanan pelanggan WhatsApp 24 jam perlu mengikuti aturan/template Meta yang berlaku. Biaya Meta dan hosting dapat berubah.
