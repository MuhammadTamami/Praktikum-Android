import 'package:appakademik/views/ubah_mahasiswa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mahasiswa_controller.dart';
//import '../models/mahasiswa.dart';
import 'tambah_mahasiswa.dart';

class MahasiswaView extends StatelessWidget {
  final MahasiswaController controller = Get.put(MahasiswaController());
  MahasiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Mahasiswa"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.mahasiswaList.isEmpty) {
                return Center(child: Text("Tidak ada data mahasiswa"));
              }
              return ListView.builder(
                itemCount: controller.mahasiswaList.length,
                itemBuilder: (context, index) {
                  final mahasiswa = controller.mahasiswaList[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(mahasiswa.photo ??
                                'data:image/png;base64,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'), // Ganti dengan URL foto
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mahasiswa.nama,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text("NPM: ${mahasiswa.npm}"),
                                Text("Email: ${mahasiswa.email}"),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Get.to(() =>
                                  EditMahasiswaView(mahasiswa: mahasiswa));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              print(
                                  'Icon delete diklik untuk ID: ${mahasiswa.id}');
                              controller.deleteMahasiswa(mahasiswa.id!);
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() =>
                  TambahMahasiswaView()); // Navigasi ke halaman tambah mahasiswa
            },
            child: Text("Tambah Mahasiswa"),
          ),
        ],
      ),
    );
  }
}
