import 'package:flutter/material.dart';
import 'package:mobile_shop/view_models/product_details_view_model.dart';
import 'package:mobile_shop/views/components/error_page.dart';
import 'package:mobile_shop/views/components/product/product_collapsible_app_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductDetailsViewModel>();

    return Scaffold(body: buildBody(viewModel));
  }

  Widget buildBody(ProductDetailsViewModel viewModel) {
    if (viewModel.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (viewModel.product == null) {
      return ErrorPage(
        message: 'Failed to load product details',
        onRetry: () => viewModel.fetchProductById(),
      );
    }
    return CustomScrollView(
      slivers: [ProductCollapsibleAppBar(imageUrl: viewModel.product!.image)],
    );
  }
}
