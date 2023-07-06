import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hipoteca/app/presentation/logic/calcule.dart';
import 'package:hipoteca/app/presentation/views/home/home.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final calculeLogic = CalculeLogic();
    return MyInheretedWidget(
      calculeLogic: calculeLogic,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hipoteca',
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: fondoColorPet,
          textTheme: GoogleFonts.ubuntuTextTheme(textTheme),
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: primarioColor),
        ),
        home: HomeView(),
      ),
    );
  }
}

class MyInheretedWidget extends InheritedWidget {
  final CalculeLogic calculeLogic;
  MyInheretedWidget({
    required super.child,
    required this.calculeLogic,
  });

  static MyInheretedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
