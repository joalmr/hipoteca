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

    return results;
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
    print(dato);

    return dato;
  }
}
