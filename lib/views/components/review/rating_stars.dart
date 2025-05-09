import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingStars extends StatelessWidget {
  final int stars;

  const RatingStars({super.key, required this.stars});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 8,
      children: [for (int i = 0; i < stars; i++) buildStar()],
    );
  }

  Widget buildStar() {
    return SizedBox.square(
      dimension: 18,
      child: SvgPicture.asset('assets/images/filled_star.svg'),
    );
  }
}
