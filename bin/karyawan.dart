// 24 september 2024
// pertemuan 2 membuat project karyawan

import 'package:intl/intl.dart';

const UMR = 3000000;

var numFormat = NumberFormat("#,000");
var dateFormat = DateFormat('yyyy-MM-dd');

abstract class karyawan {
  String npp = ""; //not nullable
  String nama = "";
  String? alamat; //nullable
  int tahunMasuk;
  int _gaji = UMR;

  karyawan(this.npp, this.nama, {this.tahunMasuk = 2024}); //constructor

  void presensi(DateTime jamMasuk); 


  // int get tunjangan {
  //   if ((2023 - tahunMasuk) > 5) {
  //     return 50000;
  //   }else {
  //     return 100000;
  //   }
  // }

  //versi menggunakan arrow function
  int get tunjangan;

  int get gaji => (gaji + tunjangan);

  void set gaji(int gaji) {
    if(gaji < UMR) {
      _gaji = UMR;
      print("GAJI KURANG DARI UMR, LU MISKIN");
    }else {
      //print("test")
      _gaji = gaji;
    }
  }

  String deskripsi() {
    String teks = '''===================
    NPP  : $npp
    Nama : $nama
    Gaji : ${numFormat.format(_gaji)}
    ''';

    if(alamat != null) {
      teks += "Alamat : $alamat\n";
    }
    return teks;
  }
}

class StafBiasa extends karyawan {  //subclass

  StafBiasa(super.npp, super.nama, {tahunMasuk = 2015});



  @override
  void presensi(DateTime jamMasuk) {
  
    if (jamMasuk.hour > 8) {
      print("$nama pada ${dateFormat.format(jamMasuk)} datang terlambat");
    } else {
      print("$nama ${dateFormat.format(jamMasuk)} datang tepat waktu");
    }
  
  }

  @override
  // TODO: implement tunjangan
  int get tunjangan => ((2023 - tahunMasuk) < 5 ) ? 50000 : 100000;
} 

enum TipeJabatan {direktur, manajer, vicepresident}

class Pejabat extends karyawan {//subclass

  TipeJabatan jabatan;

  Pejabat(super.npp, super.nama, this.jabatan,);

  @override
  void presensi(DateTime jamMasuk) {
  
    if (jamMasuk.hour > 10) {
      print("$nama ${dateFormat.format(jamMasuk)} datang terlambat");
    } else {
      print("$nama ${dateFormat.format(jamMasuk)} datang tepat waktu");
    }
  
  }
  
  @override
  // TODO: implement tunjangan
  int get tunjangan {
    if(jabatan == TipeJabatan.direktur){
      return 2500000;
    }else if(jabatan == TipeJabatan.manajer){
      return 2000000;
    }else {
      return 1500000;
    }
  }

  @override
  String deskripsi() {
    // TODO: implement deskripsi
    String teks = super.deskripsi();
    teks += "Jabatan : ${jabatan.name}";
    return teks;
  }

} 























//  