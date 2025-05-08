import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';

class BottomNavBarButton extends StatelessWidget {
  final bool isSelected;
  final String name;
  final String svgPath;

  const BottomNavBarButton({
    super.key,
    required this.isSelected,
    required this.name,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return buildTextAndDotButton();
    }
    return buildSvgButton();
  }

  Widget buildTextAndDotButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 32),
        Text(
          name,
          style: AppTextStyles.roboto14W700,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        SizedBox(height: 4),
        Container(
          height: 4,
          width: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget buildSvgButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: SizedBox.square(
        dimension: 32,
        child: SvgPicture.asset(svgPath, fit: BoxFit.cover),
      ),
    );
  }
}
