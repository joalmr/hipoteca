import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hipoteca/app/presentation/views/home/home.calcule.dart';
import 'package:hipoteca/app/presentation/widgets/button/primary.button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 8),
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Calcula el",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                      ),
                      Text(
                        "costo real de",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                      ),
                      EasyRichText(
                        "tu nuevo hogar",
                        defaultStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                        patternList: [
                          EasyRichTextPattern(
                            targetString: 'nuevo hogar',
                            style: TextStyle(
                              color: Color(0xFF33E1EC),
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 24,
              ),
              child: ButtonPrimary(
                  text: "Continuar",
                  onPressed: () {
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (_) => CalculeView(),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
