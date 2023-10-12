import 'package:flutter/material.dart';
import 'package:mtc_xackaton/model/category.dart';

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

    if (!mounted) return;

    setState(() {
      certs = const [
        CertificateMoney(
          category: Category(id: '1', name: 'categ', imageLink: 'xui'),
          amount: 123,
        ),
        CertificateService(groupId: 'bababa', serviceId: 'bybyby', cost: 321),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: createAppBar(
        title: 'Мои сертификаты',
        hasBackButton: true,
        hasListButton: false,
      ),
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
                        for (Certificate cert in certs!)
                          CertificateTile(
                            title: cert.title,
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
