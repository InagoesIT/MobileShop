import 'package:mobile_shop/models/product.dart';

class ProductResponse {
  final List<Product> products;
  final int totalPages;

  ProductResponse({required this.products, required this.totalPages});
}
