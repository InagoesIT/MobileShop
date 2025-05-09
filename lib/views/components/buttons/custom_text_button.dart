import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final TextStyle textStyle;

  const CustomTextButton({super.key, required this.text, this.onTap, required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Text(text, style: textStyle),
    );
  }
}
