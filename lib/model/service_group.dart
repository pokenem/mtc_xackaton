import 'service.dart';

class ServiceGroup {
  final String id;
  final String name;

  final List<Service> services;

  const ServiceGroup({
    required this.id,
    required this.name,
    required this.services,
  });
}
