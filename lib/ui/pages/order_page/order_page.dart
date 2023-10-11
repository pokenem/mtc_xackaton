import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mtc_xackaton/ui/widgets/app_bar.dart';

import 'widgets/payment_tile.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: createAppBar(hasBackButton: true, hasListButton: false),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                      bottom: 11,
                    ),
                    child: Text('Оформление покупки'),
                  ),
                  ListTile(
                    title: const Text('Название'),
                    trailing: const Text('sum'),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Color(0xFFD2D2D2), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('Способ оплаты'),
                  ),
                  PaymentTile(
                      way: 'Оплата картой',
                      image: SvgPicture.asset('assets/web_pay.svg')),
                  PaymentTile(
                      way: 'Оплата через МТС деньги',
                      image: SvgPicture.asset('assets/mts_money.svg')),
                  PaymentTile(
                      way: 'Оплата ЕРИП',
                      image: SvgPicture.asset('assets/erip_pay.svg')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
