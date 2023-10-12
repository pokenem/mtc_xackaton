import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:mtc_xackaton/model/category.dart';
import 'package:mtc_xackaton/model/certificate.dart';
import 'package:mtc_xackaton/model/service_group.dart';

class APIProvider {
  APIProvider();

  static String baseUrl = 'http://143.198.157.158:8080';

  final Dio _dio = Dio();

  Future<List<Category>> getCategories() async {
    Response resp = await _dio.get('$baseUrl/category');

    List<Category> res = (resp.data['list'] as Iterable<dynamic>)
        .map<Category>((e) => Category.fromJson(e))
        .toList();
    res.sort((a, b) => int.parse(a.id) - int.parse(b.id));
    return res;
  }

  Future<List<ServiceGroup>> getServices() async {
    Response resp = await _dio.get('$baseUrl/service');

    return (resp.data['list'] as Iterable<dynamic>)
        .map<ServiceGroup>((e) => ServiceGroup.fromJson(e))
        .toList();
  }

  Future<List<Certificate>> getCertificates(String userId) async {
    Response resp = await _dio.get(
      '$baseUrl/certificate/',
      data: jsonEncode({
        'user_id': userId,
      }),
    );

    return (resp.data as Iterable<dynamic>).map<Certificate>((e) {
      if (e['type'] == 'service') {
        return CertificateService(
          serviceName: '',
          serviceId: '',
          name: e['parameters']['name'],
          description: '',
          imageLink: e['parameters']['image'],
          cost: int.parse(e['parameters']['cost']),
        );
      } else {
        return CertificateMoney(
          category: Category(
            id: '',
            name: e['parameters']['name'],
            imageLink: e['parameters']['image'],
          ),
          amount: int.parse(e['parameters']['cost']),
        );
      }
    }).toList();
  }
}
