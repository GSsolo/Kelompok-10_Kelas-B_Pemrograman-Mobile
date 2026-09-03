// Nama         : Efraim Imanuel Parasak
// NIM          : D121241062
// Program      : Hitung Total Belanja dengan Diskon
// Mata Kuliah  : Pemrograman Mobile
// Ketentuan    : menggunakan built-in types, function,
//                if/else if/else, dan operator comparison


void main() {
  // 1. DAFTAR HARGA
  // Menggunakan built-in type Map<String, double>
  // key   -> nama barang
  // value -> harga satuan barang
  Map<String, double> daftarHarga = {
    'Beras 5kg': 65000,
    'Minyak Goreng 1L': 18000,
    'Gula Pasir 1kg': 15000,
    'Telur 1kg': 28000,
    'Kopi Sachet': 2000,
  };

  // 2. DAFTAR BELANJAAN
  // Menggunakan built-in type Map<String, int>
  // key   -> nama barang yang dibeli
  // value -> jumlah/quantity yang dibeli
  Map<String, int> daftarBelanjaan = {
    'Beras 5kg': 2,
    'Minyak Goreng 1L': 3,
    'Gula Pasir 1kg': 1,
    'Telur 1kg': 2,
    'Kopi Sachet': 10,
  };

  // Proses perhitungan
  double subtotal = hitungSubtotal(daftarHarga, daftarBelanjaan);
  double persenDiskon = tentukanDiskon(subtotal);
  double totalDiskon = subtotal * (persenDiskon / 100);
  double totalAkhir = hitungTotalAkhir(subtotal, persenDiskon);

  // Menampilkan struk belanja
  tampilkanStruk(
    daftarHarga,
    daftarBelanjaan,
    subtotal,
    persenDiskon,
    totalDiskon,
    totalAkhir,
  );
}


// FUNCTION 1: Menghitung subtotal belanja (sebelum diskon)
double hitungSubtotal(
  Map<String, double> harga,
  Map<String, int> belanjaan,
) {
  double subtotal = 0;

  // Looping setiap barang di daftar belanjaan
  belanjaan.forEach((namaBarang, jumlah) {
    double? hargaSatuan = harga[namaBarang];

    // Operator comparison: memastikan barang ada di daftar harga
    if (hargaSatuan != null) {
      subtotal += hargaSatuan * jumlah;
    }
  });

  return subtotal;
}


// FUNCTION 2: Menentukan persentase diskon
// berdasarkan total belanja (subtotal)
// Menggunakan if / else if / else + operator comparison
double tentukanDiskon(double subtotal) {
  double diskon;

  if (subtotal >= 500000) {
    diskon = 20; // diskon 20% untuk belanja >= 500rb
  } else if (subtotal >= 300000) {
    diskon = 15; // diskon 15% untuk belanja >= 300rb
  } else if (subtotal >= 150000) {
    diskon = 10; // diskon 10% untuk belanja >= 150rb
  } else if (subtotal >= 50000) {
    diskon = 5; // diskon 5% untuk belanja >= 50rb
  } else {
    diskon = 0; // tidak ada diskon
  }

  return diskon;
}

// FUNCTION 3: Menghitung total akhir setelah diskon
double hitungTotalAkhir(double subtotal, double persenDiskon) {
  double totalDiskon = subtotal * (persenDiskon / 100);
  double totalAkhir = subtotal - totalDiskon;
  return totalAkhir;
}

// FUNCTION 4: Menampilkan struk belanja ke layar
void tampilkanStruk(
  Map<String, double> harga,
  Map<String, int> belanjaan,
  double subtotal,
  double persenDiskon,
  double totalDiskon,
  double totalAkhir,
) {
  print('==================================================');
  print('                STRUK BELANJA');
  print('==================================================');

  belanjaan.forEach((namaBarang, jumlah) {
    double hargaSatuan = harga[namaBarang] ?? 0;
    double totalPerItem = hargaSatuan * jumlah;
    print(
      '$namaBarang  x$jumlah  = Rp ${totalPerItem.toStringAsFixed(0)}',
    );
  });

  print('--------------------------------------------------');
  print('Subtotal        : Rp ${subtotal.toStringAsFixed(0)}');
  print('Diskon          : $persenDiskon% (Rp ${totalDiskon.toStringAsFixed(0)})');
  print('==================================================');
  print('TOTAL AKHIR     : Rp ${totalAkhir.toStringAsFixed(0)}');
  print('==================================================');
}
