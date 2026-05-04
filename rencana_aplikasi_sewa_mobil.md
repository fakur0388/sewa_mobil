# Rencana Pembuatan Aplikasi Sewa Mobil (Flutter)

## 1) Ringkasan Proyek

Aplikasi mobile “Sewa Mobil” untuk membantu pengguna melakukan:

- Login & registrasi
- Melihat katalog mobil (menggunakan gambar yang tersedia di `assets/mobil-1.jpg` s.d. `assets/mobil-6.jpg`)
- Memilih mobil dan melihat detail
- Melakukan pemesanan (booking) berdasarkan tanggal/jam/jangka waktu
- (Opsional tahap lanjut) Kelola pesanan, pembayaran sederhana, dan histori

Aplikasi dibuat dengan Flutter (Material UI), dengan tampilan modern dan konsisten.

---

## 2) Assets yang Tersedia (akan dipakai dalam desain UI)

Dari folder `assets/` terdapat:

- `welcome-logo.jpg` → splash / halaman selamat datang
- `login-logo.jpg` → ilustrasi pada halaman login
- `register-logo.jpg` → ilustrasi pada halaman registrasi
- `mobil-1.jpg` → gambar mobil #1
- `mobil-2.jpg` → gambar mobil #2
- `mobil-3.jpg` → gambar mobil #3
- `mobil-4.jpg` → gambar mobil #4
- `mobil-5.jpg` → gambar mobil #5
- `mobil-6.jpg` → gambar mobil #6

> Catatan implementasi: `pubspec.yaml` saat ini belum menambahkan section `flutter: assets:`. Saat mulai implementasi UI, tambahkan semua path asset di sana supaya gambar bisa tampil.

---

## 3) Tujuan & Manfaat

### Tujuan Utama

1. Memberi pengalaman pengguna yang mudah untuk melihat pilihan mobil.
2. Memudahkan proses pemesanan dari katalog sampai konfirmasi.
3. Menyediakan struktur aplikasi yang rapi agar fitur bisa dikembangkan.

### Manfaat

- Pengguna dapat memilih mobil dengan cepat
- Admin/owner (tahap lanjut) bisa mengelola data mobil dan pesanan
- Data mobil & pesanan dapat dikelola terstruktur (model, layanan, dan state)

---

## 4) Pengguna (Personas) & User Stories

### Persona A — User / Pelanggan

- Sebagai pelanggan, saya ingin login agar pesanan tersimpan.
- Sebagai pelanggan, saya ingin melihat daftar mobil beserta foto dan harga.
- Sebagai pelanggan, saya ingin memilih mobil dan melakukan pemesanan.
- Sebagai pelanggan, saya ingin melihat status pesanan (diproses/selesai/dibatalkan).

### Persona B — Admin (Opsional Tahap Lanjut)

- Sebagai admin, saya ingin menambah/mengedit/menghapus mobil.
- Sebagai admin, saya ingin melihat daftar pesanan.

---

## 5) Ruang Lingkup Fitur (MVP -> Lanjutan)

### 5.1 MVP (Minimum Viable Product)

1. **Onboarding / Welcome**
   - Menampilkan `welcome-logo.jpg`
   - Tombol “Mulai” / “Login” / “Daftar”
2. **Autentikasi**
   - Halaman **Login** (pakai `login-logo.jpg`)
   - Halaman **Register** (pakai `register-logo.jpg`)
   - Validasi input (email/username, password)
3. **Katalog Mobil**
   - Grid atau list kartu mobil
   - Setiap kartu menampilkan:
     - foto mobil (mobil-1..6)
     - nama mobil
     - harga per hari/jam
4. **Detail Mobil**
   - Menampilkan informasi lebih lengkap (simulasi data awal)
   - Tombol “Pesan”
5. **Checkout/Pemesanan**
   - Pilih tanggal mulai & selesai (atau durasi)
   - Isi data tambahan (nama pemesan, nomor HP)
   - Tombol “Konfirmasi Pesanan”
6. **Halaman Riwayat Pesanan**
   - Menampilkan pesanan yang dibuat (lokal/preview)

> MVP dapat memakai data mock lokal dulu (list mobil & pesanan dalam memory / storage sederhana) sebelum integrasi backend.

### 5.2 Tahap Lanjutan (Jika Diperlukan)

- Integrasi backend (API REST / Firebase)
- Pembayaran (midtrans / snap / gateway)
- Status pesanan real-time
- Fitur rating & komentar
- Mode admin dashboard

---

## 6) Desain Informasi (Information Architecture)

Rute navigasi yang disarankan:

- `/` → WelcomeScreen
- `/login` → LoginScreen
- `/register` → RegisterScreen
- `/home` → Home / CatalogScreen
- `/car/:id` → CarDetailScreen
- `/checkout/:id` → CheckoutScreen
- `/orders` → OrdersScreen

> Untuk MVP, bisa memakai Navigator 1.0 sederhana atau `go_router`. Jika ingin rapi untuk banyak route, pertimbangkan `go_router`.

---

## 7) Rancangan Layar (Screen-by-Screen)

### 7.1 WelcomeScreen

**Komponen:**

- Image: `assets/welcome-logo.jpg`
- Judul: “Sewa Mobil”
- Deskripsi singkat
- Tombol: “Login” dan “Daftar”

**Kriteria UI:**

- Full-width image (fit: contain)
- Tombol kontras warna primary
- Spacing konsisten (padding 16-24)

---

### 7.2 LoginScreen

**Komponen:**

- Image: `assets/login-logo.jpg`
- Form:
  - Email / Username
  - Password
- Tombol “Masuk”
- Link: “Belum punya akun? Daftar”

**Validasi:**

- Email wajib diisi
- Password minimal panjang tertentu (mis. 6)
- Tampilkan error inline

---

### 7.3 RegisterScreen

**Komponen:**

- Image: `assets/register-logo.jpg`
- Form:
  - Nama / Username
  - Email
  - Password
- Tombol “Daftar”
- Link: “Sudah punya akun? Login”

**Validasi:**

- Email valid (pattern sederhana)
- Password min panjang

---

### 7.4 Home / CatalogScreen

**Komponen:**

- Search bar (opsional MVP)
- Grid/List CarCard:
  - Foto mobil: `mobil-1.jpg` s.d. `mobil-6.jpg`
  - Nama mobil
  - Harga
  - Tombol cepat “Detail” atau klik kartu

**Layout:**

- Grid 2 kolom untuk tablet/landscape, 1 kolom/2 kolom adaptif untuk mobile
- Gunakan `AspectRatio` untuk konsistensi foto

---

### 7.5 CarDetailScreen

**Komponen:**

- Hero image mobil
- Informasi:
  - Nama
  - Spesifikasi ringkas (opsional)
  - Harga per hari/jam
- Ringkasan syarat (mis. deposit/tersedia supir) bila diinginkan
- Tombol “Pesan”

---

### 7.6 CheckoutScreen

**Komponen:**

- Input:
  - Tanggal mulai
  - Tanggal selesai (atau durasi)
  - Nama pemesan
  - Nomor HP
- Ringkasan biaya:
  - Harga x durasi
  - Total
- Tombol “Konfirmasi Pesanan”

**Kriteria:**

- Tampilkan perhitungan total dengan jelas
- Validasi tanggal (tanggal selesai >= mulai)
- Tombol disabled saat form belum valid (opsional untuk UX)

---

### 7.7 OrdersScreen

**Komponen:**

- List pesanan:
  - Nama mobil
  - Tanggal
  - Status (mis. “Diproses”)
- Empty state: “Belum ada pesanan”

---

## 8) Model Data (Data Structure)

### 8.1 Model: Car

- `id` (int/string)
- `name` (String)
- `pricePerDay` (int)
- `imageAsset` (String) → contoh: `assets/mobil-1.jpg`
- `seats` (int, opsional)
- `type` (String, opsional)

### 8.2 Model: Order

- `id`
- `carId`
- `carNameSnapshot` (String) untuk menjaga konsistensi tampilan
- `startDate` / `endDate` (DateTime atau String ISO)
- `customerName`
- `customerPhone`
- `totalPrice`
- `status` (enum/string)

> Untuk MVP: gunakan data mock (hardcoded) dulu lalu nanti ubah ke backend.

---

## 9) Arsitektur Aplikasi (Rekomendasi)

### Struktur folder (contoh)

- `lib/`
  - `main.dart`
  - `ui/`
    - `screens/`
    - `widgets/`
  - `data/`
    - `mock_cars.dart`
    - `mock_orders.dart`
  - `models/`
    - `car.dart`
    - `order.dart`
  - `services/`
    - `auth_service.dart` (MVP: mock)
    - `order_service.dart` (MVP: in-memory)
  - `state/` atau `providers/`
    - (opsional) mis. `AuthController`, `CarController`, `OrderController`

### State management (pilih salah satu)

Untuk MVP sederhana:

- `setState` di level screen (minimal)
  Untuk struktur lebih rapi:
- `Provider` / `Riverpod` (direkomendasikan jika ingin skalabilitas)

> Karena `pubspec.yaml` saat ini hanya dependensi Flutter default + `cupertino_icons`, jika ingin memakai state management atau routing tambahan, tambahkan dependensi tersebut saat mulai implementasi.

---

## 10) Integrasi Aset ke Flutter (Checklist Implementasi)

Saat implementasi dimulai:

1. Tambahkan section assets di `pubspec.yaml`:
   - `assets/welcome-logo.jpg`
   - `assets/login-logo.jpg`
   - `assets/register-logo.jpg`
   - `assets/mobil-1.jpg` s.d. `assets/mobil-6.jpg`
2. Gunakan `Image.asset('assets/xxx.jpg')` pada widget

---

## 11) Rencana Implementasi Bertahap (Timeline)

### Fase 1 — Fondasi (1-2 hari)

- Rapikan struktur folder `lib/`
- Tambahkan assets ke `pubspec.yaml`
- Buat routing dasar dan layout theme

### Fase 2 — Auth (2 hari)

- WelcomeScreen
- LoginScreen + validasi
- RegisterScreen + validasi
- Mock auth state

### Fase 3 — Katalog & Detail (2 hari)

- Buat data model `Car` dan `mock_cars`
- Buat Home katalog + CarCard
- Buat CarDetailScreen

### Fase 4 — Checkout & Orders (2 hari)

- Checkout form
- Perhitungan total
- Simpan order (mock/in-memory)
- OrdersScreen + empty state

### Fase 5 — Finishing (1 hari)

- Perbaikan UI/spacing
- Responsive layout
- Review konsistensi warna & komponen
- Penulisan dokumentasi singkat

---

## 12) Checklist Kualitas (DoD - Definition of Done)

- [ ] Semua gambar dari `assets/` tampil benar (tidak broken)
- [ ] Tidak ada error build / hot reload
- [ ] Navigasi antar layar berfungsi
- [ ] Validasi form login/register/checkout berjalan
- [ ] Perhitungan total checkout konsisten
- [ ] OrdersScreen menampilkan data yang benar
- [ ] UI responsif minimal untuk 1 ukuran mobile kecil

---

## 13) Output yang Diharapkan

Setelah implementasi (berdasarkan rencana ini), aplikasi akan punya:

- Layar welcome, login, register
- Layar katalog dengan 6 mobil menggunakan gambar
- Layar detail mobil dan proses pemesanan
- Layar riwayat pesanan

---

## 14) Lampiran: Contoh Data Mock (Untuk MVP)

Contoh bentuk data yang disiapkan:

- Mobil 1: “Toyota Avanza” harga 400.000/hari, gambar `assets/mobil-1.jpg`
- Mobil 2: “Honda Brio” harga 350.000/hari, gambar `assets/mobil-2.jpg`
- dst sampai mobil-6

> Angka dan nama dapat disesuaikan dengan kebutuhan proyek/brand.

---

## 15) Catatan Penting

- Karena saat ini proyek masih template Flutter, perlu:
  - menambahkan assets di `pubspec.yaml`
  - mengganti `main.dart` dari contoh counter menjadi aplikasi penuh
  - menambahkan route/screens dan data mock
