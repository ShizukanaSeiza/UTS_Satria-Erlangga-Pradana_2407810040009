import 'package:flutter/material.dart';
import 'package:uts_satria_erlangga_pradana_2407810040009/jawaban/login.dart';
import 'package:uts_satria_erlangga_pradana_2407810040009/jawaban/menudaftar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}
