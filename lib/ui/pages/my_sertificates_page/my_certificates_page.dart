import 'package:flutter/material.dart';
import 'package:mtc_xackaton/ui/pages/my_sertificates_page/widgets/cerficate_tile.dart';
import 'package:mtc_xackaton/ui/widgets/app_bar.dart';

class Certificate {
  Image? image;
  int cost;
  String name;

  Certificate({this.image, required this.cost, required this.name});
}

List<Certificate> ser = [Certificate(cost: 10, name: 'НАЗВАНИЕ'),Certificate(cost: 10, name: 'НАЗВАНИЕ'),Certificate(cost: 10, name: 'НАЗВАНИЕ'),Certificate(cost: 10, name: 'НАЗВАНИЕ')];

class MyCertificatesPage extends StatelessWidget {
  const MyCertificatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(hasBackButton: false, hasListButton: false),
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
                  for (dynamic it in ser) CertificateTile(cost: it.cost, name: it.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}