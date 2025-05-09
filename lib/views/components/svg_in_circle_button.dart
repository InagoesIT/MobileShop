import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgInCircleButton extends StatelessWidget {
  final String svgUrl;
  final Color circleColor;
  final EdgeInsets svgPadding;
  final Size? buttonSize;
  final void Function()? onTap;

  const SvgInCircleButton({
    super.key,
    required this.svgUrl,
    required this.circleColor,
    required this.svgPadding,
    this.buttonSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: buttonSize?.width ?? 40,
        height: buttonSize?.height ?? 40,
        decoration: BoxDecoration(
          color: circleColor,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(padding: svgPadding, child: SvgPicture.asset(svgUrl)),
      ),
    );
  }
}
