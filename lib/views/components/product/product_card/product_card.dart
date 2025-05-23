import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_shop/models/product.dart';
import 'package:mobile_shop/views/components/product/product_card/product_image.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final void Function(BuildContext, Product) onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(context, product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImage(product: product),
          SizedBox(height: 8),
          Text(
            product.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppTextStyles.roboto16W400,
          ),
          Text(
            product.details,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppTextStyles.roboto12W400.copyWith(
              color: HexColor('#929292'),
            ),
          ),
      
          SizedBox(height: 4),
          Text(
            '\$${product.price}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppTextStyles.roboto16W400.copyWith(
              color: HexColor('#00C569'),
            ),
          ),
        ],
      ),
    );
  }
}
