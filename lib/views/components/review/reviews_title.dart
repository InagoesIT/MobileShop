import 'package:flutter/material.dart';
import 'package:mobile_shop/views/components/buttons/custom_text_button.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';

class ReviewsTitle extends StatelessWidget {

  const ReviewsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reviews', style: AppTextStyles.roboto18W700),
          SizedBox(height: 8),
          CustomTextButton(
            text: 'Write your',
            textStyle: AppTextStyles.roboto14W500.copyWith(color: primaryColor),
          ),
          SizedBox(height: 32),
          
        ],
      ),
    );
  }
}
