import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_shop/views/components/bottom_nav_bar_button.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84 + MediaQuery.paddingOf(context).bottom,
      decoration: boxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 56),
          BottomNavBarButton(isSelected: true, svgPath: '', name: 'Explore'),
          Spacer(),
          BottomNavBarButton(
            isSelected: false,
            svgPath: 'assets/images/cart.svg',
            name: 'Cart',
          ),
          Spacer(),
          BottomNavBarButton(
            isSelected: false,
            svgPath: 'assets/images/user.svg',
            name: 'Profile',
          ),
          SizedBox(width: 56),
        ],
      ),
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
}
