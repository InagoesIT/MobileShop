import 'package:flutter/material.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onTap;
  final EdgeInsets? padding;
  final String text;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 58, vertical: 16),
        child: Text(
          text,
          style: AppTextStyles.roboto14W400.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
