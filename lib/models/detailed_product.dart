import 'package:mobile_shop/models/product.dart';
import 'package:mobile_shop/models/review.dart';

class DetailedProduct extends Product {
  final List<Review> reviews;

  DetailedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.categoryName,
    required super.details,
    required super.size,
    required super.color,
    required super.image,
    required super.soldCount,
    required this.reviews,
  });

  factory DetailedProduct.fromJson(Map<String, dynamic> json) {
    final product = Product.fromJson(json);

    final reviews =
        (json['reviews'] as List)
            .map((reviewJson) => Review.fromJson(reviewJson))
            .toList();

    return DetailedProduct(
      id: product.id,
      name: product.name,
      image: product.image,
      price: product.price,
      categoryName: product.categoryName,
      details: product.details,
      size: product.size,
      color: product.color,
      soldCount: product.soldCount,
      reviews: reviews,
    );
  }
}
