import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mtc_xackaton/model/category.dart';

import 'package:mtc_xackaton/ui/pages/my_certificates_page/widgets/cerficate_tile.dart';
import 'package:mtc_xackaton/ui/widgets/app_bar.dart';

import '../../../data/api_provider.dart';
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
    certs = await GetIt.I.get<APIProvider>().getCertificates('2');

    if (!mounted) return;

    setState(() {});
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
                            image: cert is CertificateService
                                ? cert.imageLink
                                : (cert as CertificateMoney).category.imageLink,
                            isShare: true,
                            onTap: () {},
                          ),
                        const SizedBox(height: 20),
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
