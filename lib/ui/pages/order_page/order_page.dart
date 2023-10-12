import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mtc_xackaton/model/certificate.dart';
import 'package:mtc_xackaton/ui/widgets/app_bar.dart';

import '../../assets.dart';
import 'widgets/payment_tile.dart';

class OrderPage extends StatelessWidget {
  final Certificate cert;

  const OrderPage({super.key, required this.cert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: createAppBar(
        title: 'Оформление покупки',
        hasBackButton: true,
        hasListButton: false,
      ),
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
                  const SizedBox(height: 10),
                  ListTile(
                    title: Text(
                      cert.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        fontFamily: 'Arial',
                        height: 16 / 14,
                      ),
                    ),
                    trailing: Text(
                      '${cert.cost} BYN',
                      style: const TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 16 / 14,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFFD2D2D2), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Способ оплаты',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        height: 23 / 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  PaymentTile(
                    way: 'Оплата картой',
                    image: Image.asset(Assets.card),
                  ),
                  PaymentTile(
                    way: 'Оплата через МТС деньги',
                    image: Image.asset(Assets.wallet),
                  ),
                  PaymentTile(
                    way: 'Оплата ЕРИП',
                    image: Image.asset(Assets.erip),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
