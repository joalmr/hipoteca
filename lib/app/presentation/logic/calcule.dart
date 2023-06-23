import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalculeLogic extends ChangeNotifier {
  num valor = 0;
  num inicial = 0;
  num periodo = 5;
  num interes = 0;
  num financiar = 0;
  //
  num resCuota = 0;
  num resPagoTotal = 0;
  num resInteresTotal = 0;
  num resValorPrestamo = 0;
  //
  String strCuota = "";
  String strPagoTotal = "";
  String strInteresTotal = "";
  String strValorPrestamo = "";
  String strValorVivienda = "";
  String strInicial = "";
  //
  List<String> sumCuota = [];
  List<String> sumInteres = [];
  List<String> sumAmortiza = [];
  List<String> sumSaldo = [];

  List<List<String>> results = [];

  void opcPeriodo(num value) {
    periodo = value;
    notifyListeners();
  }

  void calculos() {
    financiar = valor - inicial;
    num formA = financiar * ((interes / 100) / 12);
    num formBnum = 1 + ((interes / 100) / 12);
    num formB = 1 - pow(formBnum, -(12 * periodo));

    resCuota = formA / formB; //cuota
    resPagoTotal = resCuota * (periodo * 12); //pago total
    resInteresTotal = resPagoTotal - (valor - inicial); //interes total
    resValorPrestamo = valor - inicial;
    //
    strCuota = convertMil(resCuota);
    strPagoTotal = convertMil(resPagoTotal);
    strInteresTotal = convertMil(resInteresTotal);
    strValorPrestamo = convertMil(resValorPrestamo);

    strValorVivienda = convertMil(valor);
    strInicial = convertMil(inicial);

    notifyListeners();
  }

  void tablaPagos() {
    num newSaldo = financiar;

    List<String> tablaInteres = [];
    List<String> tablaAmortiza = [];
    List<String> tablaSaldo = [];

    for (var i = 0; i < (periodo * 12); i++) {
      num primerInteres = newSaldo * ((interes / 100) / 12);
      num primerAmortiaza = resCuota - primerInteres;
      num primerSaldo = newSaldo - primerAmortiaza;

      newSaldo = primerSaldo;

      tablaInteres.add(primerInteres.toStringAsFixed(2));
      tablaAmortiza.add(primerAmortiaza.toStringAsFixed(2));
      tablaSaldo.add(primerSaldo.toStringAsFixed(2));
    }

    var iPri = 0;
    var mesPri = 12;

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

        num cuotas = resCuota * 12;
        sumCuota.add(cuotas.toStringAsFixed(2));

        iPri = iPri + 12;
        mesPri = mesPri + 12;
      }
    }

    // results = [
    //   sumCuota,
    //   sumInteres,
    //   sumAmortiza,
    //   sumSaldo,
    // ];

    notifyListeners();
  }

  String convertMil(num numero) {
    NumberFormat f = new NumberFormat("#,##0.00", "en_US");
    String dato = f.format(numero);

    return dato;
  }
}
