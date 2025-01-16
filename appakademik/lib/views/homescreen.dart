import 'package:appakademik/views/jadwal_view.dart';
import 'package:flutter/material.dart';
import 'mahasiswa_view01.dart';
import 'matakuliah_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Image.network(
                    'https://uniska-bjm.ac.id/wp-content/uploads/2021/08/logo-uniska-ok-300x300.png', // Ganti dengan URL gambar Anda
                    fit: BoxFit.fill, // Memenuhi seluruh area
                    width: 100, // Kanvas penuh
                    height: 90, // Tinggi gambar
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people_rounded),
              title: Text('Mahasiswa'),
              onTap: () {
                // Handle home tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MahasiswaView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user_sharp),
              title: Text('Mata Kuliah'),
              onTap: () {
                // Handle settings tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MatakuliahView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Jadwal Kuliah'),
              onTap: () {
                // Handle about tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JadwalPage()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'PRAKTIKUM MOBILE SEMESTER 7/8',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
