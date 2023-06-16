import 'package:flutter/material.dart';
import 'package:hipoteca/app/presentation/views/home/calc/calculos.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class TableView extends StatelessWidget {
  final List<List<String>> tablaPagos;
  final num periodo;
  final Calculos fn;
  const TableView({
    super.key,
    required this.tablaPagos,
    required this.periodo,
    required this.fn,
  });

  @override
  Widget build(BuildContext context) {
    print(tablaPagos);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 42),
              child: Text(
                "Tabla de amortización",
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
            for (int i = 0; i < periodo; i++)
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
                        child: Text(
                          fn.convertMil(num.parse(tablaPagos[0][i])),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Text(
                          fn.convertMil(num.parse(tablaPagos[1][i])),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Text(
                          fn.convertMil(num.parse(tablaPagos[2][i])),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Text(
                          fn.convertMil(num.parse(tablaPagos[3][i])),
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
