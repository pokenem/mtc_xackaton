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

  ServiceGroup.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        services = (json['sub_services'] as Iterable)
            .map<CertificateService>((e) => CertificateService.fromJson(e))
            .toList() {}
}
