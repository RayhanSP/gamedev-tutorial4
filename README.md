# Tutorial 4: Basic 2D Level Design

**Nama** : Rayhan Syahdira Putra
**NPM** : 2306275903

---

Proses Pengerjaan Latihan Mandiri
Pada Latihan Mandiri ini, saya membuat sebuah level baru (Level2.tscn) dengan berusaha memenuhi skema penilaian yang ada. Berikut adalah penjelasan  mengenai proses implementasinya:

1. Level 2 dibangun menggunakan TileSet yang baru untuk memberikan visual yang berbeda. Pembuatan struktur level menggunakan node TileMapLayer yang telah diberikan Physics Layer secara presisi untuk memastikan karakter Player dapat berpijak dan berinteraksi dengan permukaan secara akurat.

2. Berbeda dengan obstacle ikan yang jatuh dari langit pada Level 1, rintangan pada Level 2 adalah roket rektorat yang melesat dari dasar jurang ke atas secara vertikal. Mekanisme ini dibangun dengan menggunakan root node RigidBody2D dengan nilai gravitasi yang telah disesuaikan agar objek dapat melesat ke atas. Node ini dilengkapi dengan Sprite2D dan CollisionShape2D sebagai visual dan kolisinya.

Untuk spawnernya, menggunakan node Node2D (Spawner) yang ditempatkan secara tersembunyi di bawah level. Script Spawner dimodifikasi, misal titik instantiate ditetapkan statis dan objek didorong ke atas menggunakan manipulasi linear_velocity.

Lose conditionnya memanfaatkan fitur Contact Monitor pada RigidBody2D serta Signals body_entered. Apabila roket berkolisi dengan node bernama "Player", script akan secara instan me-reload scene kembali ke titik awal menggunakan fungsi change_scene_to_file().

Saya juga menambahkan obstacle duri untuk meningkatkan tantangan platforming. Rintangan ini dibangun dengan menyematkan AreaTrigger. Serupa dengan mekanisme area jurang, apabila node "Player" memasuki area kolisi duri tersebut, signal body_entered akan ketrigger dan memicu script untuk me-reset atau me-reload level secara instan.

3. Kondisi menang diatur dengan menempatkan sebuah sprite semak (bush) di ujung area level.

Sprite ini bertindak sebagai penanda visual yang menaungi node Area2D dan CollisionShape2D sebagai area trigger.

Sistem Signal body_entered dihubungkan ke sebuah script yang bertugas memverifikasi objek yang masuk. Jika objek dikenali sebagai "Player", maka fungsi change_scene_to_file akan dipanggil untuk menampilkan scene kemenangan (WinScreen.tscn).

4. Beberapa penyesuaian saya lakukan pada script bawaan tutorial.
Kecepatan Jatuh (Level 1): Dilakukan penyesuaian pada parameter Gravity Scale node RigidBody2D milik rintangan ikan agar jatuh lebih lambat, sehingga mempermudah player dalam memainkannya (sebelum gravitasi ikan diperlambat, game saya serasa seperti Cat Mario yang gampang membuat player stres).

Kecepatan Pergerakan (Player): Nilai variabel jump speed pada script player.gd dinaikkan agar pergerakan karakter terasa lebih lincah dan responsif saat bermanuver menghindari rintangan baru.


Dalam kondisi menang Level 1, saya ganti menjadi reload ke Level 2, agar level Latihan Mandiri ini dapat berjalan seperti kelanjutan dari scene sebelumnya.





Referensi
- Materi Tutorial 4 - Basic 2D Level Design, Mata Kuliah Game Development Fakultas Ilmu Komputer Universitas Indonesia.
- Dokumentasi Resmi Godot Engine (v4.6) mengenai integrasi TileMapLayer, Area2D, RigidBody2D, dan Signals.
- Kenney Platformer Pack Assets.