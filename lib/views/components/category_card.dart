import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_shop/models/category.dart';
import 'package:mobile_shop/views/components/image_error.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final void Function(Category) onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(category),
      child: SizedBox(
        width: 60,
        child: Column(spacing: 14, children: [buildyImage(), buildName()]),
      ),
    );
  }

  Widget buildyImage() {
    return Container(
      height: 60,
      decoration: imageBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: imageBorderRadius,
          child: CachedNetworkImage(
            imageUrl: category.icon,
            placeholder: buildLoadingImage,
            errorWidget: buildImageError,
          ),
        ),
      ),
    );
  }

  BoxDecoration get imageBoxDecoration {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: imageBorderRadius,
      boxShadow: [
        BoxShadow(
          blurRadius: 20,
          spreadRadius: 0,
          offset: Offset(0, 6),
          color: HexColor('#F4F4F4'),
        ),
      ],
    );
  }

  Widget buildImageError(BuildContext cotext, String url, Object error) {
    return ImageError(size: 20);
  }

  Widget buildLoadingImage(context, url) => CircularProgressIndicator(
    padding: EdgeInsets.all(18),
    strokeWidth: 2,
    color: HexColor('#a8a7a7'),
  );

  BorderRadius get imageBorderRadius => BorderRadius.circular(30);

  Widget buildName() {
    return Text(
      category.name,
      textAlign: TextAlign.center,
      style:
          isSelected ? AppTextStyles.roboto12W600 : AppTextStyles.roboto12W400,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
