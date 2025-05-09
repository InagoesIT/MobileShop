import 'package:flutter/material.dart';
import 'package:mobile_shop/models/detailed_product.dart';
import 'package:mobile_shop/views/components/buttons/custom_text_button.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';

class ProductDetails extends StatelessWidget {
  final DetailedProduct product;

  const ProductDetails(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Details', style: AppTextStyles.roboto18W700),
          Text(
            product.details,
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: AppTextStyles.roboto14W400,
          ),
          CustomTextButton(
            text: 'Read More',
            textStyle: AppTextStyles.roboto14W500.copyWith(color: primaryColor),
          ),
        ],
      ),
    );
  }
}
