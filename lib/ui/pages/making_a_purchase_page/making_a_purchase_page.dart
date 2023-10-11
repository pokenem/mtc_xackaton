import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mtc_xackaton/ui/pages/making_a_purchase_page/widgets/payment_tile.dart';
import 'package:mtc_xackaton/ui/widgets/app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SertificatePageMain(),
    );
  }
}

class SertificatePageMain extends StatelessWidget {
  const SertificatePageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: createAppBar(hasBackButton: true,hasListButton: true),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                      bottom: 11,
                    ),
                    child: Text('Оформление покупки'),
                  ),
                  ListTile(
                    title: Text('Название'),
                    trailing: Text('sum'),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFFD2D2D2), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('Способ оплаты'),
                  ),
                  PaymentTile(way: "Оплата картой", image: SvgPicture.asset('assets/web_pay.svg')),
                  PaymentTile(way: 'Оплата через МТС деньги', image: SvgPicture.asset('assets/mts_money.svg')),
                  PaymentTile(way: "Оплата ЕРИП", image: SvgPicture.asset('assets/erip_pay.svg')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}