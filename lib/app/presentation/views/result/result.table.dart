import 'package:flutter/material.dart';
import 'package:hipoteca/main.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class TableView extends StatelessWidget {
  const TableView({super.key});

  @override
  Widget build(BuildContext context) {
    final calculeLogic = MyInheretedWidget.of(context)!.calculeLogic;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 42),
              child: Text(
                "Tabla de amortización anual",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 0.25),
              padding: EdgeInsets.all(8),
              color: primarioColor,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Cuota",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Interés",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Amortización",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Saldo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            for (int i = 0; i < calculeLogic.periodo; i++)
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 0.25),
                padding: EdgeInsets.all(8),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${(i + 1)})",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              calculeLogic.sumCuota[i],
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Text(
                          calculeLogic.sumInteres[i],
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Text(
                          calculeLogic.sumAmortiza[i],
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Text(
                          calculeLogic.sumSaldo[i],
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}
