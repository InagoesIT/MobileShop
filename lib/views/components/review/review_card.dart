import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/models/review.dart';
import 'package:mobile_shop/views/components/image_error.dart';
import 'package:mobile_shop/views/components/loading_image.dart';
import 'package:mobile_shop/views/components/review/rating_stars.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildImage(),
        SizedBox(width: 32),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [buildNameAndRatingRow(), buildReviewMessage()],
          ),
        ),
      ],
    );
  }

  ClipRRect buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(23),
      child: CachedNetworkImage(
        height: 46,
        width: 46,
        imageUrl: review.image,
        placeholder: (_, _) => LoadingImage(padding: EdgeInsets.all(6)),
        errorWidget: (_, _, _) => ImageError(size: 32),
      ),
    );
  }

  Widget buildNameAndRatingRow() {
    return Row(
      children: [
        Text(
          '${review.firstName} ${review.lastName}',
          style: AppTextStyles.roboto14W700,
        ),
        Spacer(),
        RatingStars(stars: review.rating),
      ],
    );
  }

  Widget buildReviewMessage() {
    return Text(
      review.message,
      style: AppTextStyles.roboto14W400,
      textAlign: TextAlign.start,
    );
  }
}
