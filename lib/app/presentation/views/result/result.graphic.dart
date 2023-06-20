import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hipoteca/app/presentation/views/home/calc/calculos.dart';
import 'package:hipoteca/app/presentation/views/result/widgets/detalle_grafico.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class GraphicView extends StatelessWidget {
  final num interesTotal;
  final num valorPrestamo;
  final num pagoTotal;
  final Calculos fn;
  const GraphicView({
    super.key,
    required this.interesTotal,
    required this.valorPrestamo,
    required this.pagoTotal,
    required this.fn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 20),
            child: PieChartSample3(
              interesTotal: interesTotal,
              valorPrestamo: valorPrestamo,
              pagoTotal: pagoTotal,
            ),
          ),
          GraficoDetalle(
            texto: "Interés total:",
            valor: fn.convertMil(interesTotal),
            color: primarioColor,
          ),
          GraficoDetalle(
            texto: "Valor préstamo:",
            valor: fn.convertMil(valorPrestamo),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class PieChartSample3 extends StatefulWidget {
  final num interesTotal;
  final num valorPrestamo;
  final num pagoTotal;
  PieChartSample3({
    super.key,
    required this.interesTotal,
    required this.valorPrestamo,
    required this.pagoTotal,
  });

  @override
  State<StatefulWidget> createState() => PieChartSample3State(
        interesTotal,
        valorPrestamo,
        pagoTotal,
      );
}

class PieChartSample3State extends State {
  final num interesTotal;
  final num valorPrestamo;
  final num pagoTotal;

  PieChartSample3State(
    this.interesTotal,
    this.valorPrestamo,
    this.pagoTotal,
  );

  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(show: false),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(
              interesTotal,
              valorPrestamo,
              pagoTotal,
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
    num interesTotal,
    num valorPrestamo,
    num pagoTotal,
  ) {
    final porcInteres = interesTotal / pagoTotal;
    final procPrestamo = valorPrestamo / pagoTotal;

    print(porcInteres);
    print(procPrestamo);

    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: primarioColor,
            value: porcInteres,
            title: '${(porcInteres * 100).toStringAsFixed(0)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              // color: const Color(0xffffffff),
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.white,
            value: procPrestamo,
            title: '${(procPrestamo * 100).toStringAsFixed(0)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              // color: const Color(0xffffffff),
              shadows: shadows,
            ),
          );

        default:
          throw Exception('Oh no');
      }
    });
  }
}
