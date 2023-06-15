import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hipoteca/app/presentation/views/home/home.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hipoteca',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: fondoColorPet,
        textTheme: GoogleFonts.ubuntuTextTheme(textTheme),
      ),
      home: HomeView(),
    );
  }
}
