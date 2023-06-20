import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hipoteca/app/presentation/views/ads.dart';
import 'package:hipoteca/app/presentation/views/home/widgets/card.calcule.dart';
import 'package:hipoteca/app/presentation/views/home/widgets/titulo_calcule.dart';
import 'package:hipoteca/app/presentation/views/result/result.dart';
import 'package:hipoteca/app/presentation/widgets/button/primary.button.dart';
import 'package:hipoteca/app/presentation/widgets/textformfield/input.widget.dart';

import 'calc/calculos.dart';

class CalculeView extends StatefulWidget {
  const CalculeView({super.key});

  @override
  State<CalculeView> createState() => _CalculeViewState();
}

class _CalculeViewState extends State<CalculeView> {
  TextEditingController valorCtr = TextEditingController();
  TextEditingController inicialCtr = TextEditingController();
  TextEditingController interesCtr = TextEditingController();

  final money = TextInputMask(
    mask: '9+,999,999.99',
    placeholder: '0',
    maxPlaceHolders: 3,
    reverse: true,
    maxLength: 14,
  );
  final interes = TextInputMask(
    mask: '9+.99',
    placeholder: '0',
    maxPlaceHolders: 3,
    reverse: true,
    maxLength: 5,
  );

  num valor = 0, inicial = 0, periodo = 5;

  bool periodo1 = true,
      periodo2 = false,
      periodo3 = false,
      periodo4 = false,
      periodo5 = false,
      periodo6 = false;

  @override
  Widget build(BuildContext context) {
    return AdsView(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: double.maxFinite,
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    TituloCalcule(),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    TextFormInput(
                      labelText: "Valor de la vivienda",
                      controller: valorCtr,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        money,
                        LengthLimitingTextInputFormatter(14),
                      ],
                      // maxLength: 14,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: TextFormInput(
                        labelText: "Cuota inicial",
                        controller: inicialCtr,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          money,
                          LengthLimitingTextInputFormatter(14),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: GestureDetector(
                        child: TextFormInput(
                          labelText: "Tasa de interés",
                          controller: interesCtr,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            interes,
                            LengthLimitingTextInputFormatter(5)
                          ],
                          suffix: Container(
                            child: Text(
                              "%",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18, right: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              "Periodos en años",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      periodo1 = true;
                                      periodo = 5;
                                      periodo2 = periodo3 = periodo4 =
                                          periodo5 = periodo6 = false;
                                    });
                                  },
                                  child: CardCalcule(
                                    periodo: periodo1,
                                    numero: 5,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      periodo2 = true;
                                      periodo = 10;
                                      periodo1 = periodo3 = periodo4 =
                                          periodo5 = periodo6 = false;
                                    });
                                  },
                                  child: CardCalcule(
                                    periodo: periodo2,
                                    numero: 10,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      periodo3 = true;
                                      periodo = 15;
                                      periodo1 = periodo2 = periodo4 =
                                          periodo5 = periodo6 = false;
                                    });
                                  },
                                  child: CardCalcule(
                                    periodo: periodo3,
                                    numero: 15,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      periodo4 = true;
                                      periodo = 20;
                                      periodo1 = periodo2 = periodo3 =
                                          periodo5 = periodo6 = false;
                                    });
                                  },
                                  child: CardCalcule(
                                    periodo: periodo4,
                                    numero: 20,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      periodo5 = true;
                                      periodo = 25;
                                      periodo1 = periodo2 = periodo3 =
                                          periodo4 = periodo6 = false;
                                    });
                                  },
                                  child: CardCalcule(
                                    periodo: periodo5,
                                    numero: 25,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      periodo6 = true;
                                      periodo = 30;
                                      periodo1 = periodo2 = periodo3 =
                                          periodo4 = periodo5 = false;
                                    });
                                  },
                                  child: CardCalcule(
                                    periodo: periodo6,
                                    numero: 30,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 24,
              top: 18,
            ),
            child: ButtonPrimary(
              text: "Calcular",
              onPressed: () async {
                if (valorCtr.text.isEmpty ||
                    inicialCtr.text.isEmpty ||
                    interesCtr.text.isEmpty) {
                  const snackBar = SnackBar(
                    backgroundColor: Color(0xFFbf3a2b),
                    content: Text('Ingrese todos los campos'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  String val1 = valorCtr.text.replaceAll(',', '');
                  String val2 = inicialCtr.text.replaceAll(',', '');
                  valor = double.parse(val1);
                  inicial = double.parse(val2);

                  num interesNum = num.parse(interesCtr.text);

                  if (inicial > valor) {
                    const snackBar = SnackBar(
                      backgroundColor: Color(0xFFbf3a2b),
                      content: Text(
                          'La cuota inicial debe ser menor al valor de la vivienda'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  if (interesNum == 0) {
                    const snackBar = SnackBar(
                      backgroundColor: Color(0xFFbf3a2b),
                      content: Text('Interés debe ser mayor a 0'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    Calculos fn = Calculos();
                    final results =
                        await fn.exec(valor, inicial, periodo, interesNum);

                    final tabla = await fn.tablaPagos(
                      results[0],
                      num.parse(interesCtr.text) / 100,
                      (valor - inicial),
                      periodo,
                    );

                    print(tabla);

                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (_) => ResultView(
                          cuota: results[0],
                          periodo: periodo,
                          inicial:
                              num.parse(inicialCtr.text.replaceAll(",", "")),
                          interes:
                              num.parse(interesCtr.text.replaceAll(",", "")),
                          interesTotal: results[2],
                          pagoTotal: results[1],
                          valor: num.parse(valorCtr.text.replaceAll(",", "")),
                          tablaPagos: tabla,
                          valorPrestamo: results[3],
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
