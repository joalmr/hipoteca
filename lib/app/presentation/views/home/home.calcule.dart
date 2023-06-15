import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
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

  // final BannerAd banner = BannerAd(
  //   size: AdSize.banner,
  //   adUnitId: "",
  //   listener: BannerAdListener(),
  //   request: AdRequest(),
  // );

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
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                      TextFormInput(
                        hintText: "Valor de la vivienda",
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
                          hintText: "Cuota inicial",
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
                            hintText: "Intereses",
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
                  String val1 = valorCtr.text.replaceAll(',', '');
                  String val2 = inicialCtr.text.replaceAll(',', '');
                  valor = double.parse(val1);
                  inicial = double.parse(val2);

                  num interesNum = num.parse(interesCtr.text);

                  if (inicial > valor) {
                    const snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                          'La cuota inicial debe ser menor al valor de la vivienda'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    Calculos fn = Calculos();
                    final results =
                        await fn.exec(valor, inicial, periodo, interesNum);

                    String cuotaDec2 = results[0].toStringAsFixed(2);
                    fn.convertMil(results[0]);

                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (_) => ResultView(
                          cuota: cuotaDec2,
                          periodo: periodo,
                          inicial: inicialCtr.text,
                          interes: interesCtr.text,
                          interesTotal: results[2].toStringAsFixed(2),
                          pagoTotal: results[1].toStringAsFixed(2),
                          valor: valorCtr.text,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            // AdWidget(ad: banner),
          ],
        ),
      ),
    );
  }
}
