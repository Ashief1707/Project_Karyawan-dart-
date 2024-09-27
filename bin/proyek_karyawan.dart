 import "karyawan.dart";

void main(List<String> arguments) {

  List <karyawan> dataKaryawan = genData(dummyData());

  dataKaryawan[0].presensi(DateTime.parse('2023-08-08 07:00:00'));
  dataKaryawan[1].presensi(DateTime.parse('2023-08-08 09:01:01'));
  dataKaryawan[2].presensi(DateTime.parse('2023-08-08 08:30:00'));

  dataKaryawan[0].gaji = 10000000;
  dataKaryawan[1].gaji = 1000000;
  dataKaryawan[2].gaji = 5000000;

  dataKaryawan[0].alamat = "Semarang";

  
  for (var StafBiasa in dataKaryawan) {
    print(StafBiasa.deskripsi());
  }

}

List<karyawan> genData(var listData){
  List<karyawan> data = [];

  for (var dataPegawai in listData){
    karyawan pegawai;
    if(dataPegawai.containsKey('jabatan')){
      pegawai = Pejabat(dataPegawai['npp'], dataPegawai['nama'], dataPegawai['jabatan']);
    }else{
      pegawai = StafBiasa(dataPegawai['npp'], dataPegawai['nama']);
    }

    if(dataPegawai.containsKey('thn_masuk')){
      pegawai.tahunMasuk = dataPegawai['thn_masuk'];
    }

    if(dataPegawai.containsKey('alamt')){
      pegawai.alamat = dataPegawai['alamat'];
    }

    data.add(pegawai);

  }

  return data;
}

List<Map<String, dynamic >> dummyData(){
  List<Map<String, dynamic>> data = [
    {
      "npp": "A111",
      "nama": "Ashief ",
      "thn_masuk": 2020,
      "jabatan": TipeJabatan.direktur,
      "alamat": "Rembang, Indonesia"
    },
    {
      "npp": "A222",
      "nama": "Nur",
      "thn_masuk": 2021,
      "jabatan": TipeJabatan.manajer,
      "alamat": "Semarang, Indonesia"
    },
    {"npp": "A444", "nama": "Kiano", "alamat": "Tegal, Plosok"},
    {
      "npp": "A333",
      "nama": "Paijo",
      "thn_masuk": 2019,
      "alamat": "Semarang, Indonesia"
    },
    {
      "npp": "A555",
      "nama": "Haji Kodir",
      "jabatan": TipeJabatan.vicepresident,
      "alamat": "Semarang, Indonesia"
    }
  ];
  return data;
}