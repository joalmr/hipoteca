import 'package:flutter/material.dart';
import 'package:hipoteca/app/presentation/views/result/widgets/detalle.dart';
import 'package:hipoteca/main.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class ResumenView extends StatelessWidget {
  const ResumenView({super.key});

  @override
  Widget build(BuildContext context) {
    final calculeLogic = MyInheretedWidget.of(context)!.calculeLogic;
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tu cuota mensual es",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            calculeLogic.strCuota,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 48,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "financiado en ${calculeLogic.periodo} años",
            style: TextStyle(
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
                  valor: calculeLogic.strInteresTotal,
                ),
                DetalleCuota(
                  texto: "Pago total vivienda:",
                  valor: calculeLogic.strPagoTotal,
                ),
                DetalleCuota(
                  texto: "Valor vivienda:",
                  valor: calculeLogic.strValorVivienda,
                ),
                DetalleCuota(
                  texto: "Cuota inicial:",
                  valor: calculeLogic.strInicial,
                ),
                DetalleCuota(
                  texto: "Valor préstamo:",
                  valor: calculeLogic.strValorPrestamo,
                ),
                DetalleCuota(
                  texto: "Tasa interés:",
                  valor: "${calculeLogic.interes}%",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
