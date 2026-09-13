void main(){
  Map<String,double> Etalase = {
    'Beras 5kg': 15000,
    'Telur 1 rak': 55000,
    'Air Galon': 23000,
    'Sabun 450ml': 25000,
    'Shampoo 450ml': 30000,
    'Ayam 1 ekor': 70000,
  };

  Map<String,int> DaftarBelanjaan = {
    'Beras 5kg': 2,
    'Telur 1 rak': 1,
    'Air Galon': 3,
    'Sabun 450ml': 2,
    'Shampoo 450ml': 1,
    'Ayam 1 ekor': 1,
  };

  double TotalAwal = HitungTotalAwal(Etalase, DaftarBelanjaan);
  double PersenDiskon = PersenanDiskon(TotalAwal);
  double TotalDiskon = TotalAwal * (PersenDiskon/100);
  double TotalAkhir = TotalAwal - TotalDiskon;

  TampilkanStruk(
    Etalase,
    DaftarBelanjaan,
    TotalAkhir,
    PersenDiskon,
    TotalDiskon,
    TotalAkhir,
  );
}

double HitungTotalAwal (  
  Map<String, double> harga,
  Map<String, int> belanjaan,
){
  double subtotal = 0;

  belanjaan.forEach((namaBarang, jumlah) {
    double? hargaSatuan = harga[namaBarang];

    if (hargaSatuan != null) {
      subtotal += hargaSatuan * jumlah;
    }
  });

  return subtotal;
  }

double PersenanDiskon(double subtotal){
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

void TampilkanStruk(
  Map<String, double> harga,
  Map<String, int> belanjaan,
  double subtotal,
  double persenDiskon,
  double totalDiskon,
  double totalAkhir,
){
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