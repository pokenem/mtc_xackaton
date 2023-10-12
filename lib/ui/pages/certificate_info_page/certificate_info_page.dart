import 'package:flutter/material.dart';
import 'package:mtc_xackaton/model/certificate.dart';
import 'package:mtc_xackaton/ui/widgets/app_bar.dart';

import '../../styles/app_color.dart';

class CertificateInfoPage extends StatelessWidget {
  final CertificateService cert;

  const CertificateInfoPage({
    super.key,
    required this.cert,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: createAppBar(
        hasListButton: true,
        hasBackButton: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: double.infinity,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Image.network(cert.imageLink),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,),
                    child: Text(
                      cert.name,
                      style: const TextStyle(
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        height: 23 / 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        cert.description,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: 'Arial',
                          height: 20 / 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Material(
                        color: AppColor.red,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            child: const Text(
                              'КУПИТЬ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Arial',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
