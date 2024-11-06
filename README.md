# Aldo Garage

**Tugas Pemrograman Berbasis Platform - PBP B**

> **Aldo's Garage** merupakan suatu website yang menjual berbagai mobil dan dapat dikatakan sebagai e-commerce. Aldo's Garage menjual mobil-mobil vintage berbasis mobile.

## **Penjelasan Tugas**

<details>
<summary> <b> Tugas 7 </b> </summary>

## **Implementasi Checklist**

* ### Membuat Program Flutter Baru

    Pada folder yang akan menyimpan projek flutter kamu, jalankan command berikut pada terminal untuk menginisiasi projeku flutter kamu.
    ```
    flutter create aldo_garage
    cd aldo_garage
    ```
    Lalu tambahkan file `menu.dart` pada direktori `lib` dan isi dengan
    ```
    import 'package:flutter/material.dart';
    ```

    Kemudian pindahkan `class MyHomePage ...` dari main.dart ke menu.dart dan menghapus  `class _MyHomePage State ...` di main.dart. Lalu tambahkan kode berikut pada `main.dart` di bagian atas file.
    ```
    `import 'package:aldo_garage/menu.dart';`
    ```
    * ### Membuat Tombol Sederhana
        Pada `menu.dart` tambahkan 
        ```
        import 'package:flutter/material.dart';

        class MyHomePage extends StatelessWidget {
            final String npm = '2306245623';
            final String name =  'Rogerio Geraldo Wibhowo';
            final String className = 'PBP B';
            final List<ItemHomepage> items = [
                // Menentukan warna biru untuk item "Lihat Daftar Produk".
                ItemHomepage("Lihat Daftar Produk", Icons.mood, Colors.blue),
                // Menentukan warna hijau untuk item "Tambah Produk".
                ItemHomepage("Tambah Produk", Icons.add, Colors.green),
                // Membiarkan warna default merah untuk item "Logout".
                ItemHomepage("Logout", Icons.logout, Colors.red),
            ];
            MyHomePage({super.key});

            @override
            Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                title: const Text(
                    'Aldo Garage',
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    ),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        InfoCard(title: 'NPM', content: npm),
                        InfoCard(title: 'Name', content: name),
                        InfoCard(title: 'Class', content: className),
                        ],
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                        child: Column(
                        children: [
                            const Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Text(
                                'Welcome to Aldo Garage',
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                ),
                            ),
                            ),
                            GridView.count(
                            primary: true,
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            children: items.map((ItemHomepage item) {
                                return ItemCard(item);
                            }).toList(),
                            ),
                        ],
                        ),
                    ),
                    ],
                ),
                ),
            );
            }
        }

        class InfoCard extends StatelessWidget {
        final String title;
        final String content;

        const InfoCard({super.key, required this.title, required this.content});

        @override
        Widget build(BuildContext context) {
            return Card(
            elevation: 2.0,
            child: Container(
                width: MediaQuery.of(context).size.width / 3.5,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                children: [
                    Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(content),
                ],
                ),
            ),
            );
        }
        }

        class ItemHomepage {
            final String name;
            final IconData icon;
            final Color color;

            ItemHomepage(this.name, this.icon, this.color);
        }

        class ItemCard extends StatelessWidget {
        final ItemHomepage item;
        
        const ItemCard(this.item, {super.key});

        @override
        Widget build(BuildContext context) {
            return Material(
            // Menggunakan warna yang didefinisikan di dalam item.color.
            color: item.color,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
                onTap: () {
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                    SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
                    );
                },
                child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        ),
                    ],
                    ),
                ),
                ),
            ),
            );
        }
        }

        ```
        Dengan begitu, selesai sudah pembuatan proyek Flutter baru dan jalankan proyek dengan command
        ```
        flutter run
        ```

## **Jawaban Tugas 7**

* ### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

    Stateless widget adalah widget yang tampilannya tetap sama dan tidak mengalami perubahan setelah dibuat. Artinya, widget ini tidak bergantung pada kondisi atau variabel yang dapat berubah, sehingga tampilannya statis. Contoh umum stateless widget adalah `Text` dan `Icon`. Sebaliknya, stateful widget adalah widget yang memiliki kondisi (state) yang bisa berubah selama aplikasi berjalan. Karena itu, stateful widget mampu menanggapi perubahan data atau interaksi pengguna dengan memperbarui tampilannya sesuai perubahan tersebut. Widget seperti `Checkbox`, `Slider`, dan `TextField` biasanya bersifat stateful karena perlu menyesuaikan tampilan berdasarkan interaksi pengguna.

* ### Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

    Dalam proyek ini, beberapa widget digunakan untuk membangun struktur dan tampilan halaman aplikasi. `Scaffold` menyediakan kerangka dasar dengan `AppBar` untuk menampilkan judul di bagian atas dan `body` sebagai isi halaman. `Padding` digunakan untuk menambahkan jarak antar-widget, membuat tampilan lebih rapi. `Column` dan `Row` berfungsi menyusun elemen secara vertikal dan horizontal, sementara `Text` menampilkan teks informasi. Untuk tata letak grid tiga kolom, `GridView` digunakan agar item dapat ditampilkan dalam format grid. `Card` menyediakan kotak dengan bayangan untuk informasi penting seperti NPM, nama, dan kelas. `Material` memberikan latar belakang tombol dengan warna tema, dan `InkWell` menambahkan efek sentuhan (ripple effect) saat tombol ditekan. `SnackBar` berfungsi menampilkan pesan singkat di bagian bawah layar ketika tombol diklik, sementara `Icon` menampilkan ikon grafis pada tiap tombol, seperti ikon "directions_car" untuk "Lihat Daftar Produk", "add" untuk "Tambah Produk", dan "logout" untuk "Logout". Dengan kombinasi widget ini, aplikasi dapat memiliki tampilan yang interaktif dan mudah dinavigasi.

* ### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

    Fungsi `setState()` dalam stateful widget digunakan untuk memberi tahu framework bahwa terjadi perubahan pada state yang memerlukan pembaruan tampilan. Saat `setState()` dipanggil, widget akan dibangun ulang dengan data yang terbaru, sehingga perubahan state akan langsung terlihat di layar. Variabel yang dipengaruhi oleh `setState()` umumnya adalah variabel dalam state yang berkaitan dengan data yang dinamis, seperti input pengguna, pengaturan tampilan, atau kondisi aplikasi saat itu.

* ### Jelaskan perbedaan antara const dengan final.

    Di Flutter, kata kunci `const` dan `final` digunakan untuk mendeklarasikan variabel dengan nilai tetap. `const` menjadikan nilai variabel konstan pada saat kompilasi (compile-time) dan membuat objeknya immutabel di seluruh aplikasi. Artinya, objek yang dideklarasikan dengan `const` tidak dapat diubah kapan pun. Di sisi lain, `final` mendeklarasikan variabel dengan nilai yang tidak berubah setelah inisialisasi, namun nilainya dapat ditentukan saat aplikasi berjalan (run-time). Ini membuat `final` ideal untuk nilai tetap yang baru diketahui ketika aplikasi sudah berjalan.

</details>