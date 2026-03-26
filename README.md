# Tutorial 6: Menu & In-Game GUI

**Nama** : Rayhan Syahdira Putra
**NPM** : 2306275903

---

Proses Pengerjaan Tutorial dan Latihan Mandiri
Pada tutorial kali ini, saya mengimplementasikan antarmuka pengguna (GUI) yang mencakup pembuatan layar menu utama, sistem nyawa (life counter), dan layar kondisi kalah (Game Over). Sesuai dengan instruksi, saya juga melengkapi pengerjaan dengan minimal 2 (dua) fitur tambahan sebagai bagian dari Latihan Mandiri. Berikut adalah penjelasan mengenai proses implementasinya:

1. Layar utama (`MainMenu.tscn`) dibangun menggunakan root node `MarginContainer` dengan pengaturan Anchors Preset Full Rect agar ukurannya senantiasa menyesuaikan window. Tata letak elemen disusun secara hierarkis menggunakan `HBoxContainer` untuk membagi layar menjadi dua sisi, serta `VBoxContainer` dan `CenterContainer` untuk memusatkan teks dan gambar. Tipografi pada judul dan tombol diubah menggunakan properti `ThemeOverrides` dengan font eksternal. Navigasi antar scene ditangani oleh node `LinkButton` yang memanfaatkan signal `pressed()` untuk mengeksekusi fungsi `change_scene_to_file()`.

2. Sistem nyawa diimplementasikan melalui penggunaan Global Variable (Autoload). Sebuah script bernama `Global.gd` dibuat untuk menyimpan variabel `lives = 3` secara permanen (persist) agar nilainya tidak ter-reset ketika scene permainan dimuat ulang. Indikator visual nyawa dibangun pada scene `LifeCounter.tscn` menggunakan `Label`, yang kemudian di-instantiate ke dalam level permainan (Level 1 dan Level 2) sebagai child dari node `CanvasLayer`. Logika penalti diatur pada script pemicu kematian (seperti area jatuh atau proyektil musuh) yang akan mengurangi nilai `Global.lives` sebesar 1 setiap kali Player berkolisi.

3. Layar kondisi kalah (`Game Over.tscn`) dibuat menggunakan root node `ColorRect` untuk menutupi seluruh layar permainan dengan warna latar kustom. Scene ini akan dipanggil secara otomatis oleh sistem ketika variabel `Global.lives` menyentuh angka 0.

4. Untuk Latihan Mandiri, saya mengimplementasikan tiga fitur tambahan untuk melengkapi menu dan GUI di dalam game:
   * **Tombol Main Menu pada Layar Game Over:** Saya menambahkan `LinkButton` pada layar Game Over yang memungkinkan pemain kembali ke menu utama. Script pada tombol ini tidak hanya memuat `MainMenu.tscn`, tetapi juga secara eksplisit me-reset nilai `Global.lives` kembali menjadi 3 agar sesi permainan selanjutnya dapat berjalan normal.
   * **Fitur Select Stage:** Saya mengaktifkan tombol "Stage Select" yang ada di Main Menu, namun saya rename menjadi "Jump to Stage 2" agar lebih bermakna. Tombol ini dihubungkan dengan script yang langsung mengarahkan pemain ke scene `Level 2.tscn` sembari memastikan nyawa berada dalam kondisi penuh.
   * **Animasi Karakter Dinamis di Main Menu:** Sebagai bentuk eksplorasi kreatif, saya mengganti gambar aset alien yang statis di menu utama dengan node `AnimatedSprite2D`. Saya memotong spritesheet karakter menjadi animasi *walk*, *stand*, dan *jump*. Saya kemudian merancang script *state machine* sederhana menggunakan `randf_range` dan mekanisme gravitasi buatan agar karakter terlihat hidup—berjalan mengelilingi layar, berhenti sejenak, atau tiba-tiba melompat dengan pergerakan yang mulus dan natural.

Referensi
- Materi Tutorial 6 - Menu and In-Game Graphical User Interface, Mata Kuliah Game Development Fakultas Ilmu Komputer Universitas Indonesia.
- Dokumentasi Resmi Godot Engine (v4.6) mengenai integrasi UI Containers, Global Variables (Autoload), dan AnimatedSprite2D.
- Kenney Platformer Pack Assets.