import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';

class InfoCircle extends StatelessWidget {
  final String name;
  final Widget? trailing;
  final String details;

  const InfoCircle({
    super.key,
    required this.name,
    this.details = '',
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: boxDecoration,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        spacing: 6,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              name,
              style: AppTextStyles.roboto14W400,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Flexible(flex: 2, child: trailing ?? buildDetailsText()),
        ],
      ),
    );
  }

  Text buildDetailsText() {
    return Text(
      details!,
      style: AppTextStyles.roboto14W700,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.end,
      maxLines: 1,
    );
  }

  BoxDecoration get boxDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      border: Border.all(color: HexColor('#EBEBEB'), width: 1),
    );
  }
}
