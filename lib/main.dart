
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/views/screens/splashscreen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}