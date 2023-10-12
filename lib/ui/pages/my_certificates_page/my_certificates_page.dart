import 'package:flutter/material.dart';

import 'package:mtc_xackaton/ui/pages/my_certificates_page/widgets/cerficate_tile.dart';
import 'package:mtc_xackaton/ui/widgets/app_bar.dart';

import '../../../model/certificate.dart';

class MyCertificatesPage extends StatefulWidget {
  const MyCertificatesPage({super.key});

  @override
  State<MyCertificatesPage> createState() => _MyCertificatesPageState();
}

class _MyCertificatesPageState extends State<MyCertificatesPage> {
  List<Certificate>? certs;

  @override
  void initState() {
    super.initState();

    load();
  }

  Future<void> load() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      certs = const [
        CertificateMoney(groupId: 'bebebe', amount: 123),
        CertificateService(groupId: 'bababa', serviceId: 'bybyby', cost: 321),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(hasBackButton: true, hasListButton: false),
      body: SafeArea(
        child: certs != null
            ? ListView(
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
                        for (Certificate cert in certs!)
                          cert is CertificateMoney
                              ? CertificateTile(
                                  title: cert.groupId,
                                  cost: cert.amount,
                                  onTap: () {},
                                )
                              : CertificateTile(
                                  title: (cert as CertificateService).serviceId,
                                  cost: cert.cost,
                                  onTap: () {},
                                ),
                      ],
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(color: Color(0xFFE30611)),
              ),
      ),
    );
  }
}
