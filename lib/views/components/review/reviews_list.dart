import 'package:flutter/material.dart';
import 'package:mobile_shop/models/review.dart';
import 'package:mobile_shop/views/components/review/review_card.dart';

class ReviewsList extends StatelessWidget {
  final List<Review> reviews;

  const ReviewsList({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return SliverToBoxAdapter(child: Center(child: Text('No reviews')));
    }
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final itemIndex = index ~/ 2;

          if (index.isEven) {
            return ReviewCard(review: reviews[itemIndex]);
          } else {
            return SizedBox(height: 32);
          }
        }, childCount: reviews.length * 2 - 1),
      ),
    );
  }
}
