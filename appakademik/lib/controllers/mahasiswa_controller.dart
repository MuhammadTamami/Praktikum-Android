import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/mahasiswa.dart';

class MahasiswaController extends GetxController {
  var mahasiswaList = <Mahasiswa>[].obs;
// IP dari laravel dijalankan pada flutter run
//final String apiUrl = 'http://127.0.0.1:8000/api/mahasiswa';
//final String apiUrl = 'http://mahasiswa-api.tes/api/mahasiswa'; '
// untuk emulator android studio gunakan IP dibawah ini
  final String apiUrl = 'http://10.0.2.2:8000/api/mahasiswa';
  @override
  void onInit() {
    super.onInit();
    tangkapDataMahasiswa(); // Memanggil fetch data saat controller diinisialisasi
  }

  Future<void> tangkapDataMahasiswa() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      mahasiswaList.value =
          data.map((item) => Mahasiswa.fromJson(item)).toList();
    } else {
      Exception('Gagal Ambil Data mahasiswa');
    }
  }

  Future<void> addMahasiswa(Mahasiswa mahasiswa) async {
    final response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(mahasiswa.toJson()));
    if (response.statusCode == 201) {
      mahasiswaList.add(Mahasiswa.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Gagal Simpan Data mahasiswa');
    }
  }

  Future<void> updateMahasiswa(int id, Mahasiswa mahasiswa) async {
    final response = await http.put(Uri.parse('$apiUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(mahasiswa.toJson()));
    if (response.statusCode == 200) {
      final index = mahasiswaList.indexWhere((m) => m.id == id);
      if (index != -1) {
        mahasiswaList[index] = Mahasiswa.fromJson(json.decode(response.body));
      }
    } else {
      throw Exception('Gagal Ubah Data mahasiswa');
    }
  }

  // Future<void> deleteMahasiswa(int id) async {
  // //   final response = await http.delete(Uri.parse('$apiUrl/$id'));

  // //   if (response.statusCode == 204) {
  // //     mahasiswaList.removeWhere((m) => m.id == id);
  // //   } else {
  // //     throw Exception('Gagal Hapus Data Mahasiswa');
  // //   }
  // // }

  // try {
  //   final response = await http.delete(Uri.parse('$apiUrl/$id'));
  //   if(response.statusCode == 204)
  //   {
  //     mahasiswaList.removeWhere((m) => m.id == id);
  //   }
  // }
  //   catch(e) {
  //     print(e.toString());
  //   }
  // }

  Future<void> deleteMahasiswa(int id) async {
  print('Menghapus mahasiswa dengan ID: $id');
  final response = await http.delete(Uri.parse('$apiUrl/$id'));
  try {
    print('Response status code: ${response.statusCode}');
    if (response.statusCode == 204) {
      mahasiswaList.removeWhere((m) => m.id == id);
      print('Mahasiswa berhasil dihapus.');
    } else {
      print('Gagal menghapus. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  } catch (e) {
    print('Exception caught: ${e.toString()}');
  }
}

}
