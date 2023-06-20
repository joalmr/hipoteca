import 'package:flutter/material.dart';
import 'package:hipoteca/app/presentation/views/home/calc/calculos.dart';
import 'package:hipoteca/app/presentation/views/result/widgets/detalle.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class ResumenView extends StatelessWidget {
  final Calculos fn;
  final num cuota;
  final num pagoTotal;
  final num interesTotal;
  final num periodo;
  final num valor;
  final num inicial;
  final num interes;
  final num valorPrestamo;
  const ResumenView({
    super.key,
    required this.fn,
    required this.cuota,
    required this.pagoTotal,
    required this.interesTotal,
    required this.periodo,
    required this.valor,
    required this.inicial,
    required this.interes,
    required this.valorPrestamo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // height: double.maxFinite,
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
            fn.convertMil(cuota),
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
                  texto: "Interés total:",
                  valor: fn.convertMil(interesTotal),
                ),
                DetalleCuota(
                  texto: "Pago total vivienda:",
                  valor: fn.convertMil(pagoTotal),
                ),
                DetalleCuota(
                  texto: "Valor vivienda:",
                  valor: fn.convertMil(valor),
                ),
                DetalleCuota(
                  texto: "Cuota inicial:",
                  valor: fn.convertMil(inicial),
                ),
                DetalleCuota(
                  texto: "Valor préstamo:",
                  valor: fn.convertMil(valorPrestamo),
                ),
                DetalleCuota(
                  texto: "Tasa interés:",
                  valor: "$interes%",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
