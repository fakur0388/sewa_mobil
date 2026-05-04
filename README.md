# Sewa Mobil - Aplikasi Rental Mobil Flutter

Aplikasi mobile "Sewa Mobil" untuk membantu pengguna melakukan pemesanan mobil secara mudah.

## Fitur Utama

- Login & Registrasi pengguna
- Katalog mobil (6 mobil dengan foto dari `assets/mobil-1.jpg` s.d. `mobil-6.jpg`)
- Detail mobil dan pemesanan berdasarkan tanggal/jam
- Checkout dan konfirmasi pesanan
- Riwayat pesanan (OrdersScreen)

## Daftar Mobil (Mock Data)

- **Toyota Avanza** - Rp400.000/hari (`assets/mobil-1.jpg`)
- **Honda Brio** - Rp350.000/hari (`assets/mobil-2.jpg`)
- Mobil 3 - `assets/mobil-3.jpg`
- Mobil 4 - `assets/mobil-4.jpg`
- Mobil 5 - `assets/mobil-5.jpg`
- Mobil 6 - `assets/mobil-6.jpg`

## Struktur Proyek

```
lib/
├── data/          # mock_cars.dart
├── models/        # car.dart, order.dart
├── services/      # auth_service.dart (mock), order_service.dart (in-memory)
└── ui/
    ├── screens/   # welcome, login, register, home, car_detail, checkout, orders
    └── widgets/   # car_card.dart
```

- Assets: `welcome-logo.jpg`, `login-logo.jpg`, `register-logo.jpg`, `mobil-*.jpg`

## Cara Menjalankan

1. Install Flutter SDK: https://flutter.dev
2. `flutter pub get` (pastikan assets di pubspec.yaml)
3. `flutter run` (Android/iOS emulator/device)

## TODO / Roadmap

- [ ] Tambah assets di pubspec.yaml
- [ ] OrdersScreen tampil data benar & UI responsif
- [ ] Fitur admin (kelola mobil/pesanan)
- [ ] Integrasi backend (API real)

Lihat [rencana_aplikasi_sewa_mobil.md](rencana_aplikasi_sewa_mobil.md) untuk detail lengkap.
