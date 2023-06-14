import 'package:flutter/material.dart';
import 'package:hipoteca/app/presentation/views/home/home.dart';
import 'package:hipoteca/src/styles/themes/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hipoteca',
      theme: temaClaro,
      home: HomeView(),
    );
  }
}
