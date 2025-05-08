import 'package:flutter/material.dart';
import 'package:mobile_shop/models/product.dart';
import 'package:mobile_shop/views/components/product_card/product_card.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;

  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double itemWidth = (screenWidth / 2) - (32 + 15);
    double childAspectRatio = itemWidth / 280;

    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return ProductCard(product: products[index]);
      }, childCount: products.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 28,
        crossAxisSpacing: 15,
        childAspectRatio: childAspectRatio,
      ),
    );
  }
}
