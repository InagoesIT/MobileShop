import 'package:flutter/material.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const SectionTitle({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.roboto18W700,
          overflow: TextOverflow.ellipsis,
        ),
        Spacer(),
        if (trailing != null) trailing!,
      ],
    );
  }
}
