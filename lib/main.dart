import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

void main() {
  // === 1. DATA BARANG (Dari Kode Awal) ===
  String namaBarang = "Buku Tulis";
  int hargaAnggota = 4500;
  int hargaUmum = 5000;
  int jumlahStok = 100;
  bool tersedia = true;

  // --- Tambahan variabel Kategori ---
  String kategori = "atk"; // Opsi: "atk", "makanan", "minuman", atau lainnya
  String lokasiRak;

  /*
   * PENJELASAN MENGAPA SWITCH LEBIH RAPI DARIPADA BANYAK IF:
   * 1. Keterbacaan (Readability): Switch-case dirancang khusus untuk membandingkan 
   *    SATU variabel (kategori) dengan BANYAK nilai konstan secara langsung.
   * 2. Bebas Redundansi: Tidak perlu mengulang penulisan kondisi (seperti: if (kategori == ...) 
   *    else if (kategori == ...)) yang membuat kode terlihat menumpuk dan kotor.
   * 3. Struktur Bersih: Pemisahan tiap cabang/kondisi terlihat sangat terstruktur 
   *    dengan label 'case' dan penanganan kondisi tidak terduga lewat 'default'.
   */
  switch (kategori.toLowerCase()) {
    case "atk":
      lokasiRak = "Rak 1";
      break;
    case "makanan":
      lokasiRak = "Rak 2";
      break;
    case "minuman":
      lokasiRak = "Rak 3";
      break;
    default:
      lokasiRak = "Rak lain";
  }

  // Cetak Informasi Barang
  print("===== KARTU DATA BARANG =====");
  print("Nama Barang   : $namaBarang");
  print("Kategori      : $kategori");
  print("Lokasi        : $lokasiRak");
  print("Harga Anggota : Rp$hargaAnggota");
  print("Harga Umum    : Rp$hargaUmum");
  print("Jumlah Stok   : $jumlahStok");
  print("Tersedia      : $tersedia");
  print("=============================\n");

  // === 2. TRANSAKSI KASIR ===
  bool isAnggota = true;
  int jumlahBeli = 30;

  // Step A: Tentukan harga dasar (if/else)
  int hargaSatuan;
  if (isAnggota) {
    hargaSatuan = hargaAnggota;
  } else {
    hargaSatuan = hargaUmum;
  }

  int totalBelanjaAwal = jumlahBeli * hargaSatuan;

  // Step B: Potongan borongan (if bertingkat)
  double persenPotongan = 0.0;

  if (totalBelanjaAwal > 200000) {
    persenPotongan = 0.10;
  } else if (totalBelanjaAwal > 100000) {
    persenPotongan = 0.05;
  } else {
    persenPotongan = 0.0;
  }

  double nominalPotongan = totalBelanjaAwal * persenPotongan;
  double hargaAkhir = totalBelanjaAwal - nominalPotongan;

  // Cetak Struk
  print("===== STRUK TRANSAKSI =====");
  print("Status Pembeli   : ${isAnggota ? "Anggota Koperasi" : "Umum"}");
  print("Jumlah Beli      : $jumlahBeli pcs");
  print("Harga Satuan     : Rp$hargaSatuan");
  print("Total Awal       : Rp$totalBelanjaAwal");
  print("Diskon Borongan  : ${(persenPotongan * 100).toInt()}% (-Rp${nominalPotongan.toInt()})");
  print("---------------------------");
  print("HARGA AKHIR      : Rp${hargaAkhir.toInt()}");
  print("===========================");

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
// Mengapa pemilihan tipe data pada program ini penting bagi keakuratan kasir koperasi?
// Pemilihan tipe data yang tepat seperti integer pada harga dan stok memastikan transaksi
// dapat dihitung secara akurat tanpa eror operasi matematika.
// Selain itu, penggunaan tipe data yang pas mencegah kesalahan input data (seperti teks pada stok) dan menjaga 
//konsistensi nilai saat menghitung total belanja serta selisih harga.
