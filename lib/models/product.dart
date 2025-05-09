class Product {
  final String name;
  final String details;
  final String size;
  final String color;
  final num price;
  final int soldCount;
  final int id;
  final String image;
  final String categoryName;

  Product({
    required this.name,
    required this.details,
    required this.size,
    required this.color,
    required this.price,
    required this.soldCount,
    required this.id,
    required this.image,
    required this.categoryName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? 'No name',
      details: json['details'] ?? '',
      size: json['size'] ?? '',
      color: json['colour'] ?? '',
      price: json['price'] ?? 0,
      soldCount: json['sold_count'] ?? 0,
      id: json['id'] ?? -1,
      image: json['main_image'] ?? '',
      categoryName: json['category']?['name'] ?? '',
    );
  }
}
