# Game Labirin Berbasis ASCII (Pascal)

**Game Labirin Berbasis ASCII** adalah permainan berbasis teks (console) sederhana yang dikembangkan menggunakan bahasa **Pascal**. Game ini menampilkan labirin yang divisualisasikan dengan karakter ASCII, di mana pemain harus menavigasi karakter utama (`@`) melalui lorong-lorong untuk mencapai titik tujuan (`X`).

Proyek ini cocok sebagai latihan dasar logika pemrograman, manipulasi array 2D, penggunaan `gotoxy`, dan kontrol berbasis keyboard dalam lingkungan terminal.

---

## Tujuan Proyek

- Mengimplementasikan **gerakan karakter dalam labirin** berbasis teks.
- Menampilkan visual labirin menggunakan karakter ASCII (`#`, `@`, `X`, spasi).
- Melatih penggunaan **input keyboard (W, A, S, D)** untuk interaksi.
- Menerapkan validasi gerakan dan logika kemenangan.
- Menjadi proyek dasar untuk eksplorasi game berbasis konsol.

---

## Fitur

- Representasi visual labirin dalam terminal.
- Karakter pemain (`@`) bisa digerakkan dengan tombol:
  - `W` = atas
  - `A` = kiri
  - `S` = bawah
  - `D` = kanan
- Validasi agar tidak bisa menabrak dinding (`#`).
- Tujuan permainan: capai titik akhir (`X`) untuk menang.
- Pesan "Selamat!" saat pemain berhasil menyelesaikan labirin.
