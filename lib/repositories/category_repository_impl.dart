import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_shop/models/category.dart';
import 'package:mobile_shop/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  static const String apiUrl =
      'http://mobile-shop-api.hiring.devebs.net/categories';
  final http.Client client;

  CategoryRepositoryImpl({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<List<Category>> getCategories() async {
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode != 200) {
      throw Exception('Status code not ok.');
    }
    final Map<dynamic, dynamic> jsonData = jsonDecode(response.body);
    final List<dynamic> categories = jsonData["results"];
    return categories.map((item) => Category.fromJson(item)).toList();
    
  }
}
