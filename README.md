# PASAR HEWAN PATI — Website Multi-Halaman FUTURE 3000

Paket statis HTML/CSS/JavaScript untuk GitHub Pages. Tampilan dark forest green, neon teal, dan gold dengan navigasi responsif.

## Isi paket
- `index.html` — Beranda
- `kategori.html` — Kategori ternak
- `katalog.html` — Katalog dengan pencarian dan filter demo
- `layanan.html` — Layanan
- `wilayah.html` — Cakupan wilayah
- `kemitraan.html` — Kemitraan
- `panduan.html` — Panduan transaksi
- `tentang.html` — Tentang platform
- `kontak.html` — Kontak dan formulir WhatsApp (belum backend)
- `assets/style.css`, `assets/script.js`

## Cara update di GitHub
1. Unduh ZIP lalu ekstrak di komputer.
2. Buka repository GitHub tujuan, tab **Code**. Pastikan Anda berada di branch yang saat ini dipakai untuk GitHub Pages.
3. Pilih **Add file → Upload files**.
4. Unggah seluruh isi folder paket ini, bukan folder pembungkus `pasar-hewan-pati-update` jika itu membuat `index.html` berada satu tingkat di bawah root. Struktur yang benar: `index.html`, `kategori.html`, dan folder `assets/` terlihat langsung pada root repository.
5. Isi pesan commit, misalnya `Update PASAR HEWAN PATI multi-page website`, lalu pilih **Commit changes** ke branch aktif.
6. Buka **Settings → Pages** dan hanya periksa status deployment. Jangan ubah Custom domain, DNS, nameserver, atau sumber Pages yang sudah berjalan kecuali memang diperlukan.
7. Setelah deployment selesai, uji halaman utama dan semua menu.

## Sebelum dipublikasikan
- Listing, foto, wilayah, dan harga di katalog adalah **contoh/demo**, bukan penawaran nyata. Ganti dengan data aktual yang telah diverifikasi.
- Atur nomor WhatsApp resmi pada `assets/script.js`, variabel `WHATSAPP_NUMBER`, memakai format angka internasional tanpa `+`, spasi, atau tanda hubung. Contoh format: `62812...` (gunakan nomor milik pengelola yang telah menyetujui publikasi).
- Formulir kontak belum memakai backend/database; data tidak disimpan oleh website.
- Foto hero dan contoh katalog memuat URL gambar Unsplash sehingga membutuhkan koneksi internet. Ganti dengan foto asli yang memiliki izin penggunaan sebelum produksi.
- Paket ini tidak mengubah DNS, domain, sertifikat SSL, maupun konfigurasi GitHub Pages.

## Catatan
Website ini merupakan situs statis. Untuk akun pengguna, dashboard admin, upload listing, database, pembayaran, verifikasi otomatis, atau chat internal dibutuhkan backend dan layanan tambahan.
