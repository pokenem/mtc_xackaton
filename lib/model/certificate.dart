import 'category.dart';

enum CertificateType { money, service }

abstract class Certificate {
  const Certificate();

  String get title;

  int get cost;
}

class CertificateMoney extends Certificate {
  final Category category;
  final int amount;

  const CertificateMoney({
    required this.category,
    required this.amount,
  });

  @override
  int get cost => amount;

  @override
  String get title => category.name;
}

class CertificateService extends Certificate {
  final String serviceName;
  final String serviceId;
  final String name;
  final String description;
  final String imageLink;

  @override
  final int cost;

  const CertificateService({
    required this.serviceName,
    required this.serviceId,
    required this.name,
    required this.description,
    required this.imageLink,
    required this.cost,
  });

  CertificateService.fromJson(Map<String, dynamic> json)
      : cost = int.parse(json['cost']),
        name = json['name'],
        description = json['description'],
        imageLink = json['image'],
        serviceName = '',
        serviceId = '';

  @override
  String get title => name;
}
