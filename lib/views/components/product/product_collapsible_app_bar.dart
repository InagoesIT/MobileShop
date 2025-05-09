import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop/views/components/image_error.dart';
import 'package:mobile_shop/views/components/loading_image.dart';
import 'package:mobile_shop/views/components/svg_in_circle_button.dart';

class ProductCollapsibleAppBar extends StatelessWidget {
  final String imageUrl;

  const ProductCollapsibleAppBar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 480,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            buildImage(),
            SafeArea(
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

  Widget _buildIcon(
    BuildContext context,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black45,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget buildImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (_, _) => LoadingImage(padding: EdgeInsets.all(40)),
      errorWidget: (_, _, _) => ImageError(size: 20),
    );
  }
}
