class Product {
  final String name;
  final String details;
  final String size;
  final String colour;
  final num price;
  final int soldCount;
  final int id;
  final String icon;
  final String categoryName;

  Product({
    required this.name,
    required this.details,
    required this.size,
    required this.colour,
    required this.price,
    required this.soldCount,
    required this.id,
    required this.icon,
    required this.categoryName
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? 'No name',
      details: json['details'] ?? '',
      size: json['size'] ?? '',
      colour: json['colour'] ?? '',
      price: json['price'] ?? 0,
      soldCount: json['sold_count'] ?? 0,
      id: json['id'] ?? -1,
      icon: json['main_image'] ?? '',
      categoryName: json['category']?['name'] ?? ''
    );
  }
}
