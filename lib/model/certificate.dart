enum CertificateType { money, service }

class Certificate {
  final CertificateType type;

  const Certificate({
    required this.type,
  });
}

class CertificateMoney extends Certificate {
  final String groupId;
  final int amount;

  const CertificateMoney({
    required this.groupId,
    required this.amount,
  }) : super(type: CertificateType.money);
}

class CertificateService extends Certificate {
  final String groupId;
  final String serviceId;
  final int cost;

  const CertificateService({
    required this.groupId,
    required this.serviceId,
    required this.cost,
  }) : super(type: CertificateType.money);
}
