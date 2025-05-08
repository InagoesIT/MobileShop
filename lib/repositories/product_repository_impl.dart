import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_shop/models/product.dart';
import 'package:mobile_shop/repositories/product_repository.dart';
import 'package:mobile_shop/repositories/product_response.dart';

class ProductRepositoryImpl extends ProductRepository {
  final String bestSoldProductsUrl =
      'http://mobile-shop-api.hiring.devebs.net/products/best-sold-products';
  final String productsUrl =
      'http://mobile-shop-api.hiring.devebs.net/products';

  @override
  Future<ProductResponse> getBestSoldProducts({
    required int page,
    required int pageSize,
    String searchedText = '',
  }) async {
    Uri uri = Uri.parse(
      '$productsUrl?page=$page&pageSize=$pageSize&search=$searchedText',
    );
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Status code not ok.');
    }

    Map<dynamic, dynamic> data = json.decode(response.body);

    int totalPages = data["total_pages"];
    List<dynamic> products = data["results"];

    return ProductResponse(
      products: products.map((json) => Product.fromJson(json)).toList(),
      totalPages: totalPages,
    );
  }
}
