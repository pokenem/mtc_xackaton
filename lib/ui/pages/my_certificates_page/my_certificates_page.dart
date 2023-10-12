import 'package:flutter/material.dart';

import 'package:mtc_xackaton/ui/pages/my_certificates_page/widgets/cerficate_tile.dart';
import 'package:mtc_xackaton/ui/widgets/app_bar.dart';

class CertificateX {
  Image? image;
  int cost;
  String name;

  CertificateX({this.image, required this.cost, required this.name});
}

List<CertificateX> ser = [
  CertificateX(cost: 10, name: 'НАЗВАНИЕ'),
  CertificateX(cost: 10, name: 'НАЗВАНИЕ'),
  CertificateX(cost: 10, name: 'НАЗВАНИЕ'),
  CertificateX(cost: 10, name: 'НАЗВАНИЕ'),
];

class MyCertificatesPage extends StatelessWidget {
  const MyCertificatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'Ваши сертификаты',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 23 / 20,
                      ),
                    ),
                  ),
                  for (dynamic it in ser)
                    CertificateTile(cost: it.cost, name: it.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
