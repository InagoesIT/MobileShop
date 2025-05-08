import 'package:flutter/material.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const CustomTextButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Text(text, style: AppTextStyles.roboto16W400),
    );
  }
}
