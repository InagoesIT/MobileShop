import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/models/product.dart';
import 'package:mobile_shop/views/components/image_error.dart';
import 'package:mobile_shop/views/components/loading_image.dart';
import 'package:mobile_shop/views/components/buttons/svg_in_circle_button.dart';

class ProductImage extends StatelessWidget {
  final Product product;

  const ProductImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CachedNetworkImage(
              height: 240,
              fit: BoxFit.cover,
              imageUrl: product.image,
              placeholder: buildLoadingImage,
              errorWidget: buildImageError,
            ),
          ),
          buildFavoriteButton(),
        ],
      ),
    );
  }

  Positioned buildFavoriteButton() {
    return Positioned(
      right: 8,
      top: 8,
      child: SvgInCircleButton(
        svgUrl: 'assets/images/star.svg',
        circleColor: Colors.white,
        svgPadding: const EdgeInsets.all(7.0),
        buttonSize: Size.square(30),
      ),
    );
  }

  Widget buildImageError(context, url, error) => ImageError(size: 60);

  Widget buildLoadingImage(context, url) => LoadingImage(
    padding: EdgeInsets.symmetric(horizontal: 55, vertical: 100),
  );
}
