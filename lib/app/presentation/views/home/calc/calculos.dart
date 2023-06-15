import 'dart:math';
import 'package:intl/intl.dart';

class Calculos {
  Future<List<num>> exec(
    num valor,
    num inicial,
    num periodo,
    num interesNum,
  ) async {
    List<num> results = [];
    num resultCuota = await cuota(valor, inicial, periodo, interesNum);
    num resultPagoTotal = await pagoTotal(resultCuota, periodo);
    num resultInteresTotal =
        await interesTotal(resultPagoTotal, valor, inicial);

    results = [resultCuota, resultPagoTotal, resultInteresTotal];

    tablaPagos(resultCuota, interesNum / 100, (valor - inicial), periodo);

    return results;
  }

  void tablaPagos(num cuota, num interes, num saldo, num periodo) {
    num newSaldo = saldo;
    // num newCuota = cuota;

    List<String> tablaInteres = [];
    List<String> tablaAmortiza = [];
    List<String> tablaSaldo = [];
    // List<String> tablaCuota = [];

    for (var i = 0; i < (periodo * 12); i++) {
      num primerInteres = newSaldo * (interes / 12);
      num primerAmortiaza = cuota - primerInteres;
      num primerSaldo = newSaldo - primerAmortiaza;

      newSaldo = primerSaldo;

      tablaInteres.add(primerInteres.toStringAsFixed(2));
      tablaAmortiza.add(primerAmortiaza.toStringAsFixed(2));
      tablaSaldo.add(primerSaldo.toStringAsFixed(2));
      // tablaCuota.add(primeraCuota.toStringAsFixed(2));
    }

    var iPri = 0;
    var mesPri = 12;
    List<String> sumInteres = [];
    List<String> sumAmortiza = [];
    List<String> sumSaldo = [];
    List<String> sumCuota = [];
    for (var i = 0; i < tablaInteres.length + 1; i++) {
      if (i == mesPri) {
        num sumaInt = 0;
        num sumaAmo = 0;

        for (var i = iPri; i < mesPri; i++) {
          sumaInt = sumaInt + num.parse(tablaInteres[i]);
          sumaAmo = sumaAmo + num.parse(tablaAmortiza[i]);
        }
        sumInteres.add(sumaInt.toStringAsFixed(2));
        sumAmortiza.add(sumaAmo.toStringAsFixed(2));

        sumSaldo.add(tablaSaldo[mesPri - 1]);

        num cuotas = cuota * 12;
        sumCuota.add(cuotas.toStringAsFixed(2));

        iPri = iPri + 12;
        mesPri = mesPri + 12;
      }
    }

    print("===>");
    print(sumInteres);
    print(sumAmortiza);
    print(sumSaldo);
    print(sumCuota);
  }

  num cuota(num valor, num inicial, num periodo, num interes) {
    num financiar = valor - inicial;
    num formA = financiar * ((interes / 100) / 12);
    num formBnum = 1 + ((interes / 100) / 12);
    num formBexp = -(12 * periodo);
    num formB = 1 - pow(formBnum, formBexp);

    num result = formA / formB;

    return result;
  }

  num pagoTotal(num cuota, num periodo) {
    num pagoTotal = cuota * (periodo * 12);
    return pagoTotal;
  }

  num interesTotal(num pagoTotal, num valor, num inicial) {
    num interesTotal = pagoTotal - (valor - inicial);
    return interesTotal;
  }

  String convertMil(num numero) {
    NumberFormat f = new NumberFormat("#,##0.00", "en_US");
    String dato = f.format(numero);

    return dato;
  }
}
