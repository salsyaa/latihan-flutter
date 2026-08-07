import 'package:intl/intl.dart';
import 'package:flutter/material.dart';


// 1. Bahaya yang muncul jika kondisi berhenti pada 'while' keliru:
// - Terjadi 'Infinite Loop' (perulangan tanpa henti) yang membuat program hang, crash, atau memakan memori CPU secara berlebihan.
// - Terjadi kesalahan logika bisnis, seperti stok bernilai minus (misal: sisa stok -1, -2), yang mengakibatkan data inventory tidak akurat.
// 2. Cara memastikan koperasi tidak menjual melebihi stok:
// - Menggunakan kondisi perulangan yang tepat, seperti 'while (stok > 0)', sehingga proses langsung berhenti saat stok mencapai 0.
// - Menerapkan validasi atau percabangan 'if (stok >= jumlahBeli)' sebelum memproses transaksi penjualan.
// - Menggunakan metode pengurangan nilai stok secara konsisten (stok--) di dalam perulangan sebelum transaksi dicatat.

// 1. Fungsi pertama untuk menghitung total awal
double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

// 2. Fungsi kedua untuk menghitung harga akhir setelah potongan
double hitungHargaAkhir(double total, double persenPotongan) {
  return total - (total * persenPotongan / 100);
}

double hitungHargaAkhir(double total, double persenPotongan) {
  // Contoh jika rumus berubah menjadi potongan flat / logika baru
  return total - (total * persenPotongan / 100); 
}
void main() async{
   //Deklarasi
  String nama_barang = "Mie Ayam";
  double harga_anggota = 8000.0;
  double harga_umum = 10000.0;
  int jumlah_stok = 1000;
  int jumlah_beli= 78;
  double total_anggota = hitungTotal(jumlah_beli, harga_anggota);
  double total_umum = hitungTotal(jumlah_beli, harga_umum);
  double selisih_harga = total_umum - total_anggota;


  bool tersedia = jumlah_stok > 0;
  bool anggota = false; //false = pembeli umum, true = pembeli anggota

  String kategori = "Makanan";
  String lokasi_rak;
  switch (kategori) {
    case "Atk":
      lokasi_rak = "Rak 1";
      break;
    case "Makanan":
      lokasi_rak = "Rak 2";
      break;
    case "Minuman":
      lokasi_rak = "Rak 3";
      break;
    default:
      lokasi_rak = "Rak Lain";
  }
//Mengapa switch case digunakan pada program ini dari pada if else?
//Karena switch case lebih efisien dan lebih mudah dibaca 
//ketika ada banyak kondisi yang harus diperiksa berdasarkan nilai dari satu variabel.
//serta menambah kategori baru di masa
//depan cukup menambah satu blok "case" baru tanpa mengubah struktur if-else yang ada
  
  //Format Rupiah dengan package intl
  final formatRupiah = NumberFormat.currency(
    locale: 'id_ID', 
    symbol: 'Rp ', 
    decimalDigits: 0);

  //Mengecek pembeli termasuk angggota/umum
  double harga_satuan;
  if (anggota) {
    harga_satuan = harga_anggota;
  } else {
    harga_satuan = harga_umum;
  }

  //menghitung total belanja sebelum potongan
  double total_belanja = hitungTotal(jumlah_beli, harga_satuan);
  //  double total_belanja = 50000; 
  //logika diskon
  double persen_diskon ;
  if (total_belanja >= 500000) {
    persen_diskon = 0.15;
  } else if (total_belanja >= 200000) {
    persen_diskon = 0.10;
  } else if (total_belanja >= 100000) {
    persen_diskon = 0.05;
  } else {
    persen_diskon = 0.0;
  }

  //Validasi jika input bernilai negatif
  if (jumlah_beli < 0 || total_belanja < 0) {
    print("=========ERROR=========");
    print("Jumlah beli tidak valid.");
    print("Transaksi dibatalkan.");
    print("========================");
    return;
  }else if (jumlah_beli > jumlah_stok) {
    print("=========ERROR=========");
    print("Jumlah beli melebihi stok.");
    print("Transaksi dibatalkan.");
    print("========================");
    return;
  }
  //menghitung total belanja setelah potongan
  double total_setelah_diskon = total_belanja * persen_diskon; 
  double total_bayar = total_belanja - total_setelah_diskon;


//Output
print("==========STRUK PEMBELIAN===========");
print("Nama Barang : $nama_barang");
print('Kategori : $kategori');
print('Lokasi Rak : $lokasi_rak');
print("Harga Anggota : ${formatRupiah.format(harga_anggota)}");
print("Harga Umum : ${formatRupiah.format(harga_umum)}");
print("Jumlah Stok : $jumlah_stok");

  if (tersedia) {
  print("Tersedia : Ya (Stok masih ada)");
}else {
    print("Tersedia : Tidak (Stok habis)");
  }

print("Total (anggota) $jumlah_beli pcs : ${formatRupiah.format(total_anggota)}");
print("Selisih vs Umum : ${formatRupiah.format(selisih_harga)}");

print('-----------TOTAL FINAL------------');
print('status pembeli : ${anggota ? "Anggota" : "Umum"}');
print('Jumlah beli : $jumlah_beli pcs');
print('Harga satuan : ${formatRupiah.format(harga_satuan)}');
print('Total belanja : ${formatRupiah.format(total_belanja)}');
print("Potongan Borongan : ${(persen_diskon * 100).toInt()}% (${formatRupiah.format(total_setelah_diskon)})");
print("Total Bayar : ${formatRupiah.format(total_bayar)}");
print("======================================");


print ("======================================");
print ("==============Sprint 3================");

//Membuat list barang
List<String> list_barang = <String>["Buku Tulis", "Pulpen", "Penghapus", "Roti"];
List<double> list_harga = <double>[5000, 2500, 1500, 5000];

print("==========LIST BARANG===========");
for (int i = 0; i < list_barang.length; i++) {
  print("${i + 1}. ${list_barang[i]} - ${formatRupiah.format(list_harga[i])}");
}

//Membuat Logika while stok buku
int stok_buku = 3;

print("==========STOK BARANG===========");

while (stok_buku > 0) {
  stok_buku = stok_buku - 1;
  print("Terjual 1, Sisa stok: $stok_buku");
}

//Menjumlahkan selueruh stok menggunakan perulangan for
List<String> Data_barang = <String>["Buku Tulis", "Pulpen", "Penghapus", "Roti"];
List<double> Data_harga = <double>[5000, 2500, 1500, 5000];
List<int> Data_stok = <int>[10, 3, 15, 5];

double total_stok = 0;//untuk nilai awal akumulasi

print("==========DAFTAR STOK KOPERASI===========");
for (int i = 0; i < Data_barang.length; i++) {
  double nilai_barang = Data_harga[i] * Data_stok[i];
  total_stok = total_stok + nilai_barang;
  print("${i + 1}. ${Data_barang[i]} - ${formatRupiah.format(Data_harga[i])} - Stok: ${Data_stok[i]} - Total Nilai: ${formatRupiah.format(nilai_barang)}");
}

print("===========================================");
print("Total Nilai Seluruh Stok: ${formatRupiah.format(total_stok)}");

//Menampilkan barang yang stoknya menipis menggunakan perulangan dan kondisi
bool stok_menipis = false;
print("==========BARANG STOK MENIPIS===========");
for (int i = 0; i < Data_barang.length; i++) {
  if (Data_stok[i] < 5) {
    print(
      "${Data_barang[i]} - pcs Harga: ${formatRupiah.format(Data_harga[i])} - Sisa: ${Data_stok[i]}");
    stok_menipis = true;
  }
}
if (!stok_menipis) {
  print("Tidak ada barang yang stoknya menipis.");
}

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
