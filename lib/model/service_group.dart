import 'package:mtc_xackaton/model/certificate.dart';

class ServiceGroup {
  final String id;
  final String name;

  final List<CertificateService> services;

  const ServiceGroup({
    required this.id,
    required this.name,
    required this.services,
  });
}
