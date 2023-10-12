import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mtc_xackaton/model/category.dart';

class APIProvider {
  APIProvider();

  static String baseUrl = 'http://143.198.157.158:8080';

  final Dio _dio = Dio();

  Future<List<Category>> getCategories() async {
    Response resp = await _dio.get('$baseUrl/category');

    return (resp.data['list'] as Iterable<dynamic>)
        .where((e) => e['name'] != 'Все' || e['sum'] == -1)
        .map<Category>((e) => Category.fromJson(e))
        .toList();
  }
}
