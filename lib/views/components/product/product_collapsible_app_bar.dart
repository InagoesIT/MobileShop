import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/views/components/image_error.dart';
import 'package:mobile_shop/views/components/loading_image.dart';
import 'package:mobile_shop/views/components/buttons/svg_in_circle_button.dart';

class ProductCollapsibleAppBar extends StatelessWidget {
  final String imageUrl;

  const ProductCollapsibleAppBar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.sizeOf(context).height * 0.59,
      toolbarHeight: MediaQuery.sizeOf(context).height * 0.2,
      pinned: true,
      flexibleSpace: Stack(children: [buildImage(), buildIcons(context)]),
    );
  }

  Widget buildIcons(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 52, 16, 44),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildBackButton(context),
            SvgInCircleButton(
              svgUrl: 'assets/images/star.svg',
              circleColor: Colors.white,
              svgPadding: const EdgeInsets.all(9.33),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      behavior: HitTestBehavior.opaque,
      child: SizedBox.square(
        dimension: 24,
        child: SvgPicture.asset('assets/images/chevron-left.svg'),
      ),
    );
  }

  Widget buildImage() {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      imageUrl: imageUrl,
      placeholder: (_, _) => LoadingImage(padding: EdgeInsets.all(40)),
      errorWidget: (_, _, _) => ImageError(size: 20),
    );
  }
}
