import 'package:flutter/material.dart';
import 'package:hipoteca/app/presentation/views/ads.dart';
import 'package:hipoteca/app/presentation/views/home/calc/calculos.dart';
import 'package:hipoteca/app/presentation/views/result/result.graphic.dart';
import 'package:hipoteca/app/presentation/views/result/result.resume.dart';
import 'package:hipoteca/app/presentation/views/result/result.table.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class ResultView extends StatefulWidget {
  final num cuota;
  final num pagoTotal;
  final num interesTotal;
  final num periodo;
  final num valor;
  final num inicial;
  final num interes;
  final num valorPrestamo;
  final List<List<String>> tablaPagos;
  ResultView({
    super.key,
    required this.cuota,
    required this.periodo,
    required this.pagoTotal,
    required this.interesTotal,
    required this.valor,
    required this.inicial,
    required this.interes,
    required this.tablaPagos,
    required this.valorPrestamo,
  });

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  num segmentoCuota = 0;
  Calculos fn = Calculos();

  @override
  Widget build(BuildContext context) {
    return AdsView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 20, left: 32, right: 32),
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    segmentoCuota = 0;
                  }),
                  child: Container(
                    height: double.maxFinite,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: segmentoCuota == 0 ? primarioColor : null,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                      child: Text(
                        "Resumen",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    segmentoCuota = 1;
                  }),
                  child: Container(
                    height: double.maxFinite,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: segmentoCuota == 1 ? primarioColor : null,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                      child: Text(
                        "Tabla",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    segmentoCuota = 2;
                  }),
                  child: Container(
                    height: double.maxFinite,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: segmentoCuota == 2 ? primarioColor : null,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                      child: Text(
                        "Gráfico",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: segmentoCuota == 0
                ? ResumenView(
                    fn: fn,
                    cuota: widget.cuota,
                    periodo: widget.periodo,
                    inicial: widget.inicial,
                    interes: widget.interes,
                    interesTotal: widget.interesTotal,
                    pagoTotal: widget.pagoTotal,
                    valor: widget.valor,
                    valorPrestamo: widget.valorPrestamo,
                  )
                : segmentoCuota == 1
                    ? TableView(
                        tablaPagos: widget.tablaPagos,
                        periodo: widget.periodo,
                        fn: fn,
                      )
                    : GraphicView(
                        interesTotal: widget.interesTotal,
                        valorPrestamo: widget.valorPrestamo,
                        pagoTotal: widget.pagoTotal,
                        fn: fn,
                      ),
          ),
        ],
      ),
    );
  }
}
