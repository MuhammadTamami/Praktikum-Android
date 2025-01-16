import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/homescreen.dart';

void main() {
  runApp(aplikasiku());
}

class aplikasiku extends StatelessWidget {
  const aplikasiku({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mahasiswa App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
