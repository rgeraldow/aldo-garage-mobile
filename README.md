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

<details>
<summary> <b> Tugas 8 </b> </summary>

## **Implementasi Checklist**

* ### Membuat Drawer pada Aplikasi

    Buat direktori baru bernama `widgets` pada subdirektori `lib/` lalu buat file bari bernama `left_drawer.dart` dan masukkan kode seperti berikut:
    ```
    import 'package:aldo_garage/screens/carentry_form.dart';
    import 'package:flutter/material.dart';
    import 'package:aldo_garage/screens/menu.dart';

    class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
        child: ListView(
            children: [
            DrawerHeader(
                // TODO: Bagian drawer header
                decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                ),
                child: const Column(
                children: [
                    Text(
                    'Aldo Garage',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text(
                    "Cari mobil yang cocok? Aldo Garage aja!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal, 
                        color: Colors.white,
                        letterSpacing: 1.2,
                    ),
                    ),
                ],
                ),
            ),
                // TODO: Bagian routing
                ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Halaman Utama'),
                // Bagian redirection ke MyHomePage
                onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                        ));
                },
                ),
                ListTile(
                leading: const Icon(Icons.directions_car),
                title: const Text('Tambah Produk'),
                // Bagian redirection ke CarEntryFormPage
                onTap: () {
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CarEntryFormPage(),
                    ));
                },
                ),
            ],
        ),
        );
    }
    }
    ```

* ### Membuat Form Tambah Produk dan Elemen Input
    Pada subdirektori `lib` buat file baru bernama `carentry_form.dart` dan tambahkan kode berikut ke dalamnya.
    ```
    import 'package:flutter/material.dart';
    import 'package:aldo_garage/widgets/left_drawer.dart';

    class CarEntryFormPage extends StatefulWidget {
    const CarEntryFormPage({super.key});

    @override
    State<CarEntryFormPage> createState() => _CarEntryFormPageState();
    }

    class _CarEntryFormPageState extends State<CarEntryFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _car = "";
    String _description = "";
    int _price = 0;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Center(
            child: Text(
                'Form Tambah Produk Kamu ke Toko',
            ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Car",
                        labelText: "Car",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _car = value!;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Produk tidak boleh kosong!";
                        }
                        return null;
                    },
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _description = value!;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Descriptions tidak boleh kosong!";
                        }
                        return null;
                    },
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Price",
                        labelText: "Price",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _price = int.tryParse(value!) ?? 0;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Field price tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                        return "Field price harus berupa angka!";
                        }
                        return null;
                    },
                    ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.primary),
                        ),
                        onPressed: () {
                        if (_formKey.currentState!.validate()) {
                            showDialog(
                            context: context,
                            builder: (context) {
                                return AlertDialog(
                                title: const Text('Produk berhasil tersimpan'),
                                content: SingleChildScrollView(
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text('Product: $_car'),
                                        Text('Description: $_description'),
                                        Text('Price: $_price'),
                                    ],
                                    ),
                                ),
                                actions: [
                                    TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                        Navigator.pop(context);
                                        _formKey.currentState!.reset();
                                    },
                                    ),
                                ],
                                );
                            },
                            );
                        }
                        },
                        child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                        ),
                    ),
                    ),
                ),
                ],
            ),
            ),
        ),
        );
    }
    }
    ```
    Pastikan bahwa routing dan navigasi yang dilakukan telah benar dan tepat, kemudian drawer dan form telah selesai.

    

## **Jawaban Tugas 8**

* ### Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

    `const` digunakan untuk membuat objek yang tidak dapat diubah atau bersifat *immutable* sehingga lebih efisien dalam penggunaan memori. Ketika kita menandai suatu widget atau objek dengan `const`, Flutter hanya akan membuat satu instance dari objek tersebut dan menyimpannya di memori, sehingga dapat digunakan berulang kali tanpa harus membuat instance baru setiap kali objek tersebut dipanggil. Keuntungan utama dari penggunaan `const` adalah efisiensi memori dan peningkatan performa aplikasi, terutama saat ada banyak elemen UI yang tidak berubah. Flutter tidak perlu membangun ulang widget bertanda `const` saat UI diperbarui, sehingga proses rendering UI bisa lebih cepat dan responsif. Selain itu, `const` membantu mencegah perubahan data atau elemen UI yang tidak disengaja, sehingga kode menjadi lebih stabil dan lebih mudah dipahami. 

    Kita sebaiknya menggunakan `const` pada elemen-elemen UI atau objek yang nilainya tidak akan berubah sepanjang aplikasi berjalan, seperti teks statis, ikon tetap, atau elemen layout yang tidak dinamis. Namun, jika suatu objek atau widget bergantung pada data atau properti yang mungkin berubah (misalnya nilai dari input pengguna), `const` sebaiknya tidak digunakan, karena akan mengakibatkan nilai tidak dapat diperbarui dengan benar.

* ### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

    `Column` dan `Row` adalah widget layout yang digunakan untuk mengatur posisi widget lain secara vertikal dan horizontal. `Column` menempatkan widget-widgetnya dalam susunan **vertikal** (dari atas ke bawah), sehingga cocok digunakan untuk menumpuk elemen UI di layar, seperti membuat form input yang memiliki beberapa field. Sementara itu, `Row` menyusun widget-widgetnya secara **horizontal** (dari kiri ke kanan), yang sering digunakan saat kita ingin meletakkan beberapa elemen di samping satu sama lain, misalnya ikon dengan teks atau tombol-tombol aksi dalam satu baris.

    Contoh penggunaan `Column` dalam menumpuk widget vertikal:

    ```
    Column(
    children: [
        Text('Judul'),
        TextField(),
        ElevatedButton(onPressed: () {}, child: Text('Simpan')),
    ],
    )
    ```

    Dalam contoh ini, `Column` menyusun teks, input field, dan tombol secara vertikal, yang sangat cocok untuk tampilan form.

    Sedangkan contoh penggunaan `Row` untuk menyusun widget horizontal:

    ```
    Row(
    children: [
        Icon(Icons.home),
        SizedBox(width: 10), // Memberi jarak antara ikon dan teks
        Text('Beranda'),
    ],
    )
    ```

    Pada contoh ini, `Row` menyusun ikon dan teks secara horizontal, sehingga ikon dan teks tampil di satu baris yang rapi. `Column` dan `Row` juga mendukung properti seperti `mainAxisAlignment` dan `crossAxisAlignment` untuk menyesuaikan posisi dan spasi widget. Dengan begitu, kita dapat mengatur susunan elemen UI secara fleksibel sesuai dengan kebutuhan aplikasi.

* ### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

    Pada halaman form yang saya buat dalam tugas ini, saya hanya menggunakan elemen input `TextFormField` untuk menerima data dari pengguna. Elemen ini digunakan untuk mengisi informasi dasar seperti nama produk, deskripsi, dan harga. `TextFormField` adalah widget input teks yang fleksibel dan mudah digunakan, sehingga cocok untuk menerima berbagai jenis input teks.

    Namun, Flutter sebenarnya menyediakan banyak elemen input lain yang bisa digunakan sesuai kebutuhan, seperti `DropdownButtonFormField` yang menampilkan pilihan dari daftar dropdown dan `Checkbox` untuk pilihan "Ya atau Tidak". 

* ### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

    Cara saya menggunakan tema yang konsisten adalah dengan menggunakan fitur `ThemeData` dalam properti theme di `MaterialApp`. Fitur ini dapat mengatur primary color, secondary color, font, icon dan sebagainya. Tema hanya tinggal kita implementasikan ke halaman halaman yang ada pada aplikasi.

* ### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

    Dalam aplikasi Flutter dengan banyak halaman, navigasi antar halaman dapat dikelola menggunakan kelas `Navigator`. Navigator bekerja dengan cara menumpuk halaman dalam bentuk *stack*, di mana halaman terbaru berada di atas. Untuk berpindah ke halaman baru, kita bisa menggunakan `Navigator.push`, yang akan menambahkan halaman baru ke *stack* dan menampilkan halaman tersebut. Misalnya, `Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()))` akan membuka halaman `NewPage` di atas halaman saat ini. 

    Jika kita ingin mengganti halaman saat ini dengan halaman baru tanpa bisa kembali ke halaman sebelumnya, kita bisa menggunakan `Navigator.pushReplacement`. Misalnya, `Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewPage()))` akan menampilkan `NewPage` dan menghapus halaman sebelumnya dari *stack*, sehingga pengguna tidak bisa kembali ke halaman sebelumnya dengan tombol "Back".

    Selain itu, jika ingin menghapus semua halaman sebelumnya dan membuka halaman baru sebagai halaman utama, kita bisa menggunakan `Navigator.pushAndRemoveUntil`. Ini berguna saat melakukan navigasi setelah login atau logout. Contohnya, `Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false)` akan membuka halaman `HomePage` dan mengosongkan *stack* sebelumnya. 

    Untuk kembali ke halaman sebelumnya, `Navigator.pop(context)` dapat digunakan, yang akan menghapus halaman di atas dari *stack* dan kembali ke halaman sebelumnya. Dengan berbagai metode ini, kita dapat mengelola navigasi antar halaman dengan fleksibel dan menyesuaikannya dengan kebutuhan aplikasi.

</details>

<details>
<summary> <b> Tugas 9 </b> </summary>

## **Implementasi Checklist**

* ### Pembuatan Halaman Login (Flutter)

    - Stateful Widget digunakan karena memiliki elemen dinamis seperti form input untuk username dan password.
    - Tombol login mengirimkan data username dan password ke endpoint autentikasi Django (auth/login/).
    - Hasil autentikasi ditampilkan melalui Snackbar, menampilkan apakah login berhasil atau gagal.
    - Jika login berhasil, pengguna diarahkan ke halaman utama.

* ### Implementasi Autentikasi di Django
    - App Baru: Dibuat aplikasi bernama authentication untuk menangani fungsi login dan logout.
    - JSON Response: Endpoint login dan logout dibuat agar mengembalikan JSON sebagai hasil proses autentikasi.
    - Routing: Ditambahkan rute untuk login di /auth/login dan logout di /auth/logout.
    - CORS: Menggunakan paket django-cors-headers untuk memungkinkan komunikasi antara Django dan Flutter. Pengaturan CORS ditambahkan pada konfigurasi Django.

* ### Implementasi Autentikasi di Flutter
    - Dependensi: Menambahkan provider dan pbp_django_auth untuk mempermudah pengelolaan autentikasi.
    - Provider Instance: Menggunakan Provider di main.dart untuk menyebarkan instance CookieRequest ke semua widget aplikasi.
    - Halaman Login sebagai Default: Halaman login ditampilkan saat aplikasi pertama kali dijalankan.
    - Logout: Tombol logout menghapus sesi pengguna dan mengarahkan kembali ke halaman login.

* ### Model Kustom untuk Data JSON (Flutter)
    - Endpoint JSON: Data diambil dari endpoint /json/ pada Django yang hanya mengembalikan data milik pengguna yang login.
    - Konversi JSON ke Dart: Struktur JSON dikonversi menjadi model Dart menggunakan alat seperti Quicktype. Model disimpan di `lib/models/shop_entry.dart.`
    - Properti Model: Model mencakup atribut seperti name, price, description, dll.

* ### Halaman Daftar Item (Flutter)
    - Navigasi: Setiap item dalam daftar dapat ditekan menggunakan InkWell untuk membuka halaman detail menggunakan Navigator.push.
    - Detail Data: Halaman menerima data barang sebagai parameter dan menampilkan informasi seperti nama, jumlah, lokasi, harga, dan deskripsi.
    - Navigasi Balik: Menggunakan tombol back default untuk kembali ke halaman daftar item.


## **Jawaban Tugas 9**

* ### Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

    Membuat model untuk pengambilan atau pengiriman data JSON penting karena membantu kita mengelola data dengan lebih terstruktur dan rapi. Dalam aplikasi, data JSON biasanya digunakan untuk berkomunikasi dengan server, dan model berfungsi sebagai kerangka yang mendefinisikan bagaimana data tersebut harus disusun. Dengan menggunakan model, kita dapat dengan mudah mengonversi data JSON menjadi objek Dart yang lebih aman dan nyaman digunakan, serta sebaliknya. Selain itu, model mengurangi risiko kesalahan seperti salah membaca nama key, penggunaan tipe data yang tidak sesuai, atau menangani nilai null secara tidak benar. Tanpa model, kita harus mengakses data JSON mentah secara manual, yang lebih rawan error dan membuat kode sulit dibaca atau dipelihara. Meskipun tidak wajib membuat model, bekerja tanpa model dapat menyebabkan kesalahan saat runtime, terutama jika struktur data JSON kompleks atau berubah di masa depan. Oleh karena itu, menggunakan model sangat dianjurkan untuk menjaga aplikasi tetap rapi, mudah dipelihara, dan bebas dari error.

* ### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini!

    Library `http` dalam Flutter digunakan untuk menghubungkan aplikasi dengan server melalui internet menggunakan protokol HTTP. Dengan library ini, aplikasi bisa mengirim permintaan seperti GET (untuk mengambil data), POST (untuk mengirim data), PUT (untuk memperbarui data), atau DELETE (untuk menghapus data). Selain itu, library ini juga memudahkan kita untuk menerima dan memproses data dari server, misalnya mengubah data dalam format JSON menjadi bentuk yang bisa dipakai langsung dalam aplikasi. Sederhananya, library `http` adalah alat yang memungkinkan aplikasi Flutter berkomunikasi dengan server untuk mengirim dan menerima informasi.

* ### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

    `CookieRequest` adalah sebuah class atau alat yang biasanya digunakan untuk menangani permintaan HTTP yang memerlukan pengelolaan cookie, seperti saat mengakses layanan dengan sesi pengguna. Cookie digunakan untuk menyimpan informasi sesi agar server dapat mengenali pengguna yang sudah login, sehingga aplikasi dapat tetap melacak status login atau preferensi pengguna selama sesi berlangsung. Penting untuk membagikan instance `CookieRequest` ke seluruh komponen aplikasi agar setiap bagian aplikasi dapat menggunakan cookie yang sama, misalnya untuk memastikan semua permintaan HTTP yang memerlukan autentikasi memiliki cookie yang benar. Dengan cara ini, aplikasi dapat menjaga konsistensi data sesi pengguna di berbagai fitur atau layar tanpa harus membuat ulang sesi atau kehilangan informasi login.

* ###  Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

    Mekanisme pengiriman data dalam Flutter dimulai dari input yang diberikan oleh pengguna, seperti mengisi form atau menekan tombol. Data dari input ini kemudian dikumpulkan dan diproses oleh aplikasi, misalnya dengan mengambil nilai dari controller pada widget seperti `TextField`. Setelah data siap, aplikasi mengirimkannya ke server menggunakan protokol HTTP, biasanya melalui metode POST menggunakan library seperti `http`. Server menerima data tersebut, memprosesnya (misalnya menyimpannya ke database atau menjalankan logika tertentu), dan mengirimkan respons kembali ke aplikasi, biasanya dalam format JSON. Aplikasi Flutter kemudian mengambil respons ini, menguraikan (parsing) data yang diterima, dan memperbarui tampilan UI untuk menampilkan hasilnya kepada pengguna. Semua langkah ini berjalan secara terstruktur, sehingga pengguna dapat melihat perubahan secara real-time atau setelah proses selesai.

* ### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

    Mekanisme autentikasi dimulai saat pengguna mengisi data akun, seperti email dan password, di aplikasi Flutter untuk login atau register. Data yang dimasukkan dikirim ke server Django menggunakan metode HTTP POST. Untuk proses **register**, Django memeriksa validitas data, seperti memastikan email belum digunakan, lalu menyimpan akun baru ke database. Jika berhasil, Django mengirimkan respons ke Flutter yang menunjukkan bahwa pendaftaran sukses.  

    Untuk **login**, data yang dikirim (email dan password) akan diperiksa oleh Django, mencocokkan dengan data di database. Jika sesuai, Django membuat sesi login dengan menyimpan cookie atau token yang akan dikirim kembali ke Flutter. Aplikasi Flutter menyimpan cookie atau token ini (biasanya di memori atau penyimpanan lokal) untuk digunakan pada permintaan berikutnya. Setelah login berhasil, Flutter menampilkan menu utama atau dashboard sesuai peran pengguna.  

    Proses **logout** dilakukan dengan mengirim permintaan ke Django untuk menghapus sesi atau token. Django kemudian menghapus informasi sesi pengguna di server, dan Flutter juga menghapus cookie atau token yang disimpan. Setelah logout, aplikasi akan mengarahkan pengguna kembali ke halaman login. Mekanisme ini memastikan hanya pengguna yang telah terautentikasi yang dapat mengakses fitur tertentu di aplikasi.

</details>