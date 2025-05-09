import 'package:flutter/material.dart';
import 'package:mobile_shop/models/detailed_product.dart';
import 'package:mobile_shop/view_models/product_details_view_model.dart';
import 'package:mobile_shop/views/components/color_circle.dart';
import 'package:mobile_shop/views/components/error_page.dart';
import 'package:mobile_shop/views/components/info_circle.dart';
import 'package:mobile_shop/views/components/product/product_collapsible_app_bar.dart';
import 'package:mobile_shop/views/components/product/product_details.dart';
import 'package:mobile_shop/views/components/product/product_nav_bar.dart';
import 'package:mobile_shop/views/components/review/reviews_list.dart';
import 'package:mobile_shop/views/components/review/reviews_title.dart';
import 'package:mobile_shop/views/styling/app_text_styles.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductDetailsViewModel>();

    return Scaffold(
      body: buildBody(context, viewModel),
      bottomNavigationBar:
          viewModel.isLoading || viewModel.product == null
              ? SizedBox()
              : ProductNavBar(product: viewModel.product!),
    );
  }

  Widget buildBody(BuildContext context, ProductDetailsViewModel viewModel) {
    if (viewModel.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (viewModel.product == null) {
      return ErrorPage(
        message: 'Failed to load product details',
        onRetry: () => viewModel.fetchProductById(),
      );
    }
    DetailedProduct product = viewModel.product!;
    return buildLoadedContent(product, viewModel);
  }

  CustomScrollView buildLoadedContent(DetailedProduct product, ProductDetailsViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        ProductCollapsibleAppBar(imageUrl: product.image),
        SliverPadding(padding: EdgeInsets.only(bottom: 16)),
        SliverToBoxAdapter(child: buildTitle(product.name)),
        SliverPadding(padding: EdgeInsets.only(bottom: 28)),
        SliverToBoxAdapter(child: buildSizeAndColour(product, viewModel)),
        SliverToBoxAdapter(child: ProductDetails(product)),
        SliverPadding(padding: EdgeInsets.only(bottom: 44)),
        SliverToBoxAdapter(child: ReviewsTitle()),
        ReviewsList(reviews: product.reviews),
        SliverPadding(padding: EdgeInsets.only(bottom: 32)),
      ],
    );
  }

  Widget buildTitle(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.roboto26W700,
      ),
    );
  }

  Widget buildSizeAndColour(
    DetailedProduct product,
    ProductDetailsViewModel viewModel
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 28, 16, 36),
      child: Row(
        spacing: 23,
        children: [
          Expanded(child: InfoCircle(name: 'Size', details: product.size)),
          Expanded(
            child: InfoCircle(
              name: 'Colour',
              trailing: ColorCircle(color: viewModel.getItemColor()),
            ),
          ),
        ],
      ),
    );
  }
}
