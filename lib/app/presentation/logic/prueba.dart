List<List<String>> tablaPagos(num cuota, num interes, num saldo, num periodo) {
  List<List<String>> results = [];

  num newSaldo = saldo;

  List<String> tablaInteres = [];
  List<String> tablaAmortiza = [];
  List<String> tablaSaldo = [];

  for (var i = 0; i < (periodo * 12); i++) {
    num primerInteres = newSaldo * (interes / 12);
    num primerAmortiaza = cuota - primerInteres;
    num primerSaldo = newSaldo - primerAmortiaza;

    newSaldo = primerSaldo;

    tablaInteres.add(primerInteres.toStringAsFixed(2));
    tablaAmortiza.add(primerAmortiaza.toStringAsFixed(2));
    tablaSaldo.add(primerSaldo.toStringAsFixed(2));
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

  results = [
    sumCuota,
    sumInteres,
    sumAmortiza,
    sumSaldo,
  ];
  return results;
}
