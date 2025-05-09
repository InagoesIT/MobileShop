import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_shop/views/components/svg_in_circle_button.dart';

class ProductsSearchBar extends StatefulWidget {
  final ValueChanged<String> onSearch;

  const ProductsSearchBar({super.key, required this.onSearch});

  @override
  State<ProductsSearchBar> createState() => _ProductsSearchBarState();
}

class _ProductsSearchBarState extends State<ProductsSearchBar> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 13,
      children: [
        Expanded(child: buildTextField()),
        SvgInCircleButton(
          svgUrl: 'assets/images/camera.svg',
          circleColor: Theme.of(context).primaryColor,
          svgPadding: EdgeInsets.all(8),
        ),
      ],
    );
  }

  Widget buildTextField() {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        onChanged: widget.onSearch,
        cursorHeight: 20,
        cursorColor: HexColor('#00C569'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 12.0),
          filled: true,
          prefixIcon: buildSearchIcon(),
          prefixIconConstraints: BoxConstraints.tight(Size(48, 24)),
          fillColor: HexColor('#F7F7F7'),
          border: textFieldBorder,
          enabledBorder: textFieldBorder,
          focusedBorder: textFieldBorder,
        ),
      ),
    );
  }

  Padding buildSearchIcon() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 8),
      child: SvgPicture.asset('assets/images/search.svg', fit: BoxFit.contain),
    );
  }

  OutlineInputBorder get textFieldBorder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide.none,
    );
  }
}
