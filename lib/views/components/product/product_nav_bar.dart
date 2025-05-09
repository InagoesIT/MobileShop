import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_shop/models/detailed_product.dart';
import 'package:mobile_shop/views/components/buttons/custom_elevated_button.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';

class ProductNavBar extends StatelessWidget {
  final DetailedProduct product;

  const ProductNavBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      height: 84 + MediaQuery.paddingOf(context).bottom,
      decoration: boxDecoration,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [buildPrice(primaryColor), buildAddButton(primaryColor)],
      ),
    );
  }

  Column buildPrice(Color primaryColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 21),
        Text(
          'PRICE',
          style: AppTextStyles.roboto12W400.copyWith(
            color: HexColor('#929292'),
          ),
        ),
        SizedBox(height: 2),
        Text(
          '\$${product.price}',
          style: AppTextStyles.roboto18W700.copyWith(color: primaryColor),
        ),
      ],
    );
  }

  BoxDecoration get boxDecoration {
    return BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: HexColor('#F4F4F4'),
          offset: Offset(0, -1),
          blurRadius: 20,
          spreadRadius: 0,
        ),
      ],
    );
  }

  Widget buildAddButton(Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: CustomElevatedButton(text: 'ADD'),
    );
  }
}
