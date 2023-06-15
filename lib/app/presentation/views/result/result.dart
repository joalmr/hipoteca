import 'package:flutter/material.dart';
import 'package:hipoteca/app/presentation/views/ads.dart';
import 'package:hipoteca/app/presentation/views/home/calc/calculos.dart';
import 'package:hipoteca/app/presentation/views/result/widgets/detalle.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class ResultView extends StatelessWidget {
  final String cuota;
  final String pagoTotal;
  final String interesTotal;
  final num periodo;
  final String valor;
  final String inicial;
  final String interes;
  ResultView({
    super.key,
    required this.cuota,
    required this.periodo,
    required this.pagoTotal,
    required this.interesTotal,
    required this.valor,
    required this.inicial,
    required this.interes,
  });

  @override
  Widget build(BuildContext context) {
    Calculos fn = Calculos();
    return AdsView(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tu cuota mensual es",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              fn.convertMil(num.parse(cuota)),
              style: TextStyle(
                color: primarioColor,
                fontSize: 48,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "financiado en $periodo años",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 62),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DetalleCuota(
                    texto: "Interes total:",
                    valor: fn.convertMil(num.parse(interesTotal)),
                  ),
                  DetalleCuota(
                    texto: "Pago total:",
                    valor: fn.convertMil(num.parse(pagoTotal)),
                  ),
                  DetalleCuota(
                    texto: "Valor vivienda:",
                    valor: valor,
                  ),
                  DetalleCuota(
                    texto: "Cuota inicial:",
                    valor: inicial,
                  ),
                  DetalleCuota(
                    texto: "Interés:",
                    valor: "$interes%",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    // SafeArea(
    //   child: Scaffold(
    //     body:
    //   ),
    // );
  }
}
