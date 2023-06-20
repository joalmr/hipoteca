import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsView extends StatelessWidget {
  final Widget child;
  AdsView({super.key, required this.child});

  final BannerAd banner = BannerAd(
    size: AdSize.banner,
    adUnitId: "ca-app-pub-3940256099942544/6300978111", //TODO: ID PRUEBA
    request: AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (ad) => print("Ad loaded"),
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
        print("Ad failed to load: $error");
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    banner.load();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: child),
            Container(
              width: banner.size.width.toDouble(),
              height: banner.size.height.toDouble(),
              child: AdWidget(ad: banner),
            ),
          ],
        ),
      ),
    );
  }
}