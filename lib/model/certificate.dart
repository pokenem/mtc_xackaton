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
  final String groupId;
  final String serviceId;

  @override
  final int cost;

  const CertificateService({
    required this.groupId,
    required this.serviceId,
    required this.cost,
  });

  @override
  String get title => serviceId;
}
